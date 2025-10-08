//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../res/const_color.dart';
//
// class FeaturesSection extends StatelessWidget {
//   const FeaturesSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color:AppColor.lightWhiteColor,
//       padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FeatureCard(
//             icon: Icons.verified_user,
//             title: "Verified Medicines",
//             subtitle: "All medicines are thoroughly\n verified for authenticity and quality",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.local_shipping_outlined,
//             title: "Fast Delivery",
//             subtitle: "Quick and reliable delivery right to\n your doorstep",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.call,
//             title: "24/7 Support",
//             subtitle: "Round-the-clock customer \nsupport via WhatsApp and phone",
//             iconColor: Colors.teal,
//           ),
//           FeatureCard(
//             icon: Icons.access_time,
//             title: "Licensed Pharmacy",
//             subtitle: "Fully licensed and certified \npharmacy with quality assurance",
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
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 80,
//           height: 80,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: AppColor.blueColor,
//             // gradient: LinearGradient(
//             //   colors: [Colors.teal.shade300, Colors.teal.shade600],
//             //   begin: Alignment.topLeft,
//             //   end: Alignment.bottomRight,
//             // ),
//             boxShadow: [
//               BoxShadow(
//                 color: iconColor.withOpacity(0.3),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Icon(
//             icon,
//             size: 40,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 8),
//         Text(
//           subtitle,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey.shade600,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res/const_color.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

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
        children: const [
          FeatureCard(
            icon: Icons.verified_user,
            title: "Verified Medicines",
            subtitle:
            "All medicines are thoroughly\nverified for authenticity and quality",
            iconColor: Colors.teal,
          ),
          SizedBox(height: 30),
          FeatureCard(
            icon: Icons.local_shipping_outlined,
            title: "Fast Delivery",
            subtitle:
            "Quick and reliable delivery right to\nyour doorstep",
            iconColor: Colors.teal,
          ),
          SizedBox(height: 30),
          FeatureCard(
            icon: Icons.call,
            title: "24/7 Support",
            subtitle:
            "Round-the-clock customer\nsupport via WhatsApp and phone",
            iconColor: Colors.teal,
          ),
          SizedBox(height: 30),
          FeatureCard(
            icon: Icons.access_time,
            title: "Licensed Pharmacy",
            subtitle:
            "Fully licensed and certified\npharmacy with quality assurance",
            iconColor: Colors.teal,
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FeatureCard(
            icon: Icons.verified_user,
            title: "Verified Medicines",
            subtitle:
            "All medicines are thoroughly\nverified for authenticity and quality",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.local_shipping_outlined,
            title: "Fast Delivery",
            subtitle:
            "Quick and reliable delivery right to\nyour doorstep",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.call,
            title: "24/7 Support",
            subtitle:
            "Round-the-clock customer\nsupport via WhatsApp and phone",
            iconColor: Colors.teal,
          ),
          FeatureCard(
            icon: Icons.access_time,
            title: "Licensed Pharmacy",
            subtitle:
            "Fully licensed and certified\npharmacy with quality assurance",
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
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
