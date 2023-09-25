
import 'package:siwes_project/contstants/strings.dart';

class OnBoardItem {
  final String header, description, image;

  OnBoardItem({
    required this.header,
    required this.description,
    required this.image,
  });
}

List<OnBoardItem> onBoardingPages = [
  OnBoardItem(
      header: 'Review for vendors and Bussiness',
      description:
          'This is a simple way to review vendors in your area and also see the reviews they have from previous customers',
      image: ProjectStrings.onboardingImage1),
  OnBoardItem(
      header: 'Rate Businesses after transaction',
      description:
          'This is a simple way to review vendors in your area and also see the reviews they have from previous customers',
      image: ProjectStrings.onboardingImage2),
  OnBoardItem(
      header: 'Choose vendors based on reviews',
      description:
          'This is a simple way to review vendors in your area and also see the reviews they have from previous customers',
      image: ProjectStrings.onboardingImage3),
];

