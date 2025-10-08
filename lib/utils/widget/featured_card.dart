// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../res/const_color.dart';
//
// class FeaturesSection extends StatelessWidget {
//   const FeaturesSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;
//
//     return Container(
//       width: double.infinity,
//       color: AppColor.lightWhiteColor,
//       padding: EdgeInsets.symmetric(
//         vertical: isMobile ? 40 : 60,
//         horizontal: isMobile ? 20 : 40,
//       ),
//       child: isMobile
//           ? Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const [
//           FeatureCard(
//             icon: Icons.verified_user,
//             title: "Verified Medicines",
//             subtitle:
//             "All medicines are thoroughly\nverified for authenticity and quality",
//             iconColor: Colors.teal,
//           ),
//           SizedBox(height: 30),
//           FeatureCard(
//             icon: Icons.local_shipping_outlined,
//             title: "Fast Delivery",
//             subtitle:
//             "Quick and reliable delivery right to\nyour doorstep",
//             iconColor: Colors.teal,
//           ),
//           SizedBox(height: 30),
//           FeatureCard(
//             icon: Icons.call,
//             title: "24/7 Support",
//             subtitle:
//             "Round-the-clock customer\nsupport via WhatsApp and phone",
//             iconColor: Colors.teal,
//           ),
//           SizedBox(height: 30),
//           FeatureCard(
//             icon: Icons.access_time,
//             title: "Licensed Pharmacy",
//             subtitle:
//             "Fully licensed and certified\npharmacy with quality assurance",
//             iconColor: Colors.teal,
//           ),
//         ],
//       )
//           : Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: const [
//           FeatureCard(
//             icon: Icons.verified_user,
//             title: "Verified Medicines",
//             subtitle:
//             "All medicines are thoroughly\nverified for authenticity and quality",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.local_shipping_outlined,
//             title: "Fast Delivery",
//             subtitle:
//             "Quick and reliable delivery right to\nyour doorstep",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.call,
//             title: "24/7 Support",
//             subtitle:
//             "Round-the-clock customer\nsupport via WhatsApp and phone",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.access_time,
//             title: "Licensed Pharmacy",
//             subtitle:
//             "Fully licensed and certified\npharmacy with quality assurance",
//             iconColor: Colors.teal,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class FeatureCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final Color iconColor;
//
//   const FeatureCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.iconColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: isMobile ? 70 : 80,
//           height: isMobile ? 70 : 80,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: AppColor.blueColor,
//             boxShadow: [
//               BoxShadow(
//                 color: iconColor.withOpacity(0.3),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Icon(icon, size: isMobile ? 34 : 40, color: Colors.white),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: isMobile ? 18 : 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 8),
//         Text(
//           subtitle,
//           style: TextStyle(
//             fontSize: isMobile ? 13 : 14,
//             color: Colors.grey.shade600,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../res/const_color.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    // Get selected language
    final lang = AppLocalizations.of(context)!.localeName; // 'en' या 'hi'

    return Container(
      width: double.infinity,
      color: AppColor.lightWhiteColor,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: isMobile ? 20 : 40,
      ),
      child: isMobile
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FeatureCard(
            icon: Icons.verified_user,
            title: lang == 'hi'
                ? "सत्यापित दवाएँ"
                : "Verified Medicines",
            subtitle: lang == 'hi'
                ? "सभी दवाइयाँ पूरी तरह से सत्यापित\nप्रामाणिकता और गुणवत्ता के लिए"
                : "All medicines are thoroughly verified\nfor authenticity and quality",
            iconColor: Colors.teal,
          ),
          const SizedBox(height: 30),
          FeatureCard(
            icon: Icons.local_shipping_outlined,
            title: lang == 'hi' ? "तेज़ डिलीवरी" : "Fast Delivery",
            subtitle: lang == 'hi'
                ? "आपके दरवाजे तक तेज़ और\n भरोसेमंद डिलीवरी"
                : "Quick and reliable delivery\n right to your doorstep",
            iconColor: Colors.teal,
          ),
          const SizedBox(height: 30),
          FeatureCard(
            icon: Icons.call,
            title: lang == 'hi' ? "24/7 सहायता" : "24/7 Support",
            subtitle: lang == 'hi'
                ? "WhatsApp और फ़ोन के माध्यम से\n24/7 ग्राहक सहायता"
                : "Round-the-clock customer support\nvia WhatsApp and phone",
            iconColor: Colors.teal,
          ),

          const SizedBox(height: 30),
          FeatureCard(
            icon: Icons.access_time,
            title:
            lang == 'hi' ? "लाइसेंस प्राप्त फ़ार्मेसी" : "Licensed Pharmacy",
            subtitle: lang == 'hi'
                ? "पूर्ण रूप से लाइसेंस प्राप्त और प्रमाणित फ़ार्मेसी\nगुणवत्ता सुनिश्चित के साथ"
                : "Fully licensed and certified pharmacy\nwith quality assurance",
            iconColor: Colors.teal,
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FeatureCard(
            icon: Icons.verified_user,
            title: lang == 'hi'
                ? "सत्यापित दवाएँ"
                : "Verified Medicines",
            subtitle: lang == 'hi'
                ? "सभी दवाइयाँ पूरी तरह से सत्यापित\nप्रामाणिकता और गुणवत्ता के लिए"
                : "All medicines are thoroughly verified\nfor authenticity and quality",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.local_shipping_outlined,
            title: lang == 'hi' ? "तेज़ डिलीवरी" : "Fast Delivery",
            subtitle: lang == 'hi'
                ? "आपके दरवाजे तक तेज़ और भरोसेमंद डिलीवरी"
                : "Quick and reliable delivery right to your doorstep",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.call,
            title: lang == 'hi' ? "24/7 सहायता" : "24/7 Support",
            subtitle: lang == 'hi'
                ? "WhatsApp और फ़ोन के माध्यम से 24/7 ग्राहक सहायता"
                : "Round-the-clock customer support via WhatsApp and phone",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.access_time,
            title:
            lang == 'hi' ? "लाइसेंस प्राप्त फ़ार्मेसी" : "Licensed Pharmacy",
            subtitle: lang == 'hi'
                ? "पूर्ण रूप से लाइसेंस प्राप्त और प्रमाणित फ़ार्मेसी\nगुणवत्ता सुनिश्चित के साथ"
                : "Fully licensed and certified pharmacy\nwith quality assurance",
            iconColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isMobile ? 70 : 80,
          height: isMobile ? 70 : 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.blueColor,
            boxShadow: [
              BoxShadow(
                color: iconColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(icon, size: isMobile ? 34 : 40, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: isMobile ? 12 : 13,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
