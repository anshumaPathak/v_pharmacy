// import 'package:flutter/material.dart';
//
// import '../res/const_color.dart';
// import '../res/sizing_const.dart';
//
// class AboutUsScreen extends StatefulWidget {
//   const AboutUsScreen({super.key});
//
//   @override
//   State<AboutUsScreen> createState() => _AboutUsScreenState();
// }
//
// class _AboutUsScreenState extends State<AboutUsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Top About Section
//           Container(
//             height: 480,
//             color: const Color(0xFFF1F5F9),
//             padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Left Content
//                 Expanded(
//                   flex: 5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: const TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'About ',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 40,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.2,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'MediCare',
//                               style: TextStyle(
//                                 color: Color(0xFF2563EB),
//                                 fontSize: 40,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.2,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Text(
//                         'We are a leading healthcare platform dedicated to providing safe, reliable, and accessible medicine ordering and verification services. Our mission is to bridge the gap between patients and quality healthcare.',
//                         style: TextStyle(
//                           color: Color(0xFF64748B),
//                           fontSize: 18,
//                           height: 1.6,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 130,
//                               padding: const EdgeInsets.all(32),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: const Column(
//                                 children: [
//                                   Text(
//                                     '5+',
//                                     style: TextStyle(
//                                       color: Color(0xFF2563EB),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text(
//                                     'Years Experience',
//                                     style: TextStyle(
//                                       color: Color(0xFF64748B),
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 24),
//                           Expanded(
//                             child: Container(
//                               height: 130,
//                               padding: const EdgeInsets.all(32),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: const Column(
//                                 children: [
//                                   Text(
//                                     '50K+',
//                                     style: TextStyle(
//                                       color: Color(0xFF2563EB),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text(
//                                     'Happy Customers',
//                                     style: TextStyle(
//                                       color: Color(0xFF64748B),
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 60),
//                 // Right Image
//                 Expanded(
//                   flex: 4,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb?w=800&h=600&fit=crop',
//                       height: 500,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           height: 500,
//                           color: const Color(0xFFE2E8F0),
//                           child: const Center(
//                             child: Icon(
//                               Icons.medical_services,
//                               size: 80,
//                               color: Color(0xFF94A3B8),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Our Mission & Vision Section
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(32),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xFFE0F2FE)),
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Icon(Icons.adjust, color: Color(0xFF2563EB), size: 36),
//                         SizedBox(height: 12),
//                         Text(
//                           "Our Mission",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           "To provide accessible, reliable, and safe healthcare services by leveraging technology to connect patients with verified medicines and professional healthcare support. We strive to make healthcare more convenient and trustworthy for everyone.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xFF64748B),
//                             height: 1.5,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 40),
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(32),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: const Color(0xFFE0F2FE)),
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Icon(Icons.favorite_border, color: Color(0xFF2563EB), size: 36),
//                         SizedBox(height: 12),
//                         Text(
//                           "Our Vision",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           "To become the most trusted healthcare platform globally, where every patient can access quality medicines with confidence, transparency, and convenience. We envision a world where healthcare is seamless and accessible to all.",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xFF64748B),
//                             height: 1.5,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Our Values Section
//           Container(
//             color: const Color(0xFFF8FAFC),
//             padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
//             child: Column(
//               children: [
//                 const Text(
//                   'Our Values',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'The principles that guide everything we do',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color(0xFF64748B),
//                   ),
//                 ),
//                 const SizedBox(height: 48),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Quality Assurance
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.shield_outlined,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Quality Assurance',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             const Text(
//                               'Every medicine undergoes rigorous quality checks and verification processes to ensure safety and efficacy.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color(0xFF64748B),
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // Patient Care
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.favorite_border,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Patient Care',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             const Text(
//                               'We prioritize patient well-being, providing compassionate and reliable healthcare services.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color(0xFF64748B),
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // Reliability
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.check_circle_outline,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Reliability',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             const Text(
//                               'Trusted by thousands of customers, we maintain the highest standards of service and delivery.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color(0xFF64748B),
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // Accessibility
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.schedule,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Accessibility',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             const Text(
//                               '24/7 availability ensures you can access healthcare services whenever you need them.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Color(0xFF64748B),
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Sizes.spaceHeight10,
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//             decoration: BoxDecoration(color: AppColor.blueColor),
//             child: Column(
//               children: [
//                 const Text(
//                   'Our Impact',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Numbers that reflect our commitment to excellence',
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 const SizedBox(height: 12),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     bool isMobile = constraints.maxWidth < 600;
//                     return isMobile
//                         ? Column(
//                       children: [
//                         _buildStatItem("50,000+", "Customers Served"),
//                         const SizedBox(height: 30),
//                         _buildStatItem("99.9%", "Delivery Success Rate"),
//                         const SizedBox(height: 30),
//                         _buildStatItem("5 Years", "Industry Experience"),
//                         const SizedBox(height: 30),
//                         _buildStatItem("24/7", "Customer Support"),
//                       ],
//                     )
//                         : Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildStatItem("50,000+", "Happy Customers"),
//                         _buildStatItem("99.9%", "Delivery Success"),
//                         _buildStatItem("24/7", "Support Available"),
//                         _buildStatItem("100%", "Verified Medicines"),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // Certifications & Trust Section
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
//             child: Column(
//               children: [
//                 const Text(
//                   'Certifications & Trust',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Our commitment to quality is backed by industry-leading certifications',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color(0xFF64748B),
//                   ),
//                 ),
//                 const SizedBox(height: 48),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // FDA Approved
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color(0xFFE2E8F0)),
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.military_tech_outlined,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'FDA Approved',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // ISO 9001:2015
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color(0xFFE2E8F0)),
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.shield_outlined,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'ISO 9001:2015',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // WHO GMP Certified
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color(0xFFE2E8F0)),
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.verified_outlined,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'WHO GMP Certified',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 24),
//                     // Licensed Pharmacy
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.all(32),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: const Color(0xFFE2E8F0)),
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFDEEBFF),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.stars_outlined,
//                                 color: Color(0xFF2563EB),
//                                 size: 40,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'Licensed Pharmacy',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildStatItem(String value, String label) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 48,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../res/const_color.dart';
import '../res/sizing_const.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 🔹 About Section (Responsive)
          Container(
            color: const Color(0xFFF1F5F9),
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 80,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 800;
                return isMobile
                    ? Column(
                  children: [
                    _aboutLeftContent(),
                    const SizedBox(height: 30),
                    _aboutRightImage(),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _aboutLeftContent()),
                    const SizedBox(width: 60),
                    Expanded(flex: 4, child: _aboutRightImage()),
                  ],
                );
              },
            ),
          ),

          // 🔹 Mission & Vision Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 800;
                return isMobile
                    ? Column(
                  children: [
                    _missionCard(),
                    const SizedBox(height: 20),
                    _visionCard(),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _missionCard()),
                    const SizedBox(width: 40),
                    Expanded(child: _visionCard()),
                  ],
                );
              },
            ),
          ),

          // 🔹 Our Values Section
          Container(
            color: const Color(0xFFF8FAFC),
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: Column(
              children: [
                const Text(
                  'Our Values',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'The principles that guide everything we do',
                  style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 900;
                    return isMobile
                        ? Column(
                      children: [
                        _valueCard(Icons.shield_outlined,
                            'Quality Assurance',
                            'Every medicine undergoes rigorous quality checks and verification processes to ensure safety and efficacy.'),
                        const SizedBox(height: 20),
                        _valueCard(Icons.favorite_border, 'Patient Care',
                            'We prioritize patient well-being, providing compassionate and reliable healthcare services.'),
                        const SizedBox(height: 20),
                        _valueCard(Icons.check_circle_outline, 'Reliability',
                            'Trusted by thousands of customers, we maintain the highest standards of service and delivery.'),
                        const SizedBox(height: 20),
                        _valueCard(Icons.schedule, 'Accessibility',
                            '24/7 availability ensures you can access healthcare services whenever you need them.'),
                      ],
                    )
                        : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: _valueCard(
                                Icons.shield_outlined,
                                'Quality Assurance',
                                'Every medicine undergoes rigorous quality checks and verification processes to ensure safety and efficacy.')),
                        const SizedBox(width: 24),
                        Expanded(
                            child: _valueCard(
                                Icons.favorite_border,
                                'Patient Care',
                                'We prioritize patient well-being, providing compassionate and reliable healthcare services.')),
                        const SizedBox(width: 24),
                        Expanded(
                            child: _valueCard(
                                Icons.check_circle_outline,
                                'Reliability',
                                'Trusted by thousands of customers, we maintain the highest standards of service and delivery.')),
                        const SizedBox(width: 24),
                        Expanded(
                            child: _valueCard(
                                Icons.schedule,
                                'Accessibility',
                                '24/7 availability ensures you can access healthcare services whenever you need them.')),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          Sizes.spaceHeight10,

          // 🔹 Our Impact Section (unchanged)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: BoxDecoration(color: AppColor.blueColor),
            child: Column(
              children: [
                const Text(
                  'Our Impact',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Numbers that reflect our commitment to excellence',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;
                    return isMobile
                        ? Column(
                      children: [
                        _buildStatItem("50,000+", "Customers Served"),
                        const SizedBox(height: 30),
                        _buildStatItem("99.9%", "Delivery Success Rate"),
                        const SizedBox(height: 30),
                        _buildStatItem("5 Years", "Industry Experience"),
                        const SizedBox(height: 30),
                        _buildStatItem("24/7", "Customer Support"),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem("50,000+", "Happy Customers"),
                        _buildStatItem("99.9%", "Delivery Success"),
                        _buildStatItem("24/7", "Support Available"),
                        _buildStatItem("100%", "Verified Medicines"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // 🔹 Certifications Section (responsive)
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: width < 600 ? 20 : 80,
              vertical: width < 600 ? 40 : 60,
            ),
            child: Column(
              children: [
                const Text(
                  'Certifications & Trust',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Our commitment to quality is backed by industry-leading certifications',
                  style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 900;
                    return isMobile
                        ? Column(
                      children: [
                        _certCard(Icons.military_tech_outlined, "FDA Approved"),
                        const SizedBox(height: 20),
                        _certCard(Icons.shield_outlined, "ISO 9001:2015"),
                        const SizedBox(height: 20),
                        _certCard(Icons.verified_outlined, "WHO GMP Certified"),
                        const SizedBox(height: 20),
                        _certCard(Icons.stars_outlined, "Licensed Pharmacy"),
                      ],
                    )
                        : Row(
                      children: [
                        Expanded(child: _certCard(Icons.military_tech_outlined, "FDA Approved")),
                        const SizedBox(width: 24),
                        Expanded(child: _certCard(Icons.shield_outlined, "ISO 9001:2015")),
                        const SizedBox(width: 24),
                        Expanded(child: _certCard(Icons.verified_outlined, "WHO GMP Certified")),
                        const SizedBox(width: 24),
                        Expanded(child: _certCard(Icons.stars_outlined, "Licensed Pharmacy")),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- UI helpers (same style) ---
  Widget _aboutLeftContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'About ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: 'MediCare',
              style: TextStyle(
                color: Color(0xFF2563EB),
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'We are a leading healthcare platform dedicated to providing safe, reliable, and accessible medicine ordering and verification services. Our mission is to bridge the gap between patients and quality healthcare.',
        style: TextStyle(color: Color(0xFF64748B), fontSize: 18, height: 1.6),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: _smallBox("5+", "Years Experience"),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _smallBox("50K+", "Happy Customers"),
          ),
        ],
      ),
    ],
  );

  Widget _aboutRightImage() => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb?w=800&h=600&fit=crop',
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );

  Widget _smallBox(String value, String text) => Container(
    height: 130,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF2563EB),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(text,
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 14)),
      ],
    ),
  );

  Widget _missionCard() => _card(Icons.adjust, "Our Mission",
      "To provide accessible, reliable, and safe healthcare services by leveraging technology to connect patients with verified medicines and professional healthcare support. We strive to make healthcare more convenient and trustworthy for everyone.");

  Widget _visionCard() => _card(Icons.favorite_border, "Our Vision",
      "To become the most trusted healthcare platform globally, where every patient can access quality medicines with confidence, transparency, and convenience.");

  Widget _card(IconData icon, String title, String desc) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE0F2FE)),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF2563EB), size: 36),
        const SizedBox(height: 12),
        Text(title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        const SizedBox(height: 12),
        Text(desc,
            style: const TextStyle(
                fontSize: 16, color: Color(0xFF64748B), height: 1.5)),
      ],
    ),
  );

  Widget _valueCard(IconData icon, String title, String desc) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFDEEBFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 40),
        ),
        const SizedBox(height: 20),
        Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        const SizedBox(height: 12),
        Text(desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15, color: Color(0xFF64748B), height: 1.5)),
      ],
    ),
  );

  Widget _certCard(IconData icon, String title) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE2E8F0)),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFDEEBFF),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 40),
        ),
        const SizedBox(height: 20),
        Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ],
    ),
  );

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300)),
      ],
    );
  }
}
