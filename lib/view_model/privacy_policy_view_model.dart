import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/model/order_history_model.dart';
import 'package:v_pharmashing/repo/order_history_repo.dart';
import 'package:v_pharmashing/repo/privacy_policy_repo.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';
import '../../utils/utils.dart';
import '../model/privacy_policy_model.dart';

class PrivacyPolicyViewModel with ChangeNotifier {
  final _loginRepo = PrivacyPolicyRepository();
  bool _loading = false;
  bool get loading => _loading;

  PrivacyPolicyModel? _privacyPolicyModel;
  PrivacyPolicyModel? get privacyPolicyModel => _privacyPolicyModel;

  setModelData(PrivacyPolicyModel value) {
    _privacyPolicyModel = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> privacyPolicyApi(dynamic policy_type,BuildContext context) async {


    setLoading(true);
    Map<String, dynamic> data = {"policy_type": policy_type};
    print("OrderHistory API Call: $data");

    try {
      final value = await _loginRepo.privacyPolicyApi(data);

      if (value['data'] != null && value['data'].isNotEmpty) {
        PrivacyPolicyModel orderModel = PrivacyPolicyModel.fromJson(value);
        setModelData(orderModel);

      } else {
        print("No orders found.");
        Utils.show("No order history found", context);
      }
    } catch (error) {
      if (kDebugMode) print('OrderHistory API Error: $error');
      // Utils.show("Something went wrong.", context);
    } finally {
      setLoading(false);
    }
  }
}
