
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siwes_project/contstants/colors.dart';
import 'package:siwes_project/contstants/constants.dart';

Future shoWSuccessBottomSheet(
    {required BuildContext context,
    required String title,
    required String buttonText,
    bool isDismissible = false,
    required VoidCallback onPressed,
    String? contextText}) {
  return showModalBottomSheet(
      isScrollControlled: false,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.4,
          decoration: const BoxDecoration(
            color: ProjectColors.primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              SvgPicture.asset(
                'assets/icons/successfulsuccess.svg',
                height: 80,
                width: 80,
              ),
              ProjectConstants.largeSpacing,
              Text(
                title,
                style: GoogleFonts.georama(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              contextText == null
                  ? const SizedBox.shrink()
                  : ProjectConstants.largeSpacing,
              contextText == null
                  ? const SizedBox.shrink()
                  : Text(
                      contextText,
                      style: GoogleFonts.georama(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
              TextButton(
                  onPressed:onPressed,
                  child: Text(
                    buttonText,
                    style: GoogleFonts.georama(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: ProjectColors.primaryGreen),
                  ))
            ],
          ),
        );
      });
}
