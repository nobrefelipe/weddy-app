import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';
import 'package:weddy/app/shared/widgets/logo.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  const OnboardingPage({Key key, this.title = "Onboarding"}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/onboarding_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
                Welcome to weddy
              */
            intro(),
            SizedBox(height: 60),
            ctas(context)
          ],
        ),
      ),
    );
  }

  /*
    Welcome to weddy
  */
  Widget intro() {
    return Column(
      children: [
        Text(
          "Welcome to",
          style: AppStyles.h3,
        ),
        Transform.scale(
          scale: 1.8,
          child: WeddayLogo(),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "The easiest way to share \npictures of an wedding.",
          style: AppStyles.h4,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget ctas(ctx) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          CupertinoButton.filled(
            child: Text("I am a guest"),
            borderRadius: BorderRadius.circular(40),
            onPressed: () => Navigator.of(context).pushNamed("/auth/login"),
          ),
          SizedBox(height: 15),
          CupertinoButton.filled(
            child: Text("I am a broom"),
            borderRadius: BorderRadius.circular(40),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
