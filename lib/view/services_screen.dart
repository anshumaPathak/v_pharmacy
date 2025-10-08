// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import 'package:v_pharmashing/view/services_order_widget.dart';
// import '../res/const_color.dart';
//
// class ServicesScreen extends StatefulWidget {
//   const ServicesScreen({super.key});
//
//   @override
//   State<ServicesScreen> createState() => _ServicesScreenState();
// }
//
// class _ServicesScreenState extends State<ServicesScreen> {
//   int _selectedIndex = 1;
//
//   final List<Map<String, dynamic>> serviceDetails = [
//     {
//       "title": "Order Medicine",
//       "desc": "Easily upload your prescription and order verified medicines directly from our platform.",
//       "features": [
//         "Category selection by disease/ailment",
//         "Prescription upload and verification",
//         "WhatsApp and call updates",
//         "Secure payment options"
//       ]
//     },
//     {
//       "title": "Track Order",
//       "desc": "Track your order in real-time and get instant updates on your delivery status.",
//       "features": [
//         "Real-time order status",
//         "Admin verification process",
//         "Price confirmation with discount",
//         "Delivery tracking"
//       ]
//     },
//     {
//       "title": "Verify Medicine",
//       "desc": "Ensure the authenticity of your medicines with our easy verification system.",
//       "features": [
//         "Barcode scanning",
//         "Medicine details verification",
//         "Authenticity confirmation",
//         "Counterfeit detection"
//       ]
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Top Section with Gradient
//           Container(
//             height: 580,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   AppColor.lightBlueColor,
//                   AppColor.lightBlueColor.withOpacity(0.8),
//                 ],
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: Sizes.screenHeight * 0.04),
//
//                 // Animated Title
//                 TweenAnimationBuilder(
//                   duration: const Duration(milliseconds: 800),
//                   tween: Tween<double>(begin: 0, end: 1),
//                   builder: (context, double value, child) {
//                     return Opacity(
//                       opacity: value,
//                       child: Transform.translate(
//                         offset: Offset(0, 20 * (1 - value)),
//                         child: child,
//                       ),
//                     );
//                   },
//                   child: RichText(
//                     text: const TextSpan(
//                       style: TextStyle(
//                         fontSize: 52,
//                         fontWeight: FontWeight.w700,
//                         height: 1.2,
//                         letterSpacing: -0.5,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Our ',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         TextSpan(
//                           text: 'Services',
//                           style: TextStyle(color: Color(0xFF2563EB)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 // Subtitle with animation
//                 TweenAnimationBuilder(
//                   duration: const Duration(milliseconds: 1000),
//                   tween: Tween<double>(begin: 0, end: 1),
//                   builder: (context, double value, child) {
//                     return Opacity(
//                       opacity: value,
//                       child: child,
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 100),
//                     child: Text(
//                       'Comprehensive healthcare services designed to make medicine ordering, tracking, and verification simple and secure.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.grey[700],
//                         height: 1.6,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 70),
//
//                 // Service Cards
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 80),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () => setState(() => _selectedIndex = 0),
//                           child: _ServiceCard(
//                             icon: Icons.shopping_cart_rounded,
//                             iconColor: const Color(0xFF2563EB),
//                             iconBgColor: const Color(0xFFDCE7FF),
//                             title: 'Order Medicine',
//                             description: 'Upload prescription and order verified medicines',
//                             isSelected: _selectedIndex == 0,
//                             delay: 0,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () => setState(() => _selectedIndex = 1),
//                           child: _ServiceCard(
//                             icon: Icons.local_shipping_rounded,
//                             iconColor: const Color(0xFF2563EB),
//                             iconBgColor: const Color(0xFFDCE7FF),
//                             title: 'Track Order',
//                             description: 'Real-time order tracking and status updates',
//                             isSelected: _selectedIndex == 1,
//                             delay: 200,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () => setState(() => _selectedIndex = 2),
//                           child: _ServiceCard(
//                             icon: Icons.verified_rounded,
//                             iconColor: const Color(0xFF2563EB),
//                             iconBgColor: const Color(0xFFDCE7FF),
//                             title: 'Verify Medicine',
//                             description: 'Check medicine authenticity and genuineness',
//                             isSelected: _selectedIndex == 2,
//                             delay: 400,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 60),
//
//           // Details Section with Features
//           Align(
//             alignment: Alignment.center,
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 400),
//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: SlideTransition(
//                     position: Tween<Offset>(
//                       begin: const Offset(0, 0.1),
//                       end: Offset.zero,
//                     ).animate(animation),
//                     child: child,
//                   ),
//                 );
//               },
//               child: Container(
//                 key: ValueKey<int>(_selectedIndex),
//                 width: 900,
//                 padding: const EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFF2563EB).withOpacity(0.1),
//                       blurRadius: 30,
//                       offset: const Offset(0, 10),
//                       spreadRadius: 0,
//                     ),
//                   ],
//                   border: Border.all(
//                     color: const Color(0xFF2563EB).withOpacity(0.1),
//                     width: 1,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF2563EB).withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Icon(
//                             _selectedIndex == 0
//                                 ? Icons.shopping_cart_rounded
//                                 : _selectedIndex == 1
//                                 ? Icons.local_shipping_rounded
//                                 : Icons.verified_rounded,
//                             color: const Color(0xFF2563EB),
//                             size: 32,
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 serviceDetails[_selectedIndex]["title"]!,
//                                 style: const TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF2563EB),
//                                   letterSpacing: -0.5,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 serviceDetails[_selectedIndex]["desc"]!,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.grey[600],
//                                   height: 1.5,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 32),
//
//                     Container(
//                       height: 1,
//                       color: Colors.grey[200],
//                     ),
//
//                     const SizedBox(height: 32),
//
//                     const Text(
//                       "Key Features",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     ...List.generate(
//                       serviceDetails[_selectedIndex]["features"].length,
//                           (index) => Padding(
//                         padding: const EdgeInsets.only(bottom: 16),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 24,
//                               height: 24,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF10B981).withOpacity(0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.check_rounded,
//                                 size: 16,
//                                 color: Color(0xFF10B981),
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: Text(
//                                 serviceDetails[_selectedIndex]["features"][index],
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.grey[700],
//                                   height: 1.5,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 40),
//           OrderMedicineScreen()
//         ],
//       ),
//     );
//   }
// }
//
// class _ServiceCard extends StatefulWidget {
//   final IconData icon;
//   final Color iconColor;
//   final Color iconBgColor;
//   final String title;
//   final String description;
//   final bool isSelected;
//   final int delay;
//
//   const _ServiceCard({
//     required this.icon,
//     required this.iconColor,
//     required this.iconBgColor,
//     required this.title,
//     required this.description,
//     required this.isSelected,
//     required this.delay,
//   });
//
//   @override
//   State<_ServiceCard> createState() => _ServiceCardState();
// }
//
// class _ServiceCardState extends State<_ServiceCard> {
//   bool _isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       duration: Duration(milliseconds: 600 + widget.delay),
//       tween: Tween<double>(begin: 0, end: 1),
//       curve: Curves.easeOutCubic,
//       builder: (context, double value, child) {
//         return Transform.scale(
//           scale: 0.8 + (0.2 * value),
//           child: Opacity(
//             opacity: value,
//             child: child,
//           ),
//         );
//       },
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//           transform: Matrix4.identity()
//             ..translate(0.0, _isHovered ? -8.0 : 0.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: widget.isSelected
//                   ? const Color(0xFF2563EB)
//                   : _isHovered
//                   ? const Color(0xFF2563EB).withOpacity(0.4)
//                   : Colors.grey.withOpacity(0.2),
//               width: widget.isSelected ? 3 : 2,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: widget.isSelected
//                     ? const Color(0xFF2563EB).withOpacity(0.25)
//                     : _isHovered
//                     ? Colors.black.withOpacity(0.15)
//                     : Colors.black.withOpacity(0.08),
//                 blurRadius: _isHovered || widget.isSelected ? 24 : 12,
//                 offset: Offset(0, _isHovered || widget.isSelected ? 8 : 4),
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(36),
//             child: Column(
//               children: [
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   width: 90,
//                   height: 90,
//                   decoration: BoxDecoration(
//                     gradient: widget.isSelected
//                         ? const LinearGradient(
//                       colors: [Color(0xFF2563EB), Color(0xFF3B82F6)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     )
//                         : null,
//                     color: widget.isSelected ? null : widget.iconBgColor,
//                     shape: BoxShape.circle,
//                     boxShadow: widget.isSelected
//                         ? [
//                       BoxShadow(
//                         color: const Color(0xFF2563EB).withOpacity(0.4),
//                         blurRadius: 20,
//                         offset: const Offset(0, 8),
//                       ),
//                     ]
//                         : null,
//                   ),
//                   child: Icon(
//                     widget.icon,
//                     size: 40,
//                     color: widget.isSelected ? Colors.white : widget.iconColor,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   widget.title,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                     color: widget.isSelected
//                         ? const Color(0xFF2563EB)
//                         : Colors.black87,
//                     letterSpacing: -0.3,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   widget.description,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey[600],
//                     height: 1.5,
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
import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/view/services_order_widget.dart';
import '../res/const_color.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> serviceDetails = [
    {
      "title": "Order Medicine",
      "desc":
      "Easily upload your prescription and order verified medicines directly from our platform.",
      "features": [
        "Category selection by disease/ailment",
        "Prescription upload and verification",
        "WhatsApp and call updates",
        "Secure payment options"
      ]
    },
    {
      "title": "Track Order",
      "desc":
      "Track your order in real-time and get instant updates on your delivery status.",
      "features": [
        "Real-time order status",
        "Admin verification process",
        "Price confirmation with discount",
        "Delivery tracking"
      ]
    },
    {
      "title": "Verify Medicine",
      "desc":
      "Ensure the authenticity of your medicines with our easy verification system.",
      "features": [
        "Barcode scanning",
        "Medicine details verification",
        "Authenticity confirmation",
        "Counterfeit detection"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Gradient Section
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 80, vertical: isMobile ? 30 : 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.lightBlueColor,
                  AppColor.lightBlueColor.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Sizes.screenHeight * 0.02),
                // Title
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 800),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Our ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Services',
                          style: TextStyle(color: Color(0xFF2563EB)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Subtitle
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
                  child: Text(
                    'Comprehensive healthcare services designed to make medicine ordering, tracking, and verification simple and secure.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                // Service Cards (Responsive)
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 700;
                    final serviceCards = [
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 0),
                        child: _ServiceCard(
                          icon: Icons.shopping_cart_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: 'Order Medicine',
                          description:
                          'Upload prescription and order verified medicines',
                          isSelected: _selectedIndex == 0,
                          delay: 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 1),
                        child: _ServiceCard(
                          icon: Icons.local_shipping_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: 'Track Order',
                          description:
                          'Real-time order tracking and status updates',
                          isSelected: _selectedIndex == 1,
                          delay: 200,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedIndex = 2),
                        child: _ServiceCard(
                          icon: Icons.verified_rounded,
                          iconColor: const Color(0xFF2563EB),
                          iconBgColor: const Color(0xFFDCE7FF),
                          title: 'Verify Medicine',
                          description:
                          'Check medicine authenticity and genuineness',
                          isSelected: _selectedIndex == 2,
                          delay: 400,
                        ),
                      ),
                    ];

                    if (isMobile) {
                      return Column(
                        children: [
                          ...serviceCards
                              .map((card) => Padding(
                            padding:
                            const EdgeInsets.only(bottom: 24.0),
                            child: card,
                          ))
                              .toList(),
                        ],
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: serviceCards[0]),
                          const SizedBox(width: 24),
                          Expanded(child: serviceCards[1]),
                          const SizedBox(width: 24),
                          Expanded(child: serviceCards[2]),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 60),

          // Details Section
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                      begin: const Offset(0, 0.1), end: Offset.zero)
                      .animate(animation),
                  child: child,
                ),
              );
            },
            child: Container(
              key: ValueKey<int>(_selectedIndex),
              width: isMobile ? double.infinity : 900,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2563EB).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _selectedIndex == 0
                              ? Icons.shopping_cart_rounded
                              : _selectedIndex == 1
                              ? Icons.local_shipping_rounded
                              : Icons.verified_rounded,
                          color: const Color(0xFF2563EB),
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          serviceDetails[_selectedIndex]["title"]!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    serviceDetails[_selectedIndex]["desc"]!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Key Features",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    serviceDetails[_selectedIndex]["features"].length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              size: 20, color: Colors.green),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              serviceDetails[_selectedIndex]["features"][index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                  height: 1.5),
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

          const SizedBox(height: 40),
          OrderMedicineScreen(),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;
  final bool isSelected;
  final int delay;

  const _ServiceCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.delay,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + widget.delay),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform:
          Matrix4.translationValues(0, _isHovered ? -8.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF2563EB)
                  : Colors.grey.withOpacity(0.2),
              width: widget.isSelected ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? const Color(0xFF2563EB)
                        : widget.iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.icon,
                    size: 38,
                    color: widget.isSelected
                        ? Colors.white
                        : widget.iconColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                    widget.isSelected ? const Color(0xFF2563EB) : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
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
