import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../../repo/create_order_repo.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';


class CreateOrderViewModel with ChangeNotifier {
  final _loginRepo = CreateOrderRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> createOrderApi(dynamic fullName,dynamic diseaseCategory, dynamic deliveryAddress,
      dynamic whatsappNumber,dynamic alternateNumber,dynamic medicineDuration,dynamic specialInstructions,
      dynamic prescriptionFile,context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    setLoading(true);
    Map<String, dynamic> data = {
      "user_id":userId,
      "full_name": fullName,
      "disease_category":diseaseCategory,
      "delivery_address":deliveryAddress,
      "whatsapp_number":whatsappNumber,
      "alternate_number":alternateNumber,
      "medicine_duration":medicineDuration,
      "special_instructions":specialInstructions,
      "prescription_file":prescriptionFile
    };
    print(data);
    try {
      final value = await _loginRepo.createOrderApi(data);
      if (value['success'] == true) {
        final userViewModel = Provider.of<UserViewModel>(context, listen: false);
        String? userId = await userViewModel.getUser();
        // Utils.show(value['message'], context);

        // String? userId = await userViewModel.getUser();

        print("User ID: $userId");
        // context.goNamed(RoutesName.navbar);
        // GoRouter.of(context).goNamed(RoutesName.navbar);

        // Navigator.pushNamed(context, RoutesName.navbar);
      } else {
        print("Error Message: ${value['message']}");
        if (value['message'] == "Email already exists") {
          Utils.show("Email has already been taken", context);
        } else {
          Utils.show(value['message'], context);
        }
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
