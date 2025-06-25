import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail({String email = "support@lepster.com"}) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': 'Support Request',
      'body': 'Hello Lepster Team,\n\nI need assistance with...',
    },
  );

  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch email client.');
    }
  } catch (e) {
    debugPrint('Error launching email: $e');
  }
}

Future<void> launchWhatsApp({String phone = "918587968190"}) async {
  final whatsappUrl = Uri.parse(
    "https://wa.me/$phone?text=Hello%20Lepster%20Team",
  );

  debugPrint("Trying to launch WhatsApp: $whatsappUrl");

  if (await canLaunchUrl(whatsappUrl)) {
    final launched = await launchUrl(
      whatsappUrl,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      debugPrint("WhatsApp launch failed.");
    }
  } else {
    debugPrint("WhatsApp is not installed or URL can't be launched.");
  }
}

void makePhoneCall({phone = "+918587968190"}) async {
  final phoneUri = Uri(scheme: 'tel', path: phone);
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  }
}
