import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Policy_Dialog.dart';

class TermsAndCondtions extends StatelessWidget {
  const TermsAndCondtions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "By creating an account, you are agreeing to our\n",
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: "Terms & Conditions ",
                style: TextStyle(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showModal(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(),
                      builder: (context) {
                        return PolicyDialog(
                          mdFileName: 'TermsCondition.md',
                        );
                      },
                    );
                  },
              ),
              TextSpan(text: "and "),
              TextSpan(
                text: "Privacy Policy! ",
                style: TextStyle(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PolicyDialog(
                          mdFileName: 'privacy_policy.md',
                        );
                      },
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}