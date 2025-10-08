// import 'package:flutter/material.dart';
//
// class CTASection extends StatelessWidget {
//   const CTASection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF00E676), // Bright green
//             Color(0xFF00BCD4), // Cyan
//             Color(0xFF2196F3), // Blue
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Ready to Order Your Medicines?",
//             style: TextStyle(
//               fontSize: 42,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             "Get started with our easy ordering process and enjoy fast, reliable delivery",
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.white.withOpacity(0.95),
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.teal,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 20,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 8,
//                 ),
//                 child: Text(
//                   "Start Shopping",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 20,
//                   ),
//                   side: BorderSide(color: Colors.white, width: 2),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   "Learn More",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }