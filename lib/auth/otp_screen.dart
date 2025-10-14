//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../view_model/auth_view_model/verify_otp_view_model.dart';
// import '../utils/utils.dart';
// import 'register_screen.dart';
//
// class OTPVerificationDialog extends StatefulWidget {
//   final String phoneNumber;
//   final String userId;
//   final bool isRegistered;
//
//   const OTPVerificationDialog({
//     super.key,
//     required this.phoneNumber,
//     this.userId = '',
//     this.isRegistered = false,
//   });
//
//   @override
//   State<OTPVerificationDialog> createState() => _OTPVerificationDialogState();
// }
//
// class _OTPVerificationDialogState extends State<OTPVerificationDialog> {
//   final TextEditingController _otpController = TextEditingController();
//
//   @override
//   void dispose() {
//     _otpController.dispose();
//     super.dispose();
//   }
//
//   // void _verifyOTP() {
//   //   if (_otpController.text.length == 4) {
//   //     final verifyOtpViewModel =
//   //     Provider.of<VerifyOtpViewModel>(context, listen: false);
//   //
//   //     verifyOtpViewModel.verifyOtpApi(
//   //       widget.phoneNumber,
//   //       _otpController.text,
//   //       widget.userId,
//   //       widget.isRegistered,
//   //       context,
//   //     );
//   //   }
//   // }
//   void _verifyOTP() {
//     String otp = _otpController.text.trim();
//     if (otp.length != 4) {
//       // Show message agar OTP 4 digit ka nahi hai
//       Utils.show("Please enter a valid 4-digit OTP", context);
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text("Please enter a valid 4-digit OTP"),
//       //     duration: Duration(seconds: 2),
//       //   ),
//       // );
//       return;
//     }
//
//     // OTP valid → call API
//     final verifyOtpViewModel =
//     Provider.of<VerifyOtpViewModel>(context, listen: false);
//
//     verifyOtpViewModel.verifyOtpApi(
//       widget.phoneNumber,
//       otp,
//       widget.userId,
//       widget.isRegistered,
//       context,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Container(
//         width: 500,
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Verify OTP',
//                     style:
//                     TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Text('OTP sent to ${widget.phoneNumber}'),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               maxLength: 4,
//               decoration: InputDecoration(
//                 hintText: 'Enter 4-digit OTP',
//                 counterText: '',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey, width: 2),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey, width: 2),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.blue, width: 2),
//                 ),
//                 contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _verifyOTP,
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
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/auth_view_model/verify_otp_view_model.dart';
import '../utils/utils.dart';
import 'register_screen.dart';

class OTPVerificationDialog extends StatefulWidget {
  final String phoneNumber;
  final String userId;
  final bool isRegistered;

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

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    String otp = _otpController.text.trim();
    if (otp.length != 4) {
      Utils.show("Please enter a valid 4-digit OTP", context);
      return;
    }

    final verifyOtpViewModel =
    Provider.of<VerifyOtpViewModel>(context, listen: false);

    verifyOtpViewModel.verifyOtpApi(
      widget.phoneNumber,
      otp,
      widget.userId,
      widget.isRegistered,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewInsets(
      context: context,
      removeBottom: true, // ✅ Prevent resize when keyboard opens
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView( // ✅ Allows scrolling on small screens
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
                      'Verify OTP',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: Colors.blue, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _verifyOTP,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
