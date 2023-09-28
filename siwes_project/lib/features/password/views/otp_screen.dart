import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:siwes_project/common_widgets/app_button.dart';
import 'package:siwes_project/common_widgets/otp_field.dart';
import 'package:siwes_project/contstants/constants.dart';
import 'package:siwes_project/features/password/provider/otp_provider.dart';
import 'package:siwes_project/features/password/views/setnewpassword.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.read(countdownTimerProvider.notifier).startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ref.invalidate(countdownTimerProvider);
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final count = ref.watch(countdownTimerProvider);
    return Scaffold(
      body: Padding(
        padding: ProjectConstants.generalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'OTP Verification',
              style: GoogleFonts.georama(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            ProjectConstants.regSpacing,
            Text(
              'Enter the OTP sent to - abcdefghi@gmail.com',
              style: GoogleFonts.georama(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            ProjectConstants.regSpacing,
           
            OtpField(
              numberOfFields: 4,
             // showFieldAsBox: true,
              
            ),
            ProjectConstants.regSpacing,
            Text('00:${count.inSeconds} sec'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn’t receive code ?"),
                TextButton(
                  onPressed: () {
                    if (count == Duration.zero) {
                      // ignore: unused_local_variable
                      final nevValue = ref.refresh(countdownTimerProvider);
                      // TODO add logic to resend otp
                      log('OTP resent');
                      ref.read(countdownTimerProvider.notifier).startTimer();
                    } else {
                      log("Can't resend otp ");
                      return;
                    }
                  },
                  child: const Text('Re-send'),
                ),
              ],
            ),
            ProjectConstants.regSpacing,
            AppButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const SetNewPassword())),
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
