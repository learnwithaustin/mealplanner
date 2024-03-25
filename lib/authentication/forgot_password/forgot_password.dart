import 'package:shreyas/authentication/forgot_password/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:shreyas/constants/sizes.dart';
import '../../constants/text.dart';
import 'forgot_password_button.dart';
import 'forgot_pasword_mail.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tForgetPasswordTitle,
                  style: Theme.of(context).textTheme.displayMedium),
              Text(tForgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30.0),
              ForgetPasswordBtnWidget(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const ForgetPasswordMailScreen()));
                },
                title: tEmail,
                subTitle: tResetViaEMail,
                btnIcon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: 20.0),
              ForgetPasswordBtnWidget(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const OTPScreen()));
                },
                title: tPhoneNo,
                subTitle: tResetViaPhone,
                btnIcon: Icons.mobile_friendly_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}