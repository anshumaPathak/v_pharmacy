// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static launchWhatsApp(context, String phone) async {
    var whatsAppUrlAndroid =
        'whatsapp://send?phone=+91$phone&text=hello';
    if (await canLaunchUrl(Uri.parse(whatsAppUrlAndroid))) {
      await launchUrl(Uri.parse(whatsAppUrlAndroid));
    } else {
     debugPrint("whatsapp not installed");
    }
  }

  static launchDialPad(context, String phone) async {
    var phoneCall = "tel:+91$phone";
    if (await canLaunchUrl(Uri.parse(phoneCall))) {
      await launchUrl(Uri.parse(phoneCall));
    } else {
      debugPrint("Number Busy");
    }
  }

  static launchEmail(context, String email) async {
    var callEmail = "mailto:$email";
    if (await canLaunchUrl(Uri.parse(callEmail))) {
      await launchUrl(Uri.parse(callEmail));
    } else {
      debugPrint("email not login");
    }
  }

  static launchOnWeb(context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint("url not found");
    }
  }
}