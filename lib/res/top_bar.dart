// // import 'package:flutter/material.dart';
// // import 'package:v_pharmashing/generated/assets.dart';
// // import 'package:v_pharmashing/res/sizing_const.dart';
// //
// // class TopBar extends StatefulWidget {
// //   final VoidCallback? onHomeTap;
// //   final VoidCallback? onServicesTap;
// //   final VoidCallback? onAboutTap;
// //   final VoidCallback? onContactTap;
// //
// //   const TopBar({
// //     this.onHomeTap,
// //     this.onServicesTap,
// //     this.onAboutTap,
// //     super.key, this.onContactTap,
// //   });
// //
// //   @override
// //   State<TopBar> createState() => _TopBarState();
// // }
// //
// // class _TopBarState extends State<TopBar> {
// //   int selectedIndex = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.white,
// //       padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth*0.03, vertical: 8),
// //       child: LayoutBuilder(
// //         builder: (context, constraints) {
// //           bool isMobile = constraints.maxWidth < 600;
// //
// //           Widget buildButton(String text, int index, VoidCallback? onTap) {
// //             return TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   selectedIndex = index;
// //                 });
// //                 if (onTap != null) onTap();
// //               },
// //               child: Text(
// //                 text,
// //                 style: TextStyle(
// //                   color: selectedIndex == index ? Colors.blue : Colors.black87,
// //                   fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
// //                   fontSize: 16,
// //                 ),
// //               ),
// //             );
// //           }
// //
// //           return Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(
// //                 height: 60,
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const LogoSection(),
// //                     if (!isMobile)
// //                       Row(
// //                         children: [
// //                           buildButton("Home", 0, widget.onHomeTap),
// //                           buildButton("Services", 1, widget.onServicesTap),
// //                           buildButton("About", 2, widget.onAboutTap),
// //                           buildButton("Contact", 3, widget.onContactTap),
// //
// //                         ],
// //                       ),
// //                   ],
// //                 ),
// //               ),
// //               if (isMobile)
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 8.0, left: 8.0),
// //                   child: Wrap(
// //                     spacing: 12,
// //                     runSpacing: 8,
// //                     children: [
// //                       buildButton("Home", 0, widget.onHomeTap),
// //                       buildButton("Services", 1, widget.onServicesTap),
// //                       buildButton("About", 2, widget.onAboutTap),
// //                       buildButton("Contact", 3, widget.onContactTap),
// //                     ],
// //                   ),
// //                 ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class LogoSection extends StatelessWidget {
// //   const LogoSection({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Container(
// //           width: 70,
// //           height: 45,
// //           decoration: const BoxDecoration(shape: BoxShape.circle),
// //           child: Image.asset(
// //             Assets.assetsLogo,
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         const SizedBox(width: 8),
// //         const Text(
// //           'MediCare+',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 20,
// //             color: Colors.black87,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/generated/assets.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
//
// class TopBar extends StatefulWidget {
//   final VoidCallback? onHomeTap;
//   final VoidCallback? onServicesTap;
//   final VoidCallback? onAboutTap;
//   final VoidCallback? onContactTap;
//
//   const TopBar({
//     this.onHomeTap,
//     this.onServicesTap,
//     this.onAboutTap,
//     super.key,
//     this.onContactTap,
//   });
//
//   @override
//   State<TopBar> createState() => _TopBarState();
// }
//
// class _TopBarState extends State<TopBar> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isMobile = constraints.maxWidth < 600;
//
//           Widget buildButton(String text, int index, VoidCallback? onTap) {
//             return TextButton(
//               onPressed: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//                 if (onTap != null) onTap();
//               },
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: selectedIndex == index ? Colors.blue : Colors.black87,
//                   fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
//                   fontSize: 16,
//                 ),
//               ),
//             );
//           }
//
//           Widget contactInfo() {
//             return Row(
//               children: [
//                 const Icon(Icons.phone, size: 20, color: Colors.black54),
//                 const SizedBox(width: 4),
//                 const Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
//                 const SizedBox(width: 16),
//                 const Icon(Icons.whatshot_outlined, size: 20, color: Colors.green),
//                 const SizedBox(width: 4),
//                 const Text("WhatsApp", style: TextStyle(color: Colors.black87)),
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   child: const Text("Login", style: TextStyle(color: Colors.white)),
//                 )
//               ],
//             );
//           }
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const LogoSection(),
//                     if (!isMobile)
//                       Row(
//                         children: [
//                           buildButton("Home", 0, widget.onHomeTap),
//                           buildButton("Services", 1, widget.onServicesTap),
//                           buildButton("About", 2, widget.onAboutTap),
//                           buildButton("Contact", 3, widget.onContactTap),
//                           const SizedBox(width: 30),
//                           contactInfo(), // Added number, WhatsApp, Login
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//               if (isMobile)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0, left: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Wrap(
//                         spacing: 12,
//                         runSpacing: 8,
//                         children: [
//                           buildButton("Home", 0, widget.onHomeTap),
//                           buildButton("Services", 1, widget.onServicesTap),
//                           buildButton("About", 2, widget.onAboutTap),
//                           buildButton("Contact", 3, widget.onContactTap),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       contactInfo(), // Mobile me bhi show
//                     ],
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class LogoSection extends StatelessWidget {
//   const LogoSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 70,
//           height: 45,
//           decoration: const BoxDecoration(shape: BoxShape.circle),
//           child: Image.asset(
//             Assets.assetsLogo,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(width: 8),
//         const Text(
//           'MediCare+',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:v_pharmashing/generated/assets.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

class TopBar extends StatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onContactTap;

  const TopBar({
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    super.key,
    this.onContactTap,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          Widget buildButton(String text, int index, VoidCallback? onTap) {
            return TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
                if (onTap != null) onTap();
              },
              child: Text(
                text,
                style: TextStyle(
                  color: selectedIndex == index ? Colors.blue : Colors.black87,
                  fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            );
          }

          Widget contactInfo() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.phone, size: 20, color: Colors.black54),
                SizedBox(width: 4),
                Text("+91 9876543210", style: TextStyle(color: Colors.black87)),
                SizedBox(width: 16),
                Icon(Icons.whatshot_outlined, size: 20, color: Colors.green),
                SizedBox(width: 4),
                Text("WhatsApp", style: TextStyle(color: Colors.black87)),
              ],
            );
          }

          Widget loginButton() {
            return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text("Login", style: TextStyle(color: Colors.white)),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: isMobile ? null : 60,
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LogoSection(),
                        loginButton(), // Login top right
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        buildButton("Home", 0, widget.onHomeTap),
                        buildButton("Services", 1, widget.onServicesTap),
                        buildButton("About", 2, widget.onAboutTap),
                        buildButton("Contact", 3, widget.onContactTap),
                      ],
                    ),
                    const SizedBox(height: 8),
                    contactInfo(), // Number & WhatsApp below buttons
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LogoSection(),
                    Row(
                      children: [
                        buildButton("Home", 0, widget.onHomeTap),
                        buildButton("Services", 1, widget.onServicesTap),
                        buildButton("About", 2, widget.onAboutTap),
                        buildButton("Contact", 3, widget.onContactTap),
                        const SizedBox(width: 30),
                        contactInfo(),
                        const SizedBox(width: 16),
                        loginButton(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 45,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            Assets.assetsLogo,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'MediCare+',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
