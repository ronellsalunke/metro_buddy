import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static void urlLauncher(BuildContext context, String? link) {
    if (link == null || link.isEmpty) {
      return;
    }

    final Uri url = Uri.parse(link);
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  static String generateWhatsAppUrl(String phoneNumber) {
    final cleanedNumber = phoneNumber.replaceAll('+', '');
    return 'https://wa.me/$cleanedNumber';
  }
}
