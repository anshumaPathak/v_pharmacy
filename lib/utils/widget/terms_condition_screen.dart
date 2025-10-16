import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../view_model/privacy_policy_view_model.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    super.initState();
    final privacyPolicyViewModel =
    Provider.of<PrivacyPolicyViewModel>(context, listen: false);

    // API call for Privacy Policy only (type = 1)
    privacyPolicyViewModel.privacyPolicyApi(2, context);
  }

  @override
  Widget build(BuildContext context) {
    final privacyPolicyViewModel =
        Provider.of<PrivacyPolicyViewModel>(context).privacyPolicyModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms Condition",
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
