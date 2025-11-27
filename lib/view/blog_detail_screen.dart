import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http; // ✅ ADD THIS IMPORT
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:v_pharmashing/res/footer_section.dart';
import 'package:v_pharmashing/view_model/blog_view_model.dart';
import '../helper/seo_helper.dart';
import '../res/top_bar.dart';
import '../utils/routes/routes.dart';
import '../view_model/language_view_model.dart';
import 'dashboard_screen.dart';

class BlogDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String slug;

  const BlogDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.slug,
  });

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}
class _BlogDetailPageState extends State<BlogDetailPage> {
  String currentLang = "en";
  Map<String, dynamic>? blogDetail;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _fetchBlogDetail);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageViewModel = Provider.of<LanguageViewModel>(context);
    final newLang = languageViewModel.languageCode;

    if (currentLang != newLang) {
      currentLang = newLang;
      // Go back to BlogScreen when language changes
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.goNamed(RoutesName.blogScreen);
      });
    }
  }

  Future<void> _fetchBlogDetail() async {
    setState(() => isLoading = true);

    final sp = await SharedPreferences.getInstance();
    final savedLang = sp.getString('language_code') ?? "en";
    currentLang = savedLang;
    int type = savedLang == "en" ? 1 : 2;

    final slug = widget.slug;
    final url = "https://root.vpharmacy.in/userapi/user/Blogs/$type/$slug";
    final response = await http.get(Uri.parse(url));

    if (!mounted) return;

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['data'] != null) {
        setState(() {
          blogDetail = json['data'];
          isLoading = false;
        });

        // Update SEO
        html.document.title = blogDetail?['seo_tittel'] ?? "Blogs | V Pharmacy";
        SeoHelper.updateSeoTags(
          title: blogDetail?['seo_tittel'] ?? "",
          description: blogDetail?['seo_discription'] ?? "",
          image: "https://root.vpharmacy.in/public/uploads/${blogDetail?['image'] ?? ''}",
          keywords: (blogDetail?['seo_tag'] ?? '').split(','),
        );
      } else {
        setState(() => isLoading = false);
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (blogDetail == null) {
      return const Scaffold(
        body: Center(child: Text("No Blog Found")),
      );
    }

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopBar(
            selectedIndex: 4,
            onHomeTap: () => context.goNamed(RoutesName.dashboardScreen),
            onServicesTap: () => context.goNamed(RoutesName.servicesScreen),
            onAboutTap: () => context.goNamed(RoutesName.aboutUsScreen),
            onContactTap: () => context.goNamed(RoutesName.contactScreen),
            onBlogTap: () => context.goNamed(RoutesName.blogScreen),
          ),
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
                            "https://root.vpharmacy.in/public/uploads/${blogDetail?['image'] ?? ''}",
                            width: double.infinity,
                            height: 430,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 430,
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          blogDetail?['title'] ?? "",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Html(
                          data: blogDetail?['description'] ?? "",
                          style: {
                            "body": Style(
                              fontSize: FontSize(12),
                              color: Colors.black54,
                              lineHeight: LineHeight(1.4),
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
                        const SizedBox(height: 30),
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

// class _BlogDetailPageState extends State<BlogDetailPage> {
//   String currentLang = "en";
//   Map<String, dynamic>? blogDetail;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, _fetchBlogDetail);
//   }
//
//   Future<void> _fetchBlogDetail() async {
//     final sp = await SharedPreferences.getInstance();
//     final savedLang = sp.getString('language_code') ?? "en";
//     currentLang = savedLang;
//     int type = savedLang == "en" ? 1 : 2;
//
//     final slug = widget.slug;
//     final url =
//         "https://root.vpharmacy.in/userapi/user/Blogs/$type/$slug";
//
//     final response = await http.get(Uri.parse(url)); // ✅ Using http here
//
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       if (json['data'] != null) {
//         setState(() {
//           blogDetail = json['data'];
//           isLoading = false;
//         });
//
//         /// ✅ Update SEO details dynamically
//         html.document.title = blogDetail?['seo_tittel'] ?? "Blogs | V Pharmacy";
//         SeoHelper.updateSeoTags(
//           title: blogDetail?['seo_tittel'] ?? "",
//           description: blogDetail?['seo_discription'] ?? "",
//           image:
//           "https://root.vpharmacy.in/public/uploads/${blogDetail?['image'] ?? ''}",
//           keywords: (blogDetail?['seo_tag'] ?? '').split(','),
//         );
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     if (blogDetail == null) {
//       return const Scaffold(
//         body: Center(child: Text("No Blog Found")),
//       );
//     }
//
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           TopBar(
//             selectedIndex: 4,
//             onHomeTap: () => context.goNamed(RoutesName.dashboardScreen),
//             onServicesTap: () => context.goNamed(RoutesName.servicesScreen),
//             onAboutTap: () => context.goNamed(RoutesName.aboutUsScreen),
//             onContactTap: () => context.goNamed(RoutesName.contactScreen),
//             onBlogTap: () => context.goNamed(RoutesName.blogScreen),
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
//                             "https://root.vpharmacy.in/public/uploads/${blogDetail?['image'] ?? ''}",
//                             width: double.infinity, // ✅ full screen width
//                             height: 430,            // ✅ fixed height
//                             fit: BoxFit.fill,   // ✅ full width, no cropping
//                             // alignment: Alignment.topCenter, // ✅ image top-center aligned
//                             errorBuilder: (context, error, stackTrace) => Container(
//                               // width: double.infinity,
//                               height: 430,
//                               color: Colors.grey[200],
//                               child: const Icon(
//                                 Icons.image_not_supported,
//                                 size: 50,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//
//                           // child: Image.network(
//                           //   "https://root.vpharmacy.in/public/uploads/${blogDetail?['image'] ?? ''}",
//                           //   width: double.infinity, // ✅ poori screen width lega
//                           //   height: 300,
//                           //   fit: BoxFit.contain,   // ✅ poori width fill karega, image crop nahi hogi
//                           //   // alignment: Alignment.topCenter, // optional: image top se align rahegi
//                           //   errorBuilder: (context, error, stackTrace) => Container(
//                           //     width: double.infinity,
//                           //     height: 300,
//                           //     color: Colors.grey[200],
//                           //     child: const Icon(
//                           //       Icons.image_not_supported,
//                           //       size: 50,
//                           //       color: Colors.grey,
//                           //     ),
//                           //   ),
//                           // ),
//
//
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           blogDetail?['title'] ?? "",
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             height: 1.3,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Html(
//                           data: blogDetail?['description'] ?? "",
//                           style: {
//                             "body": Style(
//                               fontSize: FontSize(12),
//                               color: Colors.black54,
//                               lineHeight: LineHeight(1.4),
//                             ),
//                           },
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
//                         const SizedBox(height: 30),
//
//                       ],
//                     ),
//                   ),
//                   const FooterSection(),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
