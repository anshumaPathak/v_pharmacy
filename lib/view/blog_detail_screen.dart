// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/footer_section.dart';
//
// import '../res/top_bar.dart';
// import 'dashboard_screen.dart';
//
// class BlogDetailPage extends StatefulWidget {
//   final String title;
//   final String image;
//   final String description;
//
//   const BlogDetailPage({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.description,
//   });
//
//   @override
//   State<BlogDetailPage> createState() => _BlogDetailPageState();
// }
//
// class _BlogDetailPageState extends State<BlogDetailPage> {
//   int selectedIndex = 0;
//   String activeSection = "home";
//
//   void _changeSection(String section) {
//     setState(() {
//       activeSection = section;
//       if (section == "home") selectedIndex = 0;
//       if (section == "services") selectedIndex = 1;
//       if (section == "about") selectedIndex = 2;
//       if (section == "contact") selectedIndex = 3;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           TopBar(
//             selectedIndex: selectedIndex,
//             onHomeTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "home"),
//                 ),
//               );
//             },
//             onServicesTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "services"),
//                 ),
//               );
//             },
//             onAboutTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "about"),
//                 ),
//               );
//             },
//             onContactTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                   const DashboardScreen(initialSection: "contact"),
//                 ),
//               );
//             },
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: width < 600 ? 16 : 60,
//                       vertical: 20,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.network(
//                             widget.image,
//                             width: double.infinity,
//                             height: 300,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           widget.title,
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             height: 1.3,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: const [
//                             Icon(Icons.calendar_today, size: 16, color: Colors.grey),
//                             SizedBox(width: 6),
//                             Text(
//                               "October 31, 2025",
//                               style: TextStyle(color: Colors.grey, fontSize: 13),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           widget.description,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.black87,
//                             height: 1.6,
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.yellow.shade50,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: const Offset(4, 4),
//                                 blurRadius: 12,
//                               ),
//                             ],
//                           ),
//                           child: const Text(
//                             "Thank you for reading! Stay tuned for more updates.",
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.black87,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           FooterSection()
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:v_pharmashing/res/footer_section.dart';
import '../res/top_bar.dart';
import 'dashboard_screen.dart';

class BlogDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  const BlogDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  int selectedIndex = 0;
  String activeSection = "home";

  void _changeSection(String section) {
    setState(() {
      activeSection = section;
      if (section == "home") selectedIndex = 0;
      if (section == "services") selectedIndex = 1;
      if (section == "about") selectedIndex = 2;
      if (section == "contact") selectedIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// 🟦 Top Bar (Fixed)
          TopBar(
            selectedIndex: selectedIndex,
            onHomeTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "home"),
                ),
              );
            },
            onServicesTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "services"),
                ),
              );
            },
            onAboutTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "about"),
                ),
              );
            },
            onContactTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "contact"),
                ),
              );
            },
            onBlogTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(initialSection: "blog"),
                ),
              );
            },
          ),

          /// 🟨 Everything below TopBar scrolls
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width < 600 ? 16 : 60,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.image,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 300,
                                color: Colors.grey[200],
                                child: const Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.network(
                        //     widget.image,
                        //     width: double.infinity,
                        //     height: 300,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   children: const [
                        //     Icon(Icons.calendar_today,
                        //         size: 16, color: Colors.grey),
                        //     SizedBox(width: 6),
                        //     Text(
                        //       "October 31, 2025",
                        //       style:
                        //       TextStyle(color: Colors.grey, fontSize: 13),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        // Text(
                        //   widget.description,
                        //   style: const TextStyle(
                        //     fontSize: 15,
                        //     color: Colors.black87,
                        //     height: 1.6,
                        //   ),
                        // ),
                        // Html(
                        //   data:  widget.description.toString(),
                        //   style: {
                        //     "body": Style(
                        //       fontSize: FontSize(12),
                        //       color: Colors.black54,
                        //       maxLines: 3,
                        //       textOverflow: TextOverflow.ellipsis,
                        //       lineHeight: LineHeight(1.4),
                        //     ),
                        //     "p": Style(
                        //       margin: Margins.zero,
                        //       padding: HtmlPaddings.zero,
                        //     ),
                        //   },
                        // ),
                        Html(
                          data: widget.description.toString(),
                          style: {
                            "body": Style(
                              fontSize: FontSize(12),
                              color: Colors.black54,
                              lineHeight: LineHeight(1.4),
                            ),
                            "p": Style(
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                            ),
                          },
                        ),

                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade50,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(4, 4),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: const Text(
                            "Thank you for reading! Stay tuned for more updates.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
