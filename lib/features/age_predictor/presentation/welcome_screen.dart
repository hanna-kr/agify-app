import 'package:agify_app/core/presentation/styles/color_styles.dart';
import 'package:agify_app/core/presentation/styles/position_styles.dart';
import 'package:agify_app/core/presentation/styles/spacing_styles.dart';
import 'package:agify_app/core/presentation/styles/text_styles.dart';
import 'package:agify_app/core/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Padding(
        padding: PaddingAll.l,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Column(
                  children: [
                    const Text(
                      "Willkommen bei Agify, der App, die dein Alter anhand deines Namens enthüllt!",
                      style: MyTextStyle.headline2,
                    ),
                    SpacingV.xl,
                    Image.asset('assets/images/agifyperson.jpg'),
                    const Text(
                      'Hast du dich jemals gefragt, ob dein Name einen Hinweis auf dein Alter gibt? Mit Agify kannst du jetzt deine Neugier befriedigen. Gib einfach deinen Namen ein und Agify wird seine magischen Kräfte nutzen, um das vermutete Alter deines Namens zu enthüllen.',
                      style: MyTextStyle.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                  text: "Los Geht's",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  })
            ]),
      ),
    );
  }
}
