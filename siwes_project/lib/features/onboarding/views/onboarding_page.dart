import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siwes_project/common_widgets/app_button.dart';
import 'package:siwes_project/contstants/colors.dart';

import 'package:siwes_project/contstants/constants.dart';

import 'package:siwes_project/features/onboarding/domain/onboarding_model.dart';
import 'package:siwes_project/features/onboarding/provider/onboarding_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = ref.watch(pageProvider);
    return Scaffold(
      body: Padding(
        padding: ProjectConstants.generalPadding,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onBoardingPages.length,
                physics: const NeverScrollableScrollPhysics(),
                //onPageChanged: (value) => ref.read(pageProvider.notifier).changePage(),
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(onBoardingPages[currentPage].image),
                    ProjectConstants.largeSpacing,
                    Text(
                      onBoardingPages[currentPage].header,
                      style: GoogleFonts.georama(
                          fontSize: 30, fontWeight: FontWeight.w700),
                      //  const TextStyle(
                      //     fontSize: 24, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    ProjectConstants.largeSpacing,
                    Text(
                      onBoardingPages[index].description,
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: const SlideEffect(
                  spacing: 30.0,
                  radius: 8.0,
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: ProjectColors.primaryGreen,
                  activeDotColor: ProjectColors.primaryGreen),
              onDotClicked: (index) {
                ref.read(pageProvider.notifier).dotClicked(index);
              },
            ),
            ProjectConstants.largeSpacing,
            AppButton(
                child: const SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Next',style: TextStyle(fontSize: 14, fontWeight: 
                      FontWeight.w700),),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                onPressed: () {
                  if (currentPage < 2) {
                    ref.read(pageProvider.notifier).changePage();
                  }
                  // Navigate to sign up screen
                }),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Skip and continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
