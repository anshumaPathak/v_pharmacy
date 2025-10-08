// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../generated/assets.dart';
// import '../../res/const_color.dart';
// import '../../res/sizing_const.dart';
//
// class DashboardBody extends StatelessWidget {
//   const DashboardBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 700,
//       decoration:  BoxDecoration(
//           color: AppColor.lightBlueColor
//       ),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final isMobile = constraints.maxWidth < 800;
//           return Flex(
//             direction: isMobile ? Axis.vertical : Axis.horizontal,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: const [
//               DashboardTextSection(),
//               DashboardImageSection(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DashboardTextSection extends StatelessWidget {
//   const DashboardTextSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;
//
//     return Expanded(
//       flex: 1,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth*0.08),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment:
//           isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Your Trusted,',
//               style: TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const Text(
//               'Medicine Partner',
//               style: TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Order verified medicines, track deliveries in real-time,'
//                   ' and ensure authenticity with our professional healthcare platform.',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.black54,
//               ),
//             ),
//             Sizes.spaceHeight20,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // horizontal padding thoda maintain kare
//                   height: Sizes.screenHeight * 0.075,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColor.blueColor,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.add_shopping_cart_sharp, color: AppColor.whiteColor),
//                       const SizedBox(width: 6),
//                       Text(
//                         "Order Medicine",
//                         style: TextStyle(
//                           color: AppColor.whiteColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   height: Sizes.screenHeight * 0.075,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: AppColor.whiteColor,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(width: 6),
//                       Text(
//                         "Learn More",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Sizes.spaceHeight20,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ...List.generate(
//                   5,
//                       (index) => const Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   "4.9 / 5 Rating",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             )
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DashboardImageSection extends StatelessWidget {
//   const DashboardImageSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Expanded(
//       flex: 1,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth*0.08,vertical: Sizes.screenHeight*0.03),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           child: Image(
//             image: AssetImage(Assets.assetsGirl),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../../res/const_color.dart';
import '../../res/sizing_const.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final isMobile = screen.width < 800;

    return Container(
      width: double.infinity,
      height: isMobile ? null : 700, // auto height for mobile
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 0,
      ),
      decoration: BoxDecoration(color: AppColor.lightBlueColor),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DashboardTextSection(isMobile: isMobile),
          DashboardImageSection(isMobile: isMobile),
        ],
      ),
    );
  }
}

class DashboardTextSection extends StatelessWidget {
  final bool isMobile;
  const DashboardTextSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    Widget content = Padding(
      padding: EdgeInsets.symmetric(horizontal: screen.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            'Your Trusted,',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          Text(
            'Medicine Partner',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 20),
          Text(
            'Order verified medicines, track deliveries in real-time, '
                'and ensure authenticity with our professional healthcare platform.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              color: Colors.black54,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                height: screen.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.blueColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_shopping_cart_sharp,
                        color: AppColor.whiteColor),
                    const SizedBox(width: 6),
                    Text(
                      "Order Medicine",
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                height: screen.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.whiteColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Learn More",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              ...List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "4.9 / 5 Rating",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return isMobile ? content : Expanded(flex: 1, child: content);
  }
}

class DashboardImageSection extends StatelessWidget {
  final bool isMobile;
  const DashboardImageSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    Widget content = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screen.width * 0.08, vertical: screen.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 10), // shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            Assets.assetsGirl,
            fit: BoxFit.cover,
            height: isMobile ? screen.height * 0.35 : null,
          ),
        ),
      ),
    );

    return isMobile ? content : Expanded(flex: 1, child: content);
  }
}

// class DashboardImageSection extends StatelessWidget {
//   final bool isMobile;
//   const DashboardImageSection({super.key, required this.isMobile});
//
//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//
//     Widget content = Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: screen.width * 0.08, vertical: screen.height * 0.03),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         child: Image.asset(
//           Assets.assetsGirl,
//           fit: BoxFit.cover,
//           height: isMobile ? screen.height * 0.35 : null,
//         ),
//       ),
//     );
//
//     return isMobile ? content : Expanded(flex: 1, child: content);
//   }
// }
