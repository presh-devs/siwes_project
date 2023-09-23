import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siwes_project/contstants/constants.dart';
import 'package:siwes_project/contstants/strings.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:ProjectConstants.generalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset(ProjectStrings.onboardingImage1),
          Align(
            alignment: Alignment.center,
            child: const Text('Review for vendords and Bussiness', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),)),
          const Text('This is a simple way to review vendors in your area and also see the reviews they have from previous customers'),
        ],),
      ),
    );
  }
}