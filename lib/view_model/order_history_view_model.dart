// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/model/order_history_model.dart';
// import 'package:v_pharmashing/repo/order_history_repo.dart';
// import 'package:v_pharmashing/view_model/user_view_model.dart';
// import '../../utils/utils.dart';
//
//
// class OrderHistoryViewModel with ChangeNotifier {
//   final _loginRepo = OrderHistoryRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//
//   OrderHistoryModel? _orderHistoryModel;
//   OrderHistoryModel? get orderHistoryModel => _orderHistoryModel;
//
//   setModelData(OrderHistoryModel value) {
//     _orderHistoryModel = value;
//     notifyListeners();
//   }
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> orderHistoryApi(BuildContext context) async {
//     final userViewModel = Provider.of<UserViewModel>(context, listen: false);
//     String? userId = await userViewModel.getUser();
//
//     if (userId == null) {
//       Utils.show("User not logged in", context);
//       return;
//     }
//
//     setLoading(true);
//     Map<String, dynamic> data = {"user_id": userId};
//     print("OrderHistory API Call: $data");
//
//     try {
//       final value = await _loginRepo.orderHistoryApi(data);
//
//       if (value['success'] == true) {
//         // Model me convert karna
//         OrderHistoryModel orderModel = OrderHistoryModel.fromJson(value);
//         setModelData(orderModel);
//
//         // Message show karna
//         // Utils.show(orderModel.message ?? "", context);
//
//         // Order data print karna
//         print("OrderHistory Data:");
//         if (orderModel.data != null && orderModel.data!.isNotEmpty) {
//           for (var order in orderModel.data!) {
//             print(order.toJson());
//           }
//         } else {
//           print("No orders found.");
//         }
//       } else {
//         Utils.show(value['message'] ?? "", context);
//       }
//     } catch (error) {
//       if (kDebugMode) print('OrderHistory API Error: $error');
//       Utils.show("Something went wrong.", context);
//     } finally {
//       setLoading(false);
//     }
//   }
//
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  Future<void> orderHistoryApi(dynamic limit, dynamic offset, BuildContext context) async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? userId = await userViewModel.getUser();

    if (userId == null) {
      Utils.show("User not logged in", context);
      return;
    }

    setLoading(true);
    Map<String, dynamic> data = {
      "user_id": userId,
      "limit": limit,
      "offset": offset
    };
    print("OrderHistory API Call: $data");

    try {
      final value = await _loginRepo.orderHistoryApi(data);
      print("OrderHistory Response: $value");

      if (value['data'] != null && value['data'].isNotEmpty) {
        OrderHistoryModel newOrderModel = OrderHistoryModel.fromJson(value);

        // ✅ MAIN FIX: Check offset to decide append or replace
        if (offset == 0) {
          // 🔄 Initial load or reset - REPLACE data
          setModelData(newOrderModel);
          print("🔄 Initial load: ${newOrderModel.data?.length} orders loaded");
        } else {
          // ➕ Load more - APPEND data
          if (_orderHistoryModel != null && _orderHistoryModel!.data != null) {
            // Existing data ke saath new data add karo
            _orderHistoryModel!.data!.addAll(newOrderModel.data ?? []);
            print("➕ Appended ${newOrderModel.data?.length} orders. Total: ${_orderHistoryModel!.data!.length}");
            notifyListeners(); // UI update karo
          } else {
            // Agar pehle se data nahi hai to set kar do
            setModelData(newOrderModel);
            print("🆕 First time data set: ${newOrderModel.data?.length} orders");
          }
        }

        print("✅ Final order count: ${_orderHistoryModel?.data?.length}");
      } else {
        print("⚠️ No orders found in response.");
        if (offset == 0) {
          // Only show message on initial load
          Utils.show("No order history found", context);
        }
      }
    } catch (error) {
      if (kDebugMode) print('❌ OrderHistory API Error: $error');
      // Utils.show("Something went wrong.", context);
    } finally {
      setLoading(false);
    }
  }

  // ✅ Optional: Clear all orders (for logout or refresh)
  void clearOrders() {
    _orderHistoryModel = null;
    notifyListeners();
    print("🗑️ Orders cleared");
  }
}
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/model/order_history_model.dart';
// import 'package:v_pharmashing/repo/order_history_repo.dart';
// import 'package:v_pharmashing/view_model/user_view_model.dart';
// import '../../utils/utils.dart';
//
// class OrderHistoryViewModel with ChangeNotifier {
//   final _loginRepo = OrderHistoryRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//
//   OrderHistoryModel? _orderHistoryModel;
//   OrderHistoryModel? get orderHistoryModel => _orderHistoryModel;
//
//   setModelData(OrderHistoryModel value) {
//     _orderHistoryModel = value;
//     notifyListeners();
//   }
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> orderHistoryApi(dynamic limit,dynamic offset,BuildContext context) async {
//     final userViewModel = Provider.of<UserViewModel>(context, listen: false);
//     String? userId = await userViewModel.getUser();
//
//     if (userId == null) {
//       Utils.show("User not logged in", context);
//       return;
//     }
//
//     setLoading(true);
//     Map<String, dynamic> data = {
//       "user_id": userId,
//       "limit":limit,
//       "offset":offset
//     };
//     print("OrderHistory API Call: $data");
//
//     try {
//       final value = await _loginRepo.orderHistoryApi(data);
//       print("OrderHistory Response: $value");
//
//       // ✅ FIX: 'success' key nahi hai API me
//       if (value['data'] != null && value['data'].isNotEmpty) {
//         OrderHistoryModel orderModel = OrderHistoryModel.fromJson(value);
//         setModelData(orderModel);
//
//         print("✅ Orders found: ${orderModel.data?.length}");
//       } else {
//         print("No orders found.");
//         Utils.show("No order history found", context);
//       }
//     } catch (error) {
//       if (kDebugMode) print('OrderHistory API Error: $error');
//       // Utils.show("Something went wrong.", context);
//     } finally {
//       setLoading(false);
//     }
//   }
// }



//import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/res/launcher.dart';
// import 'package:v_pharmashing/view_model/confirm_order_view_model.dart';
// import 'package:v_pharmashing/view_model/order_history_view_model.dart';
// import 'package:v_pharmashing/view_model/pharmacist_rating_view_model.dart';
// import 'package:v_pharmashing/view_model/rating_view_model.dart';
//
// import '../../l10n/app_localizations.dart';
// import '../../model/order_history_model.dart';
// import '../../res/const_color.dart';
// import '../../res/sizing_const.dart';
// import '../../view_model/user_view_model.dart';
//
// class YourOrdersScreen extends StatefulWidget {
//   const YourOrdersScreen({super.key});
//
//   @override
//   State<YourOrdersScreen> createState() => _YourOrdersScreenState();
// }
//
// class _YourOrdersScreenState extends State<YourOrdersScreen> {
//   int _limit = 4; // Per load kitne orders fetch honge
//   int _currentOffset = 0; // Current offset track karne ke liye
//   bool _isLoadingMore = false; // Loading state
//   String? userId;
//   bool _showOrderDetails = false;
//   Data? _selectedOrder;
//
//   // ✅ NEW: Local list to store all orders
//   List<Data> _allOrders = [];
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _loadUserId();
//       _loadInitialOrders();
//     });
//   }
//
//   Future<void> _loadUserId() async {
//     final userViewModel = Provider.of<UserViewModel>(context, listen: false);
//     String? id = await userViewModel.getUser();
//     setState(() {
//       userId = id;
//     });
//   }
//
//   // Initial orders load (4 orders)
//   Future<void> _loadInitialOrders() async {
//     final viewModel = Provider.of<OrderHistoryViewModel>(
//       context,
//       listen: false,
//     );
//     await viewModel.orderHistoryApi(_limit, 0, context);
//
//     // ✅ Store in local list
//     final orders = viewModel.orderHistoryModel?.data ?? [];
//     setState(() {
//       _allOrders = List.from(orders);
//       _currentOffset = _allOrders.length;
//     });
//
//     print("✅ Initial load: ${_allOrders.length} orders");
//   }
//
//   // Show More button ke liye - improved logic with LOCAL APPEND
//   Future<void> _loadMoreOrders() async {
//     if (_isLoadingMore) return;
//
//     setState(() {
//       _isLoadingMore = true;
//     });
//
//     final viewModel = Provider.of<OrderHistoryViewModel>(
//       context,
//       listen: false,
//     );
//
//     print("📊 Before API: _allOrders = ${_allOrders.length}, offset = $_currentOffset");
//
//     // Next 4 orders fetch karo
//     await viewModel.orderHistoryApi(_limit, _currentOffset, context);
//
//     // ✅ NEW: Manually append new data to local list
//     final newOrders = viewModel.orderHistoryModel?.data ?? [];
//
//     setState(() {
//       if (newOrders.isNotEmpty) {
//         // ✅ Append new orders to existing list
//         _allOrders.addAll(newOrders);
//         _currentOffset = _allOrders.length;
//         print("✅ Appended! Total orders now: ${_allOrders.length}");
//       } else {
//         print("⚠️ No new orders found!");
//       }
//       _isLoadingMore = false;
//     });
//   }
//
//   // Show Less button ke liye - reset to initial 4
//   void _showLessOrders() {
//     final viewModel = Provider.of<OrderHistoryViewModel>(
//       context,
//       listen: false,
//     );
//
//     // ✅ Reset local list to first 4 orders
//     setState(() {
//       _allOrders = _allOrders.take(_limit).toList();
//       _currentOffset = _limit;
//     });
//
//     print("📉 Show Less: Reset to ${_allOrders.length} orders");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isMobile = constraints.maxWidth < 800;
//         final orderVM = Provider.of<OrderHistoryViewModel>(context);
//
//         // ✅ Use local list instead of ViewModel data
//         final orders = _allOrders;
//
//         // Backend se total nahi aa raha, to hum assume karenge:
//         // Agar exactly _limit (4) orders aaye last call mein, to aur orders ho sakte hain
//         final hasMoreOrders = orderVM.orderHistoryModel?.data?.length == _limit;
//
//         print("🖥️ UI Update: Total orders = ${orders.length}, HasMore = $hasMoreOrders");
//         print("Condition check: last API returned ${orderVM.orderHistoryModel?.data?.length ?? 0} orders");
//
//         return Stack(
//           children: [
//             SingleChildScrollView(
//               physics: _showOrderDetails
//                   ? const NeverScrollableScrollPhysics()
//                   : const BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   // Header
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.symmetric(
//                       vertical: 60,
//                       horizontal: isMobile ? 20 : 40,
//                     ),
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)!.yourOrders,
//                           style: const TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF1E293B),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           AppLocalizations.of(context)!.trackOrdersInfo,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[600],
//                             height: 1.5,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   // Login prompt
//                   if (userId == null)
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: isMobile ? 16 : 60,
//                       ),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: Sizes.screenWidth * 0.03,
//                           vertical: Sizes.screenHeight * 0.03,
//                         ),
//                         width: isMobile
//                             ? MediaQuery.of(context).size.width * 0.9
//                             : 800,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           border: Border.all(
//                             color: Colors.grey.withOpacity(0.3),
//                             width: 1,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.08),
//                               blurRadius: 20,
//                               offset: const Offset(0, 8),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("Please"),
//                             SizedBox(height: Sizes.screenHeight * 0.02),
//                             Text(
//                               "login",
//                               style: TextStyle(
//                                 color: AppColor.blueColor,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(height: Sizes.screenHeight * 0.02),
//                             const Text("to place an order"),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   // Orders list
//                   if (userId != null)
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: isMobile ? 16 : 60,
//                       ),
//                       child: Column(
//                         children: [
//                           // No orders message
//                           if (orders.isEmpty)
//                             const Center(
//                               child: Text(
//                                 '👋 Welcome! You don't have any orders yet. Please create your first order to start tracking it.',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//
//                           // Orders grid/list
//                           if (orders.isNotEmpty)
//                             isMobile
//                                 ? Column(
//                                     children: orders
//                                         .map(
//                                           (order) => Padding(
//                                             padding: const EdgeInsets.only(
//                                               bottom: 20,
//                                             ),
//                                             child: _buildOrderCard(order),
//                                           ),
//                                         )
//                                         .toList(),
//                                   )
//                                 : Wrap(
//                                     spacing: 20,
//                                     runSpacing: 20,
//                                     children: orders
//                                         .map(
//                                           (order) => SizedBox(
//                                             width: MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     2 -
//                                                 80,
//                                             child: _buildOrderCard(order),
//                                           ),
//                                         )
//                                         .toList(),
//                                   ),
//
//                           const SizedBox(height: 20),
//
//                           // Show More/Less buttons
//                           if (orders.isNotEmpty)
//                             Column(
//                               children: [
//                                 // Debug info - TESTING ke liye
//                                 Container(
//                                   padding: const EdgeInsets.all(8),
//                                   color: Colors.yellow[100],
//                                   child: Text(
//                                     'Debug: Orders=${orders.length}, Offset=$_currentOffset, HasMore=$hasMoreOrders',
//                                     style: const TextStyle(fontSize: 10, color: Colors.red),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//
//                                 // Show More button - Agar orders exactly current offset ke equal hain
//                                 if (hasMoreOrders)
//                                   _isLoadingMore
//                                       ? const Padding(
//                                           padding: EdgeInsets.all(16.0),
//                                           child: CircularProgressIndicator(),
//                                         )
//                                       : ElevatedButton.icon(
//                                           onPressed: _loadMoreOrders,
//                                           icon: const Icon(Icons.refresh, color: Colors.white),
//                                           label: const Text(
//                                             "Load More Orders",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: AppColor.blueColor,
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 24,
//                                               vertical: 12,
//                                             ),
//                                             elevation: 2,
//                                           ),
//                                         ),
//
//                                 // Show Less button
//                                 if (orders.length > _limit)
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 8),
//                                     child: OutlinedButton(
//                                       onPressed: _showLessOrders,
//                                       style: OutlinedButton.styleFrom(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 24,
//                                           vertical: 12,
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         "Show Less",
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),
//
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//
//             if (_showOrderDetails && _selectedOrder != null)
//               _buildOrderDetailsOverlay(isMobile),
//           ],
//         );
//       },
//     );
//   }
//
//   // Order card builder
//   Widget _buildOrderCard(Data order) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.withOpacity(0.2)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Order ID + Status
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text(
//                   order.randomOrderid ?? 'N/A',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1E293B),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: _getStatusColor(order.status),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   _getStatusText(order.status),
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 4),
//           Text(
//             order.diseaseCategory ?? 'N/A',
//             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 20),
//
//           // Dates
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Order Date:',
//                       style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       _formatDate(order.createdAt.toString()),
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1E293B),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppLocalizations.of(context)!.duration,
//                       style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       order.medicineDuration ?? 'N/A',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1E293B),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           // Final Price
//           if (order.summary?.finalAmount != null &&
//               order.summary!.finalAmount!.isNotEmpty &&
//               order.summary!.finalAmount != '0.00') ...[
//             const SizedBox(height: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.finalPrice,
//                   style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   '₹${order.summary!.finalAmount}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF10B981),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//
//           const SizedBox(height: 16),
//
//           // Medicines
//           Text(
//             AppLocalizations.of(context)!.medicines,
//             style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 8),
//           (order.medicines == null || order.medicines!.isEmpty)
//               ? Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF1F5F9),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: const Text(
//                     'No medicines listed',
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF475569),
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 )
//               : ExpansionTile(
//                   title: const Text(
//                     "Medicines",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                   ),
//                   children: order.medicines!.map((m) {
//                     double price = double.tryParse(m.price.toString()) ?? 0.0;
//                     double discount =
//                         double.tryParse(m.discountPrice.toString()) ?? 0.0;
//                     int quantity = m.quantity ?? 0;
//                     double totalPrice =
//                         double.tryParse(m.totalPrice.toString()) ?? 0.0;
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 4,
//                       ),
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${m.quantity ?? 0} x ${m.medicineName ?? 'N/A'}',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xFF1E293B),
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Price: ₹$price',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF475569),
//                                 ),
//                               ),
//                               Text(
//                                 'Discount: ₹$discount',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 'Total: ₹$totalPrice',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xFF0284C7),
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//
//           if (order.status == 1 &&
//               order.summary?.original != null &&
//               order.summary!.original!.isNotEmpty &&
//               order.summary!.original != '0.00') ...[
//             const SizedBox(height: 16),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFEFF6FF),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: const Color(0xFFDBEAFE)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     AppLocalizations.of(context)!.priceConfirmationRequired,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                       color: Colors.blue[900],
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Original:',
//                         style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                       ),
//                       Text(
//                         '₹${order.summary!.original}',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context)!.discount,
//                         style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                       ),
//                       Text(
//                         '-₹${order.summary!.discount}',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.redAccent,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Final:',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                       Text(
//                         '₹${order.summary!.finalAmount}',
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF10B981),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             final confirmOrderViewModel =
//                                 Provider.of<ConfirmOrderViewModel>(
//                               context,
//                               listen: false,
//                             );
//                             await confirmOrderViewModel.confirmOrderApi(
//                               order.id,
//                               "2",
//                               context,
//                             );
//
//                             setState(() {
//                               order.status = 2;
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF10B981),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: Text(
//                             AppLocalizations.of(context)!.accept,
//                             style: const TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () async {
//                             final confirmOrderViewModel =
//                                 Provider.of<ConfirmOrderViewModel>(
//                               context,
//                               listen: false,
//                             );
//                             await confirmOrderViewModel.confirmOrderApi(
//                               order.id,
//                               "5",
//                               context,
//                             );
//
//                             setState(() {
//                               order.status = 5;
//                             });
//                           },
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             side: const BorderSide(
//                               color: Colors.redAccent,
//                               width: 1.5,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: Text(
//                             AppLocalizations.of(context)!.cancel,
//                             style: const TextStyle(
//                               color: Colors.redAccent,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//
//           const SizedBox(height: 20),
//
//           Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       _selectedOrder = order;
//                       _showOrderDetails = true;
//                     });
//                   },
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     side: BorderSide(color: Colors.grey[400]!),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     AppLocalizations.of(context)!.viewDetails,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF475569),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     Launcher.launchWhatsApp(context, order.whatsappNumber);
//                   },
//                   icon: const Icon(Icons.chat_bubble_outline, size: 16),
//                   label: Text(
//                     AppLocalizations.of(context)!.whatsApp,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF10B981),
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper methods
//   Color _getStatusColor(int? status) {
//     switch (status) {
//       case 0:
//         return Colors.orange;
//       case 1:
//         return Colors.blue;
//       case 2:
//         return Colors.green;
//       case 3:
//         return Colors.purple;
//       case 4:
//         return Colors.teal;
//       case 5:
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   String _getStatusText(int? status) {
//     switch (status) {
//       case 0:
//         return "Pending";
//       case 1:
//         return "Price Confirmation";
//       case 2:
//         return "Shipped";
//       case 3:
//         return "Pickup/On the way";
//       case 4:
//         return "Delivered";
//       case 5:
//         return "Cancelled";
//       default:
//         return "Unknown";
//     }
//   }
//
//   String _formatDate(String? dateStr) {
//     if (dateStr == null) return 'N/A';
//     try {
//       final date = DateTime.parse(dateStr);
//       return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//     } catch (e) {
//       return dateStr;
//     }
//   }
//
//   // Order Details Overlay
//   Widget _buildOrderDetailsOverlay(bool isMobile) {
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     final selectedOrder = _selectedOrder!;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _showOrderDetails = false;
//           _selectedOrder = null;
//         });
//       },
//       child: Container(
//         color: Colors.black.withOpacity(0.5),
//         child: Center(
//           child: GestureDetector(
//             onTap: () {},
//             child: Container(
//               margin: EdgeInsets.symmetric(
//                 horizontal: isMobile ? 20 : 100,
//                 vertical: 40,
//               ),
//               constraints: const BoxConstraints(maxWidth: 900),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFF8FAFC),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(16),
//                         topRight: Radius.circular(16),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.receipt_long,
//                           color: Color(0xFF3B82F6),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             'Order Details - ${selectedOrder.randomOrderid ?? 'N/A'}',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF1E293B),
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _showOrderDetails = false;
//                               _selectedOrder = null;
//                             });
//                           },
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.all(24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           isMobile
//                               ? Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     _buildInfoSection(),
//                                     const SizedBox(height: 24),
//                                     _buildDeliverySection(),
//                                   ],
//                                 )
//                               : Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Expanded(child: _buildInfoSection()),
//                                     const SizedBox(width: 40),
//                                     Expanded(child: _buildDeliverySection()),
//                                   ],
//                                 ),
//                           const SizedBox(height: 24),
//                           Text(
//                             AppLocalizations.of(context)!.medicines,
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           (selectedOrder.medicines == null ||
//                                   selectedOrder.medicines!.isEmpty)
//                               ? const Text(
//                                   'No medicines listed',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                 )
//                               : Wrap(
//                                   spacing: 8,
//                                   runSpacing: 8,
//                                   children: selectedOrder.medicines!
//                                       .map(
//                                         (m) => Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 14,
//                                             vertical: 8,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xFFEFF6FF),
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             border: Border.all(
//                                               color: const Color(0xFFDBEAFE),
//                                             ),
//                                           ),
//                                           child: Text(
//                                             '${m.quantity ?? 0} x ${m.medicineName ?? 'N/A'}',
//                                             style: const TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color(0xFF1E40AF),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoSection() {
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     final selectedOrder = _selectedOrder!;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.customer,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.fullName ?? "N/A",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           AppLocalizations.of(context)!.category,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.diseaseCategory ?? "N/A",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           AppLocalizations.of(context)!.duration,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.medicineDuration ?? "N/A",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           AppLocalizations.of(context)!.whatsApp,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.whatsappNumber ?? "N/A",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDeliverySection() {
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     final selectedOrder = _selectedOrder!;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.orderDate,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           _formatDate(selectedOrder.createdAt.toString()),
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           AppLocalizations.of(context)!.deliveryAddress,
//           style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.deliveryAddress ?? "N/A",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 12),
//         if (selectedOrder.estimatedDeliveryDate != null) ...[
//           const SizedBox(height: 16),
//           Text(
//             AppLocalizations.of(context)!.estimatedDelivery,
//             style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             _formatDate(selectedOrder.estimatedDeliveryDate as String?),
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF1E293B),
//             ),
//           ),
//         ],
//         if (selectedOrder.summary?.finalAmount != null &&
//             selectedOrder.summary!.finalAmount!.isNotEmpty &&
//             selectedOrder.summary!.finalAmount != '0.00') ...[
//           const SizedBox(height: 16),
//           Text(
//             AppLocalizations.of(context)!.finalPrice,
//             style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             '₹${selectedOrder.summary!.finalAmount}',
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF10B981),
//             ),
//           ),
//         ],
//         if (selectedOrder.status == 4) ...[
//           const SizedBox(height: 12),
//           ElevatedButton(
//             onPressed: () {
//               _showRatingDialog(selectedOrder);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF3B82F6),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               'Rate Order',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//         if (selectedOrder.pharmacistId != null) ...[
//           const SizedBox(height: 12),
//           ElevatedButton(
//             onPressed: () {
//               _showPharmacistRatingDialog(selectedOrder);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF3B82F6),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               'Pharmacist Rating',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ],
//     );
//   }
//
//   void _showPharmacistRatingDialog(Data order) {
//     final pharmacistRatingViewModel = Provider.of<PharmacistRatingViewModel>(
//       context,
//       listen: false,
//     );
//     double _rating = 0;
//     TextEditingController _descController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) => AlertDialog(
//             backgroundColor: AppColor.whiteColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             title: const Text(
//               'Rating Pharmacist',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Please rate your Pharmacist experience',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 16),
//                   RatingBar.builder(
//                     initialRating: 0,
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     itemCount: 5,
//                     itemSize: 50,
//                     unratedColor: Colors.grey[300],
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
//                     itemBuilder: (context, _) =>
//                         const Icon(Icons.star, color: Colors.amber),
//                     onRatingUpdate: (rating) {
//                       setState(() {
//                         _rating = rating;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 8),
//                   if (_rating > 0)
//                     Text(
//                       'Your rating: $_rating',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _descController,
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       hintText: 'Write your feedback here...',
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 8,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   pharmacistRatingViewModel.pharmacistRatingApi(
//                     order.pharmacistId,
//                     order.id,
//                     _rating,
//                     _descController.text,
//                     context,
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF3B82F6),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showRatingDialog(Data order) {
//     final ratingViewModel = Provider.of<RatingViewModel>(
//       context,
//       listen: false,
//     );
//     double _rating = 0;
//     TextEditingController _descController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) => AlertDialog(
//             backgroundColor: AppColor.whiteColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             title: const Text(
//               'Rate your order',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Please rate your delivery experience',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 16),
//                   RatingBar.builder(
//                     initialRating: 0,
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     itemCount: 5,
//                     itemSize: 50,
//                     unratedColor: Colors.grey[300],
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
//                     itemBuilder: (context, _) =>
//                         const Icon(Icons.star, color: Colors.amber),
//                     onRatingUpdate: (rating) {
//                       setState(() {
//                         _rating = rating;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 8),
//                   if (_rating > 0)
//                     Text(
//                       'Your rating: $_rating',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _descController,
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       hintText: 'Write your feedback here...',
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 8,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ratingViewModel.ratingApi(
//                     order.deliveryPartnerId,
//                     order.id,
//                     _rating,
//                     _descController.text,
//                     context,
//                   );
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF3B82F6),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }