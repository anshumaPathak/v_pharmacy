import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/auth/register_screen.dart';

import '../view_model/auth_view_model/send_otp_view_model.dart';
import '../view_model/auth_view_model/verify_otp_view_model.dart';
import 'login_screen.dart';
class OTPVerificationDialog extends StatefulWidget {
  final String phoneNumber;
  final String userId; // pass this from LoginViewModel
  final bool isRegistered; // pass this from LoginViewModel

  const OTPVerificationDialog({
    super.key,
    required this.phoneNumber,
    this.userId = '',
    this.isRegistered = false,
  });

  @override
  State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
}

class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
  final TextEditingController _otpController = TextEditingController();
  bool _showSuccessMessage = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sendOtpViewModel =
      Provider.of<SendOtpViewModel>(context, listen: false);
      sendOtpViewModel.sendOtpApi(widget.phoneNumber, context);
    });
  }

  void _resendOTP() {
    setState(() {
      _showSuccessMessage = false;
      _otpController.clear();
    });
    final sendOtpViewModel =
    Provider.of<SendOtpViewModel>(context, listen: false);
    sendOtpViewModel.sendOtpApi(widget.phoneNumber, context);
  }

  void _changePhoneNumber() => Navigator.of(context).pop();

  void _verifyOTP() {
    if (_otpController.text.length == 4) {
      final verifyOtpViewModel =
      Provider.of<VerifyOtpViewModel>(context, listen: false);
      verifyOtpViewModel.verifyOtpApi(
        widget.phoneNumber,
        _otpController.text,
        widget.userId,
        widget.isRegistered,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Verify OTP',
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('OTP sent to ${widget.phoneNumber}'),
            const SizedBox(height: 16),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                hintText: 'Enter 4-digit OTP',
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Demo: Enter any 4 digits as OTP',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Verify OTP Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: _verifyOTP,
                onPressed: (){
                  final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(context,listen: false);
                  verifyOtpViewModel.verifyOtpApi(
                      widget.phoneNumber,
                      _otpController.text,
                     "",
                      false,
                      context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B9EFF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Resend OTP Link
            Center(
              child: TextButton(
                onPressed: _resendOTP,
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Change Phone Number Link
            Center(
              child: TextButton(
                onPressed: _changePhoneNumber,
                child: const Text(
                  'Change Phone Number',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Success Message
            if (_showSuccessMessage)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green.shade700, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'OTP sent successfully to ${widget.phoneNumber}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),

            // WhatsApp/SMS Info
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       widget.isWhatsApp ? Icons.chat_bubble_outline : Icons.sms_outlined,
            //       size: 16,
            //       color: Colors.black54,
            //     ),
            //     const SizedBox(width: 8),
            //     Text(
            //       widget.isWhatsApp ? 'WhatsApp' : 'SMS',
            //       style: const TextStyle(
            //         fontSize: 14,
            //         color: Colors.black54,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}

// class OTPVerificationDialog extends StatefulWidget {
//   final String phoneNumber;
//   // final bool isWhatsApp;
//
//   const OTPVerificationDialog({
//     super.key,
//     required this.phoneNumber,
//     // required this.isWhatsApp,
//   });
//
//   @override
//   State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
// }
//
// class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
//   final TextEditingController _otpController = TextEditingController();
//   bool _showSuccessMessage = false;
//
//   @override
//   void dispose() {
//     _otpController.dispose();
//     super.dispose();
//   }
//
//   void _verifyOTP() {
//     if (_otpController.text.length == 4) {
//       setState(() {
//         _showSuccessMessage = true;
//       });
//
//       // Show registration dialog after short delay
//       Future.delayed(const Duration(milliseconds: 500), () {
//         Navigator.of(context).pop(); // Close OTP dialog
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) => CompleteRegistrationDialog(
//             phoneNumber: widget.phoneNumber,
//             // isWhatsApp: widget.isWhatsApp,
//           ),
//         );
//       });
//     }
//   }
//
//   void _resendOTP() {
//     setState(() {
//       _showSuccessMessage = false;
//       _otpController.clear();
//     });
//     print('Resending OTP to: ${widget.phoneNumber}');
//     // Add your resend OTP logic here
//   }
//
//   void _changePhoneNumber() {
//     Navigator.of(context).pop();
//   }
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     Map arguments =
//   //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//   //     final sendOtpViewModel =
//   //     Provider.of<SendOtpViewModel>(context, listen: false);
//   //     sendOtpViewModel.sendOtpApi(arguments["mobile"], context);
//   //   });
//   // }
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final sendOtpViewModel =
//       Provider.of<SendOtpViewModel>(context, listen: false);
//       // Directly use widget.phoneNumber instead of arguments
//       sendOtpViewModel.sendOtpApi(widget.phoneNumber, context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Map arguments =
//     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//
//     // Map arguments =
//     // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     final verifyOtpViewModel = Provider.of<VerifyOtpViewModel>(
//       context,
//     );
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
//                   'Verify OTP',
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
//             Text(
//               'OTP sent to ${widget.phoneNumber}',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // Enter OTP Label
//             Row(
//               children: const [
//                 Icon(Icons.lock_outline, size: 18, color: Colors.black87),
//                 SizedBox(width: 8),
//                 Text(
//                   'Enter OTP',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//
//             // OTP Input Field
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               maxLength: 4,
//               decoration: InputDecoration(
//                 hintText: 'Enter 4-digit OTP',
//                 counterText: '',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey, width: 1),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // Demo Text
//             const Text(
//               'Demo: Enter any 4 digits as OTP',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Verify OTP Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 // onPressed: _verifyOTP,
//                 onPressed: (){
//                   verifyOtpViewModel.verifyOtpApi(
//                     widget.phoneNumber,
//                       _otpController.text,
//                       arguments['userid'],
//                       arguments['isRegistered'],
//                       context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6B9EFF),
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Verify OTP',
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
//             // Resend OTP Link
//             Center(
//               child: TextButton(
//                 onPressed: _resendOTP,
//                 child: const Text(
//                   'Resend OTP',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // Change Phone Number Link
//             Center(
//               child: TextButton(
//                 onPressed: _changePhoneNumber,
//                 child: const Text(
//                   'Change Phone Number',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // Success Message
//             if (_showSuccessMessage)
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade50,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.green.shade200),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.check_circle, color: Colors.green.shade700, size: 20),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         'OTP sent successfully to ${widget.phoneNumber}',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.green.shade700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             const SizedBox(height: 16),
//
//             // WhatsApp/SMS Info
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             //     Icon(
//             //       widget.isWhatsApp ? Icons.chat_bubble_outline : Icons.sms_outlined,
//             //       size: 16,
//             //       color: Colors.black54,
//             //     ),
//             //     const SizedBox(width: 8),
//             //     Text(
//             //       widget.isWhatsApp ? 'WhatsApp' : 'SMS',
//             //       style: const TextStyle(
//             //         fontSize: 14,
//             //         color: Colors.black54,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // const SizedBox(height: 16),

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