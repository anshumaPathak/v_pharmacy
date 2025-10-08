// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/const_color.dart';
//
// class LoginDialog extends StatefulWidget {
//   const LoginDialog({super.key});
//
//   @override
//   State<LoginDialog> createState() => _LoginDialogState();
// }
//
// class _LoginDialogState extends State<LoginDialog> {
//   final TextEditingController _phoneController = TextEditingController();
//   bool _isWhatsApp = true; // true for WhatsApp, false for SMS
//
//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         width: 500,
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header with close button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Login / Register',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.close, color: Colors.black54),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Enter your phone number to get started',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // Phone Number Label
//             const Text(
//               'Phone Number',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // Phone Number Input Field
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: '+1-234-567-8900',
//                 prefixIcon: const Icon(Icons.phone, color: Colors.black54),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // Helper Text
//             const Text(
//               "We'll send you an OTP to verify your number",
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Send OTP Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle OTP send logic
//                   if (_phoneController.text.isNotEmpty) {
//                     // Your OTP logic here
//                     print('Sending OTP to: ${_phoneController.text} via ${_isWhatsApp ? "WhatsApp" : "SMS"}');
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6B9EFF),
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Send OTP',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // Demo Text
//             const Center(
//               child: Text(
//                 'Demo: Use any phone number ending with 1234 for existing user',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // WhatsApp/SMS Toggle
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       _isWhatsApp = true;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Radio<bool>(
//                         value: true,
//                         groupValue: _isWhatsApp,
//                         onChanged: (value) {
//                           setState(() {
//                             _isWhatsApp = value!;
//                           });
//                         },
//                         activeColor: Colors.black87,
//                       ),
//                       const Text(
//                         'WhatsApp',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 24),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       _isWhatsApp = false;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Radio<bool>(
//                         value: false,
//                         groupValue: _isWhatsApp,
//                         onChanged: (value) {
//                           setState(() {
//                             _isWhatsApp = value!;
//                           });
//                         },
//                         activeColor: Colors.black87,
//                       ),
//                       const Text(
//                         'SMS',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//
//             // Terms and Privacy
//             Center(
//               child: RichText(
//                 textAlign: TextAlign.center,
//                 text: const TextSpan(
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                   children: [
//                     TextSpan(text: 'By continuing, you agree to our '),
//                     TextSpan(
//                       text: 'Terms of Service',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                     TextSpan(text: ' and '),
//                     TextSpan(
//                       text: 'Privacy Policy',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_pharmashing/res/const_color.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isWhatsApp = true; // true for WhatsApp, false for SMS
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {
        // Enable button only if exactly 10 digits
        _isButtonEnabled = _phoneController.text.length == 10;
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Login / Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your phone number to get started',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),

            // Phone Number Input Field
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                isDense: true, // important to reduce height
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // reduce vertical padding
                counterText: "",
                hintText: '+1-234-567-8900',
                prefixIcon: const Icon(Icons.phone, color: Colors.black54, size: 20), // smaller icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              "We'll send you an OTP to verify your number",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Send OTP Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  print(
                      'Sending OTP to: ${_phoneController.text} via ${_isWhatsApp ? "WhatsApp" : "SMS"}');
                }
                    : null, // button disabled if not 10 digits
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? const Color(0xFF6B9EFF)
                      : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Send OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Demo Text
            const Center(
              child: Text(
                'Demo: Use any phone number ending with 1234 for existing user',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // WhatsApp/SMS Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isWhatsApp = true;
                    });
                  },
                  child: Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _isWhatsApp,
                        onChanged: (value) {
                          setState(() {
                            _isWhatsApp = value!;
                          });
                        },
                        activeColor: Colors.black87,
                      ),
                      const Text(
                        'WhatsApp',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isWhatsApp = false;
                    });
                  },
                  child: Row(
                    children: [
                      Radio<bool>(
                        value: false,
                        groupValue: _isWhatsApp,
                        onChanged: (value) {
                          setState(() {
                            _isWhatsApp = value!;
                          });
                        },
                        activeColor: Colors.black87,
                      ),
                      const Text(
                        'SMS',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Terms and Privacy
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(text: 'By continuing, you agree to our '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
