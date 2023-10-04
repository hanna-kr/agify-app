import 'dart:convert';
import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:agify_app/core/presentation/styles/spacing_styles.dart';
import 'package:agify_app/core/presentation/styles/text_styles.dart';
import 'package:agify_app/core/presentation/widgets/primary_button.dart';
import 'package:agify_app/features/age_predictor/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgePredictorPage extends StatefulWidget {
  const AgePredictorPage({super.key});

  @override
  State<AgePredictorPage> createState() => _AgePredictorPageState();
}

class _AgePredictorPageState extends State<AgePredictorPage> {
  final TextEditingController textController = TextEditingController();
  String name = '';
  bool isLoading = false;

  void setText() {
    setState(() {
      name = textController.text;
      debugPrint(name);
    });
  }

  void resetText() {
    setState(() {
      textController.clear();
    });
  }

  Future<User> fetchAge(String name) async {
    setState(() {
      isLoading = true;
    });

    Uri url = Uri.parse('https://api.agify.io?name=$name');
    http.Response response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse != null) {
      setState(() {
        isLoading = false;
      });
      return User.fromJson(jsonResponse);
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to fetch user data');
    }
  }

  void showResult(User user) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(user.name),
          titlePadding: const EdgeInsets.all(8.0),
          content: Text('Wow! Du bist ${user.age} Jahre alt!'),
          contentPadding: const EdgeInsets.all(8.0),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text('beenden'),
                  onPressed: () {
                    resetText();
                    Navigator.of(dialogContext)
                        .popUntil((route) => route.isFirst);
                  },
                ),
                ElevatedButton(
                  child: Text('nochmal'),
                  onPressed: () {
                    resetText();
                    Navigator.of(dialogContext).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Error'),
          titlePadding: const EdgeInsets.all(8.0),
          content: Text('Failed to fetch user data'),
          contentPadding: const EdgeInsets.all(8.0),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void fetchAgeAndShowResult() async {
    setText();
    try {
      User user = await fetchAge(name);
      showResult(user);
    } catch (e) {
      showErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Was denkst du wie alt dich dein Name wirklich macht?",
                      style: MyTextStyle.headline2,
                      textAlign: TextAlign.center,
                    ),
                    SpacingH.m,
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: 'Dein Name',
                        labelStyle: MyTextStyle.body,
                        hintText: 'Hier kannst du deinen Namen eintragen',
                        hintStyle: MyTextStyle.hintText,
                      ),
                    ),
                    SpacingH.m,
                    PrimaryButton(
                      text: 'Entdecke dein Alter',
                      isLoading: isLoading,
                      onPressed: fetchAgeAndShowResult,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
