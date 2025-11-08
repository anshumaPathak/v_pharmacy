// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:v_pharmashing/view_model/blog_view_model.dart';
// import 'package:v_pharmashing/view_model/language_view_model.dart';
// import 'package:v_pharmashing/view_model/seo_rank_view_model.dart';
// import '../helper/seo_helper.dart';
// import 'blog_detail_screen.dart';
//
// class BlogScreen extends StatefulWidget {
//   const BlogScreen({super.key});
//
//   @override
//   State<BlogScreen> createState() => _BlogScreenState();
// }
//
// class _BlogScreenState extends State<BlogScreen> {
//   String currentLang = "en";
//   bool _isFirstLoad = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLanguageAndFetchBlogs();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     final languageViewModel = Provider.of<LanguageViewModel>(context);
//
//     if (!_isFirstLoad &&
//         languageViewModel.languageCode != null &&
//         languageViewModel.languageCode != currentLang) {
//       currentLang = languageViewModel.languageCode!;
//       _loadLanguageAndFetchBlogs();
//     }
//
//     _isFirstLoad = false;
//   }
//
//   Future<void> _loadLanguageAndFetchBlogs() async {
//     final sp = await SharedPreferences.getInstance();
//     final savedLang = sp.getString('language_code') ?? "en";
//
//     if (!mounted) return;
//     setState(() => currentLang = savedLang);
//
//     int type = savedLang == "en" ? 1 : 2;
//
//     final blogViewModel = Provider.of<BlogViewModel>(context, listen: false);
//     await blogViewModel.blogApi(type, context);
//
//     if (blogViewModel.blogModel?.data != null &&
//         blogViewModel.blogModel!.data!.isNotEmpty) {
//       final firstBlog = blogViewModel.blogModel!.data!.first;
//
//       final seoTitle = (firstBlog.seoTittel != null && firstBlog.seoTittel!.isNotEmpty)
//           ? firstBlog.seoTittel!
//           : "Blogs | V Pharmacy";
//
//       final seoDescription = (firstBlog.seoDiscription != null && firstBlog.seoDiscription!.isNotEmpty)
//           ? firstBlog.seoDiscription!
//           : "Explore the latest health, wellness, and medicine blogs on V Pharmacy.";
//
//       final seoTags = (firstBlog.seoTag != null && firstBlog.seoTag!.isNotEmpty)
//           ? firstBlog.seoTag!.split(",")
//           : ["health", "wellness", "medicine", "v pharmacy", "blogs"];
//
//       final imageUrl = "https://vpharmacy.codescarts.com/public/uploads/${firstBlog.image}";
//
//       html.document.title = seoTitle;
//
//       SeoHelper.updateSeoTags(
//         title: seoTitle,
//         description: seoDescription,
//         image: imageUrl,
//         keywords: seoTags,
//       );
//     }
//   }
//
//   int getCrossAxisCount(double width) {
//     if (width < 600) return 1;
//     if (width < 1000) return 2;
//     return 3;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final blogViewModel = Provider.of<BlogViewModel>(context).blogModel;
//     final width = MediaQuery.of(context).size.width;
//     final languageViewModel = Provider.of<LanguageViewModel>(context);
//     currentLang = languageViewModel.languageCode ?? "en";
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 1200),
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: getCrossAxisCount(width),
//                       mainAxisSpacing: 35,
//                       crossAxisSpacing: 35,
//                       mainAxisExtent: 300,
//                     ),
//                     itemCount: blogViewModel?.data?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       final blog = blogViewModel?.data?[index];
//                       bool isHovered = false;
//
//                       return StatefulBuilder(
//                         builder: (context, setInnerState) {
//                           return MouseRegion(
//                             onEnter: (_) => setInnerState(() => isHovered = true),
//                             onExit: (_) => setInnerState(() => isHovered = false),
//                             child: AnimatedContainer(
//                               duration: const Duration(milliseconds: 250),
//                               transform: isHovered
//                                   ? (Matrix4.identity()..scale(1.05))
//                                   : Matrix4.identity(),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: isHovered
//                                       ? [Colors.blue.shade50, Colors.white]
//                                       : [Colors.white, Colors.grey.shade50],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: isHovered
//                                         ? Colors.black.withOpacity(0.25)
//                                         : Colors.black.withOpacity(0.1),
//                                     offset: const Offset(4, 6),
//                                     blurRadius: isHovered ? 20 : 10,
//                                   ),
//                                 ],
//                               ),
//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(16),
//                                 onTap: () {
//                                   final seoRankViewModel = Provider.of<SeoRankViewModel>(context, listen: false);
//                                   seoRankViewModel.seoRankApi(
//                                       blog.id,
//                                       context
//                                   );
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => BlogDetailPage(
//                                         title: blog!.title.toString(),
//                                         image:
//                                         "https://vpharmacy.codescarts.com/public/uploads/${blog.image.toString()}",
//                                         description: blog.description!,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: const BorderRadius.vertical(
//                                         top: Radius.circular(16),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Image.network(
//                                             "https://vpharmacy.codescarts.com/public/uploads/${blog!.image.toString()}",
//                                             height: 160,
//                                             width: double.infinity,
//                                             fit: BoxFit.cover,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) =>
//                                                 Container(
//                                                   height: 160,
//                                                   color: Colors.grey.shade300,
//                                                   child: const Icon(
//                                                       Icons.image_not_supported,
//                                                       size: 40,
//                                                       color: Colors.grey),
//                                                 ),
//                                           ),
//                                           if (isHovered)
//                                             Container(
//                                               height: 160,
//                                               decoration: BoxDecoration(
//                                                 gradient: LinearGradient(
//                                                   colors: [
//                                                     Colors.black.withOpacity(0.4),
//                                                     Colors.transparent,
//                                                   ],
//                                                   begin: Alignment.bottomCenter,
//                                                   end: Alignment.topCenter,
//                                                 ),
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(10),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               blog.title.toString(),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                                 height: 1.3,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 6),
//                                             Html(
//                                               data: blog.description.toString(),
//                                               style: {
//                                                 "body": Style(
//                                                   fontSize: FontSize(12),
//                                                   color: Colors.black54,
//                                                   maxLines: 3,
//                                                   textOverflow:
//                                                   TextOverflow.ellipsis,
//                                                   lineHeight: LineHeight(1.4),
//                                                 ),
//                                                 "p": Style(
//                                                   margin: Margins.zero,
//                                                   padding: HtmlPaddings.zero,
//                                                 ),
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:v_pharmashing/view_model/blog_view_model.dart';
import 'package:v_pharmashing/view_model/language_view_model.dart';
import 'package:v_pharmashing/view_model/seo_rank_view_model.dart';
import 'package:v_pharmashing/utils/utils.dart';
import '../helper/seo_helper.dart';
import 'blog_detail_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String currentLang = "en";
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();

    // 👇 Delayed call to avoid black flicker
    Future.delayed(Duration.zero, () {
      _loadLanguageAndFetchBlogs();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final languageViewModel = Provider.of<LanguageViewModel>(context);

    if (!_isFirstLoad &&
        languageViewModel.languageCode != null &&
        languageViewModel.languageCode != currentLang) {
      currentLang = languageViewModel.languageCode!;
      _loadLanguageAndFetchBlogs();
    }

    _isFirstLoad = false;
  }

  Future<void> _loadLanguageAndFetchBlogs() async {
    final sp = await SharedPreferences.getInstance();
    final savedLang = sp.getString('language_code') ?? "en";

    // ⚡ Don't call setState immediately — it causes flicker
    currentLang = savedLang;

    int type = savedLang == "en" ? 1 : 2;

    final blogViewModel = Provider.of<BlogViewModel>(context, listen: false);
    await blogViewModel.blogApi(type, context);

    if (!mounted) return;

    if (blogViewModel.blogModel?.data != null &&
        blogViewModel.blogModel!.data!.isNotEmpty) {
      final firstBlog = blogViewModel.blogModel!.data!.first;

      final seoTitle = (firstBlog.seoTittel != null && firstBlog.seoTittel!.isNotEmpty)
          ? firstBlog.seoTittel!
          : "Blogs | V Pharmacy";

      final seoDescription = (firstBlog.seoDiscription != null && firstBlog.seoDiscription!.isNotEmpty)
          ? firstBlog.seoDiscription!
          : "Explore the latest health, wellness, and medicine blogs on V Pharmacy.";

      final seoTags = (firstBlog.seoTag != null && firstBlog.seoTag!.isNotEmpty)
          ? firstBlog.seoTag!.split(",")
          : ["health", "wellness", "medicine", "v pharmacy", "blogs"];

      final imageUrl = "https://vpharmacy.codescarts.com/public/uploads/${firstBlog.image}";

      html.document.title = seoTitle;

      SeoHelper.updateSeoTags(
        title: seoTitle,
        description: seoDescription,
        image: imageUrl,
        keywords: seoTags,
      );

      // 👇 Safe setState after everything loaded
      if (mounted) setState(() {});
    }
  }

  int getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 1000) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final blogViewModel = Provider.of<BlogViewModel>(context).blogModel;
    final width = MediaQuery.of(context).size.width;
    final languageViewModel = Provider.of<LanguageViewModel>(context);
    currentLang = languageViewModel.languageCode ?? "en";

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(width),
                    mainAxisSpacing: 35,
                    crossAxisSpacing: 35,
                    mainAxisExtent: 300,
                  ),
                  itemCount: blogViewModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final blog = blogViewModel?.data?[index];
                    bool isHovered = false;

                    return StatefulBuilder(
                      builder: (context, setInnerState) {
                        return MouseRegion(
                          onEnter: (_) => setInnerState(() => isHovered = true),
                          onExit: (_) => setInnerState(() => isHovered = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            transform: isHovered
                                ? (Matrix4.identity()..scale(1.05))
                                : Matrix4.identity(),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: isHovered
                                    ? [Colors.blue.shade50, Colors.white]
                                    : [Colors.white, Colors.grey.shade50],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: isHovered
                                      ? Colors.black.withOpacity(0.25)
                                      : Colors.black.withOpacity(0.1),
                                  offset: const Offset(4, 6),
                                  blurRadius: isHovered ? 20 : 10,
                                ),
                              ],
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                final seoRankViewModel =
                                Provider.of<SeoRankViewModel>(context, listen: false);
                                seoRankViewModel.seoRankApi(blog.id, context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlogDetailPage(
                                      title: blog!.title.toString(),
                                      image:
                                      "https://vpharmacy.codescarts.com/public/uploads/${blog.image.toString()}",
                                      description: blog.description!,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          "https://vpharmacy.codescarts.com/public/uploads/${blog!.image.toString()}",
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Container(
                                            height: 160,
                                            width: double.infinity,
                                            color: Colors.grey.shade300,
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        if (isHovered)
                                          Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black.withOpacity(0.4),
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(10),
                                  //     child: Column(
                                  //       crossAxisAlignment: CrossAxisAlignment.start,
                                  //       children: [
                                  //         Text(
                                  //           blog.title.toString(),
                                  //           maxLines: 2,
                                  //           overflow: TextOverflow.ellipsis,
                                  //           style: const TextStyle(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.bold,
                                  //             color: Colors.black,
                                  //             height: 1.3,
                                  //           ),
                                  //         ),
                                  //         const SizedBox(height: 6),
                                  //         Html(
                                  //           data: blog.description.toString(),
                                  //           style: {
                                  //             "body": Style(
                                  //               fontSize: FontSize(12),
                                  //               color: Colors.black54,
                                  //               maxLines: 3,
                                  //               textOverflow: TextOverflow.ellipsis,
                                  //               lineHeight: LineHeight(1.4),
                                  //             ),
                                  //             "p": Style(
                                  //               margin: Margins.zero,
                                  //               padding: HtmlPaddings.zero,
                                  //             ),
                                  //           },
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            blog.title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              height: 1.3,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          LayoutBuilder(
                                            builder: (context, constraints) {
                                              // Convert HTML to plain text
                                              final plainText = blog.description
                                                  .toString()
                                                  .replaceAll(RegExp(r'<[^>]*>'), ' ')
                                                  .trim();

                                              return Text(
                                                plainText,
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54,
                                                  height: 1.4,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
