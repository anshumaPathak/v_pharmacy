//https://vpharmacy.codescarts.com/userapi/
class ApiUrl {
  static const String baseUrl = "https://vpharmacy.codescarts.com/userapi/user";
  static const String login = "$baseUrl/login";
  static const String sendOtp = "https://otp.fctechteam.org/send_otp.php?"
      "mode=test&digit=4&mobile=";
  static const String verifyOtp ="https://otp.fctechteam.org/verifyotp.php?mobile=";
  static const String register ="${baseUrl}/register";
  static const String createOrder ="${baseUrl}/create_order";
  static const String userProfile ="${baseUrl}/user_profile";
  static const String orderHistory ="${baseUrl}/orders_history";
  static const String confirmOrder ="${baseUrl}/confirm_order";
  static const String contactUs ="${baseUrl}/contact_us";
  static const String privacyPolicy ="${baseUrl}/get_policy";
  static const String rating ="${baseUrl}/giveRating";
  static const String PharmacistRating ="${baseUrl}/give_pharmacist_rating";
  static const String diseaseCategories ="${baseUrl}/disease-categories";
  static const String adminContactDetail ="${baseUrl}/admin_contact";
  static const String blog ="${baseUrl}/Blogs";
  static const String seoRank ="${baseUrl}/increase_seo_rank";
}