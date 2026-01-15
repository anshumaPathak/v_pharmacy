import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:v_pharmashing/repo/contact_repo.dart';
import '../../utils/utils.dart';


class ContactUsViewModel with ChangeNotifier {
  final _loginRepo = ContactRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> contactUsApi(dynamic fullName, dynamic email, dynamic phone_number,dynamic category,dynamic subject,
      dynamic message,BuildContext context) async {


    setLoading(true);
    Map<String, dynamic> data = {
      "full_name": fullName,
      "email": email,
      "phone_number": phone_number,
      "category":category,
      "subject":subject,
      "message":message
    };
    // print("Data sent to API: $data");

    try {
      final value = await _loginRepo.contactUsApi(data);
      if (value['success'] == true) {
        Utils.show(value['message'], context);

        // print("API Success: ${value['message']}");
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