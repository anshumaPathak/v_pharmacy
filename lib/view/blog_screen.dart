import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:v_pharmashing/view_model/blog_view_model.dart';
import 'package:v_pharmashing/view_model/language_view_model.dart';
import '../helper/seo_helper.dart';

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
    Future.delayed(Duration.zero, _loadLanguageAndFetchBlogs);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageViewModel = Provider.of<LanguageViewModel>(context);

    if (!_isFirstLoad && languageViewModel.languageCode != currentLang) {
      currentLang = languageViewModel.languageCode;
      _loadLanguageAndFetchBlogs();
    }

    _isFirstLoad = false;
  }

  Future<void> _loadLanguageAndFetchBlogs() async {
    final sp = await SharedPreferences.getInstance();
    final savedLang = sp.getString('language_code') ?? "en";
    currentLang = savedLang;

    int type = savedLang == "en" ? 1 : 2;
    final blogViewModel = Provider.of<BlogViewModel>(context, listen: false);
    await blogViewModel.blogApi(type, context);

    if (!mounted) return;

    final blogData = blogViewModel.blogModel?.data;
    if (blogData != null && blogData.isNotEmpty) {
      final firstBlog = blogData.first;
      final seoTitle = firstBlog.seoTittel?.isNotEmpty == true
          ? firstBlog.seoTittel!
          : "Blogs | V Pharmacy";
      final seoDescription = firstBlog.seoDiscription?.isNotEmpty == true
          ? firstBlog.seoDiscription!
          : "Explore health and wellness blogs on V Pharmacy.";
      final seoTags =
          firstBlog.seoTag?.split(",") ??
          ["health", "wellness", "medicine", "v pharmacy", "blogs"];
      final imageUrl =
          "https://vpharmacy.codescarts.com/public/uploads/${firstBlog.image}";

      html.document.title = seoTitle;
      SeoHelper.updateSeoTags(
        title: seoTitle,
        description: seoDescription,
        image: imageUrl,
        keywords: seoTags,
      );
      setState(() {});
    }
  }

  int getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 1000) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final blogViewModel = Provider.of<BlogViewModel>(context);
    final blogModel = blogViewModel.blogModel;
    final blogs = blogModel?.data ?? [];
    final width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (blogViewModel.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (blogs.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "No blogs available.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        }

        return Padding(
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
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                bool isHovered = false;

                return StatefulBuilder(
                  builder: (context, setInnerState) {
                    return MouseRegion(
                      onEnter: (_) => setInnerState(() => isHovered = true),
                      onExit: (_) => setInnerState(() => isHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: isHovered
                            ? (Matrix4.identity()..scale(1.05))
                            : Matrix4.identity(),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                isHovered ? 0.25 : 0.1,
                              ),
                              blurRadius: isHovered ? 20 : 10,
                              offset: const Offset(4, 6),
                            ),
                          ],
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            print("onTap");
                            print(blog.slug);
                            if (blog.slug != null) {
                              final slug = blog.slug ?? '';
                              context.go('/blog/${Uri.encodeComponent(slug)}');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Details not available"),
                                ),
                              );
                            }
                            // final slug = blog.slug ?? '';
                            // context.go('/blog/${Uri.encodeComponent(slug)}');
                            // final slug = blog.slug ?? '';
                            // context.pushNamed(
                            //   'blogDetail',
                            //   pathParameters: {'slug': slug},
                            //   extra: {
                            //     'title': blog.title ?? '',
                            //     'image':
                            //         "https://vpharmacy.codescarts.com/public/uploads/${blog.image ?? ""}",
                            //     'description': blog.description ?? '',
                            //   },
                            // );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.network(
                                  "https://vpharmacy.codescarts.com/public/uploads/${blog.image ?? ""}",
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 160,
                                        width: double.infinity,
                                        color: Colors.grey.shade300,
                                        child: const Icon(
                                          Icons.image,
                                          size: 40,
                                        ),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blog.title ?? "",
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
                                      Text(
                                        (blog.description ?? "")
                                            .replaceAll(RegExp(r'<[^>]*>'), ' ')
                                            .trim(),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          height: 1.4,
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
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
