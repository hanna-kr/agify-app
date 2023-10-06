import 'dart:convert';
import 'package:agify_app/core/data/remote_data_source.dart';
import 'package:agify_app/core/presentation/styles/button_styles.dart';
import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:agify_app/core/presentation/styles/spacing_styles.dart';
import 'package:agify_app/core/presentation/styles/text_styles.dart';
import 'package:agify_app/core/presentation/widgets/primary_button.dart';
import 'package:agify_app/features/age_predictor/domain/user_model.dart';
import 'package:flutter/material.dart';

class AgePredictorPage extends StatefulWidget {
  const AgePredictorPage({super.key});

  @override
  State<AgePredictorPage> createState() => _AgePredictorPageState();
}

class _AgePredictorPageState extends State<AgePredictorPage> {
  final TextEditingController textController = TextEditingController();
  String name = '';
  bool isLoading = false;

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<User> fetchAge(String name) async {
    setState(() {
      isLoading = true;
    });

    try {
      Uri url = Uri.parse('https://api.agify.io?name=$name');
      dynamic responseData = await remoteDataSource.getData(url.toString());
      var jsonResponse = jsonDecode(responseData);
      if (jsonResponse != null) {
        setState(() {
          isLoading = false;
        });
        return User.fromJson(jsonResponse);
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Userdaten konnten nicht geladen werden');
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      rethrow;
    }
  }

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
                  style: kSecondaryButtonStyle,
                  child: const Text('beenden'),
                  onPressed: () {
                    resetText();
                    Navigator.of(dialogContext)
                        .popUntil((route) => route.isFirst);
                  },
                ),
                ElevatedButton(
                  style: kPrimaryButtonStyle,
                  child: const Text('nochmal'),
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
          title: const Text('Error'),
          titlePadding: const EdgeInsets.all(8.0),
          content: const Text('Userdaten konnten nicht geladen werden'),
          contentPadding: const EdgeInsets.all(8.0),
          actions: <Widget>[
            ElevatedButton(
              style: kPrimaryButtonStyle,
              child: const Text('OK'),
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
