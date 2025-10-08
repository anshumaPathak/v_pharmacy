// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
//
// import '../res/const_color.dart';
//
// class ContactScreen extends StatefulWidget {
//   const ContactScreen({super.key});
//
//   @override
//   State<ContactScreen> createState() => _ContactScreenState();
// }
//
// class _ContactScreenState extends State<ContactScreen> {
//   final List<String> categories = [
//     "General Inquiry",
//     "Order Issue",
//     "Technical Support",
//     "Feedback"
//   ];
//   String? selectedCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // ===== Top Section =====
//           Container(
//             height: Sizes.screenHeight * 0.28,
//             width: double.infinity,
//             color: const Color(0xFFe8f2ff),
//             padding: EdgeInsets.symmetric(
//                 horizontal: Sizes.screenWidth * 0.03, vertical: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Get in Touch",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 Sizes.spaceHeight10,
//                 Text(
//                   "We're here to help! Reach out to us anytime for support, questions, or assistance with your",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   "medicine orders and verification.",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Contact Methods =====
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: Sizes.screenWidth * 0.03, vertical: 20),
//             child: Column(
//               children: [
//                 Text(
//                   "Contact Methods",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   "Choose your preferred way to reach us",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 SizedBox(height: 20),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _contactCard(
//                       icon: Icons.whatshot_outlined,
//                       title: "WhatsApp Support",
//                       subtitle: "Get instant help via WhatsApp",
//                       info: "+1-234-567-8900",
//                       buttonText: "Chat Now",
//                       buttonColor: Colors.green,
//                     ),
//                     _contactCard(
//                       icon: Icons.call,
//                       title: "Phone Support",
//                       subtitle: "Talk to our support team",
//                       info: "+1-234-567-8900",
//                       buttonText: "Call Now",
//                       buttonColor: Colors.blue,
//                     ),
//                     _contactCard(
//                       icon: Icons.email,
//                       title: "Email Support",
//                       subtitle: "Send us your queries",
//                       info: "support@medicare.com",
//                       buttonText: "Send Email",
//                       buttonColor: Colors.purple,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Contact Form Section =====
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Column(
//               children: [
//                 Text(
//                   "Send us a Message",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "Fill out the form below and we'll get back to you within 24 hours.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black54, fontSize: 14),
//                 ),
//                 SizedBox(height: 40),
//
//                 // ===== Form Card =====
//                 Container(
//                   width: 900,
//                   padding: const EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         spreadRadius: 3,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Row 1 - Full Name & Email
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildTextField(
//                                 label: "Full Name *",
//                                 hint: "Enter your full name"),
//                           ),
//                           SizedBox(width: 20),
//                           Expanded(
//                             child: _buildTextField(
//                                 label: "Email Address *",
//                                 hint: "your.email@example.com"),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//
//                       // Row 2 - Phone & Category
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildTextField(
//                                 label: "Phone Number",
//                                 hint: "+1-234-567-8900"),
//                           ),
//                           SizedBox(width: 20),
//                           Expanded(
//                             child: DropdownButtonFormField<String>(
//                               decoration: InputDecoration(
//                                 labelText: "Category *",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8)),
//                               ),
//                               value: selectedCategory,
//                               items: categories
//                                   .map((cat) => DropdownMenuItem(
//                                 value: cat,
//                                 child: Text(cat),
//                               ))
//                                   .toList(),
//                               onChanged: (val) {
//                                 setState(() {
//                                   selectedCategory = val;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//
//                       // Subject
//                       _buildTextField(
//                           label: "Subject *",
//                           hint: "Brief description of your inquiry"),
//                       SizedBox(height: 20),
//
//                       // Description
//                       TextFormField(
//                         maxLines: 4,
//                         decoration: InputDecoration(
//                           labelText: "Description",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                       ),
//                       SizedBox(height: 25),
//
//                       // Submit Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 48,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: Text(
//                             "Submit Message",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== FAQ Section =====
//           Container(
//             width: double.infinity,
//             color: const Color(0xFFF9FAFB),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: Column(
//               children: [
//                 Text(
//                   "Frequently Asked Questions",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "Find quick answers to common questions",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 SizedBox(height: 40),
//                 Container(
//                   width: 900,
//                   child: Column(
//                     children: [
//                       _faqCard(
//                         question: "How long does prescription verification take?",
//                         answer:
//                         "Prescription verification typically takes 2-4 hours during business hours. You will receive updates via WhatsApp and call.",
//                       ),
//                       SizedBox(height: 16),
//                       _faqCard(
//                         question: "Can I cancel my order after placing it?",
//                         answer:
//                         "Yes, you can cancel your order before we start processing it. After price confirmation, cancellation may incur charges.",
//                       ),
//                       SizedBox(height: 16),
//                       _faqCard(
//                         question: "What payment methods do you accept?",
//                         answer:
//                         "We accept all major credit/debit cards, UPI, net banking, and digital wallets. Cash on delivery is also available for select locations.",
//                       ),
//                       SizedBox(height: 16),
//                       _faqCard(
//                         question: "How can I track my order?",
//                         answer:
//                         "Once your order is confirmed, you'll receive a tracking link via SMS and email. You can also track your order in the 'My Orders' section.",
//                       ),
//                       SizedBox(height: 16),
//                       _faqCard(
//                         question: "What areas do you deliver to?",
//                         answer:
//                         "We currently deliver nationwide. Delivery charges and times may vary based on your location.",
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Support Hours Section =====
//           Container(
//             width: double.infinity,
//             color: AppColor.blueColor,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: Column(
//               children: [
//                 Text(
//                   "Our Support Hours",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _supportHourCard(
//                       icon: Icons.access_time,
//                       title: "WhatsApp Support",
//                       timing: "Available 24/7",
//                     ),
//                     SizedBox(width: 40),
//                     _supportHourCard(
//                       icon: Icons.headset_mic,
//                       title: "Phone Support",
//                       timing: "24/7 Emergency Line",
//                     ),
//                     SizedBox(width: 40),
//                     _supportHourCard(
//                       icon: Icons.people,
//                       title: "Live Chat",
//                       timing: "9 AM - 9 PM Daily",
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           // ===== Our Office Section =====
//           Container(
//             width: double.infinity,
//             color: Colors.white,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//             child: Column(
//               children: [
//                 Text(
//                   "Our Office",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "Visit us at our headquarters",
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 SizedBox(height: 40),
//                 Container(
//                   width: 900,
//                   padding: const EdgeInsets.all(40),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(color: Colors.grey.shade200),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.08),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Left Side - Address & Hours
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Address Section
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue.shade50,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(Icons.location_on,
//                                       color: Colors.blue, size: 24),
//                                 ),
//                                 SizedBox(width: 15),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Address",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       "123 Healthcare Avenue",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     Text(
//                                       "Medical District",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     Text(
//                                       "New York, NY 10001",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     Text(
//                                       "United States",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 30),
//                             // Office Hours Section
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue.shade50,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(Icons.access_time,
//                                       color: Colors.blue, size: 24),
//                                 ),
//                                 SizedBox(width: 15),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Office Hours",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       "Monday - Friday: 9:00 AM - 6:00 PM",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     Text(
//                                       "Saturday: 10:00 AM - 4:00 PM",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     Text(
//                                       "Sunday: Closed",
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       "Emergency: 24/7",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.blue,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 40),
//                       // Right Side - Map Placeholder
//                       Container(
//                         width: 350,
//                         height: 300,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 80, color: Colors.grey.shade400),
//                             SizedBox(height: 10),
//                             Text(
//                               "Interactive Map",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "Click to view location",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ====== Reusable TextField ======
//   Widget _buildTextField({required String label, required String hint}) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
//
//   // ====== Contact Card Widget ======
//   Widget _contactCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required String info,
//     required String buttonText,
//     required Color buttonColor,
//   }) {
//     return Container(
//       width: 260,
//       height: 270,
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.blue.shade100),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.blue.shade100,
//             child: Icon(icon, color: Colors.blue),
//           ),
//           Text(title,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           Text(subtitle,
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.black54, fontSize: 12)),
//           Text(info,
//               textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: buttonColor,
//               minimumSize: Size(double.infinity, 40),
//             ),
//             onPressed: () {},
//             child: Text(buttonText,
//                 style: TextStyle(color: Colors.white, fontSize: 14)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ====== FAQ Card Widget ======
//   Widget _faqCard({required String question, required String answer}) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.blue.shade50),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.help_outline, color: Colors.blue, size: 20),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   question,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.only(left: 48),
//             child: Text(
//               answer,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//                 height: 1.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ====== Support Hour Card Widget ======
//   Widget _supportHourCard({
//     required IconData icon,
//     required String title,
//     required String timing,
//   }) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.15),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: Colors.white,
//             size: 50,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           timing,
//           style: TextStyle(
//             fontSize: 15,
//             color: Colors.white.withOpacity(0.9),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import '../res/const_color.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<String> categories = [
    "General Inquiry",
    "Order Issue",
    "Technical Support",
    "Feedback"
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ===== Top Section =====
          Container(
            height: Sizes.screenHeight * 0.3,
            width: double.infinity,
            color: const Color(0xFFe8f2ff),
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.03, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get in Touch",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Sizes.spaceHeight10,
                Text(
                  "We're here to help! Reach out to us anytime for support, questions, or assistance with your",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "medicine orders and verification.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // ===== Contact Methods =====
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.03, vertical: 20),
            child: Column(
              children: [
                Text(
                  "Contact Methods",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Choose your preferred way to reach us",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 20),

                // ✅ Responsive Layout (Row → Column)
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      // 📱 Mobile View
                      return Column(
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title: "WhatsApp Support",
                            subtitle: "Get instant help via WhatsApp",
                            info: "+1-234-567-8900",
                            buttonText: "Chat Now",
                            buttonColor: Colors.green,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.call,
                            title: "Phone Support",
                            subtitle: "Talk to our support team",
                            info: "+1-234-567-8900",
                            buttonText: "Call Now",
                            buttonColor: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.email,
                            title: "Email Support",
                            subtitle: "Send us your queries",
                            info: "support@medicare.com",
                            buttonText: "Send Email",
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    } else {
                      // 💻 Desktop View
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title: "WhatsApp Support",
                            subtitle: "Get instant help via WhatsApp",
                            info: "+1-234-567-8900",
                            buttonText: "Chat Now",
                            buttonColor: Colors.green,
                          ),
                          _contactCard(
                            icon: Icons.call,
                            title: "Phone Support",
                            subtitle: "Talk to our support team",
                            info: "+1-234-567-8900",
                            buttonText: "Call Now",
                            buttonColor: Colors.blue,
                          ),
                          _contactCard(
                            icon: Icons.email,
                            title: "Email Support",
                            subtitle: "Send us your queries",
                            info: "support@medicare.com",
                            buttonText: "Send Email",
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // ===== Contact Form Section =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  "Send us a Message",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Fill out the form below and we'll get back to you within 24 hours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 40),

                // ===== Form Card =====
                Container(
                  width: screen.width < 700 ? double.infinity : 900,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row 1 - Full Name & Email
                      screen.width < 700
                          ? Column(
                        children: [
                          _buildTextField(
                              label: "Full Name *",
                              hint: "Enter your full name"),
                          SizedBox(height: 20),
                          _buildTextField(
                              label: "Email Address *",
                              hint: "your.email@example.com"),
                        ],
                      )
                          : Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                                label: "Full Name *",
                                hint: "Enter your full name"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: _buildTextField(
                                label: "Email Address *",
                                hint: "your.email@example.com"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Row 2 - Phone & Category
                      screen.width < 700
                          ? Column(
                        children: [
                          _buildTextField(
                              label: "Phone Number",
                              hint: "+1-234-567-8900"),
                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Category *",
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8)),
                            ),
                            value: selectedCategory,
                            items: categories
                                .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedCategory = val;
                              });
                            },
                          ),
                        ],
                      )
                          : Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                                label: "Phone Number",
                                hint: "+1-234-567-8900"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Category *",
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              value: selectedCategory,
                              items: categories
                                  .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedCategory = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      _buildTextField(
                          label: "Subject *",
                          hint: "Brief description of your inquiry"),
                      SizedBox(height: 20),

                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Submit Message",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: AppColor.blueColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Text(
                  "Our Support Hours",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      return Column(
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: "WhatsApp Support",
                            timing: "Available 24/7",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: "Phone Support",
                            timing: "24/7 Emergency Line",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.people,
                            title: "Live Chat",
                            timing: "9 AM - 9 PM Daily",
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: "WhatsApp Support",
                            timing: "Available 24/7",
                          ),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: "Phone Support",
                            timing: "24/7 Emergency Line",
                          ),
                          _supportHourCard(
                            icon: Icons.people,
                            title: "Live Chat",
                            timing: "9 AM - 9 PM Daily",
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
      // Container(
      //   width: 900,
      //   padding: const EdgeInsets.all(40),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(15),
      //     border: Border.all(color: Colors.grey.shade200),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.08),
      //         blurRadius: 10,
      //         spreadRadius: 2,
      //         offset: Offset(0, 4),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Left Side - Address & Hours
      //       Expanded(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             // Address Section
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   padding: const EdgeInsets.all(10),
      //                   decoration: BoxDecoration(
      //                     color: Colors.blue.shade50,
      //                     shape: BoxShape.circle,
      //                   ),
      //                   child: Icon(Icons.location_on,
      //                       color: Colors.blue, size: 24),
      //                 ),
      //                 SizedBox(width: 15),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Address",
      //                       style: TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     SizedBox(height: 8),
      //                     Text(
      //                       "123 Healthcare Avenue",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     Text(
      //                       "Medical District",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     Text(
      //                       "New York, NY 10001",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     Text(
      //                       "United States",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 30),
      //             // Office Hours Section
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   padding: const EdgeInsets.all(10),
      //                   decoration: BoxDecoration(
      //                     color: Colors.blue.shade50,
      //                     shape: BoxShape.circle,
      //                   ),
      //                   child: Icon(Icons.access_time,
      //                       color: Colors.blue, size: 24),
      //                 ),
      //                 SizedBox(width: 15),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Office Hours",
      //                       style: TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     SizedBox(height: 8),
      //                     Text(
      //                       "Monday - Friday: 9:00 AM - 6:00 PM",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     Text(
      //                       "Saturday: 10:00 AM - 4:00 PM",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     Text(
      //                       "Sunday: Closed",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.black87),
      //                     ),
      //                     SizedBox(height: 8),
      //                     Text(
      //                       "Emergency: 24/7",
      //                       style: TextStyle(
      //                           fontSize: 14,
      //                           color: Colors.blue,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(width: 40),
      //       // Right Side - Map Placeholder
      //       Container(
      //         width: 350,
      //         height: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.grey.shade100,
      //           borderRadius: BorderRadius.circular(12),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.location_on,
      //                 size: 80, color: Colors.grey.shade400),
      //             SizedBox(height: 10),
      //             Text(
      //               "Interactive Map",
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //                 color: Colors.black54,
      //               ),
      //             ),
      //             SizedBox(height: 5),
      //             Text(
      //               "Click to view location",
      //               style: TextStyle(
      //                 fontSize: 12,
      //                 color: Colors.black45,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      //
      // ),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700; // adjust breakpoint if needed

              return Container(
                width: isMobile ? double.infinity : 900,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side (Address & Hours)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Address
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Address",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("123 Healthcare Avenue",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("Medical District",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("New York, NY 10001",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("United States",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Office Hours
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.access_time,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Office Hours",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("Monday - Friday: 9:00 AM - 6:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("Saturday: 10:00 AM - 4:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("Sunday: Closed",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                SizedBox(height: 8),
                                Text("Emergency: 24/7",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Map below in mobile
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          const Text(
                            "Interactive Map",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Click to view location",
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.location_on,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Address",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("123 Healthcare Avenue",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("Medical District",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("New York, NY 10001",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("United States",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Office Hours
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.access_time,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Office Hours",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("Monday - Friday: 9:00 AM - 6:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("Saturday: 10:00 AM - 4:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("Sunday: Closed",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  SizedBox(height: 8),
                                  Text("Emergency: 24/7",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Map on Right
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          const Text(
                            "Interactive Map",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Click to view location",
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  // ====== Reusable TextField ======
  Widget _buildTextField({required String label, required String hint}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ====== Contact Card Widget ======
  Widget _contactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String info,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      width: 260,
      height: 270,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12)),
          Text(info,
              textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              minimumSize: Size(double.infinity, 40),
            ),
            onPressed: () {},
            child: Text(buttonText,
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  // ====== Support Hour Card Widget ======
  Widget _supportHourCard({
    required IconData icon,
    required String title,
    required String timing,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          timing,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
