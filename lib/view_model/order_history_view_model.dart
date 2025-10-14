import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/model/order_history_model.dart';
import 'package:v_pharmashing/repo/order_history_repo.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';
import '../../utils/utils.dart';


class OrderHistoryViewModel with ChangeNotifier {
  final _loginRepo = OrderHistoryRepository();
  bool _loading = false;
  bool get loading => _loading;

  OrderHistoryModel? _orderHistoryModel;
  OrderHistoryModel? get orderHistoryModel => _orderHistoryModel;

  setModelData(OrderHistoryModel value) {
    _orderHistoryModel = value;
    notifyListeners();
  }
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> orderHistoryApi(BuildContext context) async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? userId = await userViewModel.getUser();

    if (userId == null) {
      Utils.show("User not logged in", context);
      return;
    }

    setLoading(true);
    Map<String, dynamic> data = {"user_id": userId};
    print("OrderHistory API Call: $data");

    try {
      final value = await _loginRepo.orderHistoryApi(data);

      if (value['success'] == true) {
        // Model me convert karna
        OrderHistoryModel orderModel = OrderHistoryModel.fromJson(value);
        setModelData(orderModel);

        // Message show karna
        // Utils.show(orderModel.message ?? "", context);

        // Order data print karna
        print("OrderHistory Data:");
        if (orderModel.data != null && orderModel.data!.isNotEmpty) {
          for (var order in orderModel.data!) {
            print(order.toJson());
          }
        } else {
          print("No orders found.");
        }
      } else {
        Utils.show(value['message'] ?? "", context);
      }
    } catch (error) {
      if (kDebugMode) print('OrderHistory API Error: $error');
      Utils.show("Something went wrong.", context);
    } finally {
      setLoading(false);
    }
  }

}