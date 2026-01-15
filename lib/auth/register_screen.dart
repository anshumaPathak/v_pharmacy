// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/view_model/auth_view_model/register_view_model.dart';
//
// import '../res/const_color.dart';
//
// class CompleteRegistrationDialog extends StatefulWidget {
//   final String phoneNumber;
//
//   const CompleteRegistrationDialog({
//     super.key,
//     required this.phoneNumber,
//   });
//
//   @override
//   State<CompleteRegistrationDialog> createState() =>
//       _CompleteRegistrationDialogState();
// }
//
// class _CompleteRegistrationDialogState
//     extends State<CompleteRegistrationDialog> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final registerViewModel =
//     Provider.of<RegisterViewModel>(context, listen: false);
//     return MediaQuery.removeViewInsets(
//       context: context,
//       removeBottom: true,
//       child: Dialog(
//         backgroundColor: AppColor.whiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: SingleChildScrollView(
//           child: Container(
//             width: 500,
//             padding: const EdgeInsets.all(32),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Complete Registration',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.black54),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Please provide your details to complete registration',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Full Name Input
//                 Row(
//                   children: const [
//                     Icon(Icons.person_outline, size: 18, color: Colors.black87),
//                     SizedBox(width: 8),
//                     Text(
//                       'Full Name',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _nameController,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
//                   ],
//                   decoration: InputDecoration(
//                     hintText: 'Enter your full name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                       const BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                       const BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                       const BorderSide(color: Colors.blue, width: 2),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Email Input
//                 const Text(
//                   'Email Address',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
//                   ],
//                   decoration: InputDecoration(
//                     hintText: 'your.email@example.com',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Colors.blue, width: 2),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Phone Verified Info
//                 Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade50,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Row(
//                     children: [
//                       const Text(
//                         'Phone: ',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black54,
//                         ),
//                       ),
//                       Text(
//                         widget.phoneNumber,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Icon(Icons.check_circle,
//                           color: Colors.green, size: 16),
//                       const SizedBox(width: 4),
//                       const Text(
//                         'Verified',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.green,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Complete Registration Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       final registerViewModel =
//                       Provider.of<RegisterViewModel>(context, listen: false);
//                       registerViewModel.registerApi(
//                         _nameController.text,
//                         _emailController.text,
//                         widget.phoneNumber,
//                         context,
//                       );
//                       // Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: registerViewModel.loading?CircularProgressIndicator(): Text(
//                       'Complete Registration',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 Center(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: const TextSpan(
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black54,
//                       ),
//                       children: [
//                         TextSpan(text: 'By continuing, you agree to our '),
//                         TextSpan(
//                           text: 'Terms of Service',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                         TextSpan(text: ' and '),
//                         TextSpan(
//                           text: 'Privacy Policy',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/view_model/auth_view_model/register_view_model.dart';
import '../res/const_color.dart';

class CompleteRegistrationDialog extends StatefulWidget {
  final String phoneNumber;

  const CompleteRegistrationDialog({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<CompleteRegistrationDialog> createState() =>
      _CompleteRegistrationDialogState();
}

class _CompleteRegistrationDialogState
    extends State<CompleteRegistrationDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);

    return MediaQuery.removeViewInsets(
      context: context,
      removeBottom: true,
      child: Dialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
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
                    const Text(
                      'Complete Registration',
                      style: TextStyle(
                        fontSize: 16,
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
                  'Please provide your details to complete registration',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),

                // Full Name Input
                Row(
                  children: const [
                    Icon(Icons.person_outline, size: 18, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1),
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
                const SizedBox(height: 16),

                // Email Input
                const Text(
                  'Email Address (optional)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9@._-]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'your.email@example.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1),
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
                const SizedBox(height: 16),

                // Phone Verified Info
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Phone: ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        widget.phoneNumber,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        'Verified',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Complete Registration Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: registerViewModel.loading
                        ? null
                        : () {
                      final name = _nameController.text.trim();
                      final email = _emailController.text.trim();

                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your name'),
                          ),
                        );
                        return;
                      }

                      registerViewModel.registerApi(
                        name,
                        email,
                        widget.phoneNumber,
                        context,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: registerViewModel.loading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      'Complete Registration',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Terms & Privacy Info
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
        ),
      ),
    );
  }
}
