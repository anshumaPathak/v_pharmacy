import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/model/order_history_model.dart';
import 'package:v_pharmashing/repo/confirm_order_repo.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';
import '../../utils/utils.dart';


class ConfirmOrderViewModel with ChangeNotifier {
  final _loginRepo = ConfirmOrderRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> confirmOrderApi(dynamic orderId, dynamic status, BuildContext context) async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? userId = await userViewModel.getUser();

    print("Fetched userId: $userId"); // for debugging

    setLoading(true);
    Map<String, dynamic> data = {
      "order_id": orderId,
      "user_id": userId,
      "status": status,
    };
    print("Data sent to API: $data");

    try {
      final value = await _loginRepo.confirmOrderApi(data);
      if (value['success'] == true) {
        Utils.show(value['message'], context);

        print("API Success: ${value['message']}");
        print("User ID after confirm: $userId");
      } else {
        Utils.show(value['message'], context);
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      Utils.show("Something went wrong. Please try again later.", context);
    } finally {
      setLoading(false);
    }
  }

}