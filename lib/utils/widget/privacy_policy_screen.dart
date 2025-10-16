import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../view_model/privacy_policy_view_model.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    final privacyPolicyViewModel =
    Provider.of<PrivacyPolicyViewModel>(context, listen: false);

    // API call for Privacy Policy only (type = 1)
    privacyPolicyViewModel.privacyPolicyApi(1, context);
  }

  @override
  Widget build(BuildContext context) {
    final privacyPolicyViewModel =
        Provider.of<PrivacyPolicyViewModel>(context).privacyPolicyModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: privacyPolicyViewModel == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Html(
          data: privacyPolicyViewModel.data?.content ?? "",
          style: {
            "h3": Style(
                fontSize: FontSize(22), fontWeight: FontWeight.bold),
            "p": Style(fontSize: FontSize(16), lineHeight: LineHeight(1.5)),
          },
        ),
      ),
    );
  }
}
