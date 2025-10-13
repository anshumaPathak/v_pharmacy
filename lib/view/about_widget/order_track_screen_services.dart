// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:v_pharmashing/view_model/order_history_view_model.dart';
//
// import '../../l10n/app_localizations.dart';
// import '../../model/order_history_model.dart';
//
// class YourOrdersScreen extends StatefulWidget {
//   const YourOrdersScreen({super.key});
//
//   @override
//   State<YourOrdersScreen> createState() => _YourOrdersScreenState();
// }
//
// class _YourOrdersScreenState extends State<YourOrdersScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final viewModel =
//       Provider.of<OrderHistoryViewModel>(context, listen: false);
//       viewModel.orderHistoryApi(context);
//     });
//   }
//   bool _showOrderDetails = false;
//   Map<String, dynamic>? _selectedOrder;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isMobile = constraints.maxWidth < 800;
//         final orderVM = Provider.of<OrderHistoryViewModel>(context);
//         final orders = orderVM.orderHistoryModel?.data ?? [];
//         // final orders = [
//         //   {
//         //     'orderId': 'ORD-2024-1234',
//         //     'category': 'Heart & Blood Pressure',
//         //     'orderDate': '2024-01-15',
//         //     'duration': '30 days',
//         //     'medicines': ['Lisinopril 10mg', 'Metoprolol 50mg'],
//         //     'status': 'Pending Verification',
//         //     'statusColor': const Color(0xFFFEF3C7),
//         //     'statusTextColor': const Color(0xFF92400E),
//         //     'message': 'Waiting for admin verification. Updates via WhatsApp.',
//         //     'customer': 'Jane Smith',
//         //     'deliveryAddress': '456 Oak Ave, City, State 67890',
//         //     'estimatedDelivery': '2024-01-17',
//         //     'whatsapp': '+1-234-567-8902',
//         //     'timeline': [
//         //       {'title': 'Order Placed', 'time': '2024-01-14, 02:15 PM', 'completed': true},
//         //       {'title': 'Prescription Verification', 'time': '2024-01-14, 04:20 PM', 'completed': true},
//         //       {'title': 'Price Confirmation', 'time': 'Awaiting Response', 'completed': false, 'active': false},
//         //       {'title': 'Processing', 'time': 'Pending', 'completed': false, 'active': false},
//         //       {'title': 'Shipped', 'time': 'Pending', 'completed': false, 'active': false},
//         //       {'title': 'Delivered', 'time': 'Pending', 'completed': false, 'active': false},
//         //     ],
//         //   },
//         //   {
//         //     'orderId': 'ORD-2024-5678',
//         //     'category': 'Diabetes',
//         //     'orderDate': '2024-01-14',
//         //     'duration': '60 days',
//         //     'medicines': ['Metformin 500mg', 'Glipizide 5mg', '+1 more'],
//         //     'status': 'Price Confirmation',
//         //     'statusColor': const Color(0xFFDBEAFE),
//         //     'statusTextColor': const Color(0xFF1E40AF),
//         //     'finalPrice': '\$45.99',
//         //     'originalPrice': '\$57.99',
//         //     'discount': '-\$12.00',
//         //     'customer': 'Jane Smith',
//         //     'deliveryAddress': '456 Oak Ave, City, State 67890',
//         //     'estimatedDelivery': '2024-01-17',
//         //     'whatsapp': '+1-234-567-8902',
//         //     'timeline': [
//         //       {'title': 'Order Placed', 'time': '2024-01-14, 02:15 PM', 'completed': true},
//         //       {'title': 'Prescription Verification', 'time': '2024-01-14, 04:20 PM', 'completed': true},
//         //       {'title': 'Price Confirmation', 'time': 'Awaiting Response', 'completed': false, 'active': true},
//         //       {'title': 'Processing', 'time': 'Pending', 'completed': false, 'active': false},
//         //       {'title': 'Shipped', 'time': 'Pending', 'completed': false, 'active': false},
//         //       {'title': 'Delivered', 'time': 'Pending', 'completed': false, 'active': false},
//         //     ],
//         //   },
//         //   {
//         //     'orderId': 'ORD-2024-9999',
//         //     'category': 'Pain Relief',
//         //     'orderDate': '2024-01-12',
//         //     'duration': '15 days',
//         //     'medicines': ['Ibuprofen 400mg', 'Acetaminophen 500mg'],
//         //     'status': 'Shipped',
//         //     'statusColor': const Color(0xFFD1FAE5),
//         //     'statusTextColor': const Color(0xFF065F46),
//         //     'finalPrice': '\$28.50',
//         //     'trackingId': 'TRK123456789',
//         //     'customer': 'John Doe',
//         //     'deliveryAddress': '123 Main St, City, State 12345',
//         //     'estimatedDelivery': '2024-01-15',
//         //     'whatsapp': '+1-234-567-8901',
//         //     'timeline': [
//         //       {'title': 'Order Placed', 'time': '2024-01-12, 10:30 AM', 'completed': true},
//         //       {'title': 'Prescription Verification', 'time': '2024-01-12, 11:45 AM', 'completed': true},
//         //       {'title': 'Price Confirmation', 'time': '2024-01-12, 02:00 PM', 'completed': true},
//         //       {'title': 'Processing', 'time': '2024-01-12, 03:15 PM', 'completed': true},
//         //       {'title': 'Shipped', 'time': '2024-01-13, 09:00 AM', 'completed': true},
//         //       {'title': 'Delivered', 'time': 'Pending', 'completed': false, 'active': false},
//         //     ],
//         //   },
//         // ];
//
//         return Stack(
//           children: [
//             SingleChildScrollView(
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
//                          Text(
//                            AppLocalizations.of(context)!.yourOrders,
//                           style: TextStyle(
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
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
//                     child: isMobile
//                         ? Column(
//                       children: orders
//                           .map((order) => Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: _buildOrderCard(order),
//                       ))
//                           .toList(),
//                     )
//                         : IntrinsicHeight(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: orders
//                             .map((order) => Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: _buildOrderCard(order),
//                           ),
//                         ))
//                             .toList(),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//
//             // Order Details Overlay
//             if (_showOrderDetails && _selectedOrder != null)
//               _buildOrderDetailsOverlay(isMobile),
//           ],
//         );
//       },
//     );
//   }
//
//   // Order Details Overlay
//   Widget _buildOrderDetailsOverlay(bool isMobile) {
//     final orderVM = Provider.of<OrderHistoryViewModel>(context);
//     final orders = orderVM.orderHistoryModel?.data ?? [];
//
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     // Make sure _selectedOrder is of type Data
//     final selectedOrder = _selectedOrder as Data;
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
//                   // Header
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
//                         const Icon(Icons.receipt_long, color: Color(0xFF3B82F6)),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             'Order Details - ${selectedOrder.randomOrderid}',
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
//
//                   // Content
//                   Flexible(
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.all(24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Customer & Order Info
//                           isMobile
//                               ? Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               _buildInfoSection(),
//                               const SizedBox(height: 24),
//                               _buildDeliverySection(),
//                             ],
//                           )
//                               : Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(child: _buildInfoSection()),
//                               const SizedBox(width: 40),
//                               Expanded(child: _buildDeliverySection()),
//                             ],
//                           ),
//
//                           const SizedBox(height: 24),
//
//                           // Medicines
//                           Text(
//                             AppLocalizations.of(context)!.medicines,
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Wrap(
//                             spacing: 8,
//                             runSpacing: 8,
//                             children: (selectedOrder.medicines ?? [])
//                                 .map((m) => Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 14, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFEFF6FF),
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: const Color(0xFFDBEAFE)),
//                               ),
//                               child: Text(
//                                 '${m.quantity} x ${m.quantity}',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xFF1E40AF),
//                                 ),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//
//                           const SizedBox(height: 32),
//
//                           // Order Timeline
//                           Text(
//                             AppLocalizations.of(context)!.orderTimeline,
//                             style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF1E293B)),
//                           ),
//                           const SizedBox(height: 16),
//
//                           // ...((selectedOrder.timeline ?? [])
//                           //     .map((step) => _buildTimelineStep(
//                           //   title: step.title,
//                           //   time: step.time,
//                           //   isCompleted: step.completed,
//                           //   isActive: step.isActive,
//                           //   isLast: step == selectedOrder.timeline!.last,
//                           // ))
//                           //     .toList()),
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
//   // Widget _buildOrderDetailsOverlay(bool isMobile) {
//   //   final orderVM = Provider.of<OrderHistoryViewModel>(context);
//   //   final orders = orderVM.orderHistoryModel?.data ?? [];
//   //   // final orderHistoryViewModel = Provider.of<OrderHistoryViewModel>(context).orderHistoryModel;
//   //
//   //   return GestureDetector(
//   //     onTap: () {
//   //       setState(() {
//   //         _showOrderDetails = false;
//   //         _selectedOrder = null;
//   //       });
//   //     },
//   //     child: Container(
//   //       color: Colors.black.withOpacity(0.5),
//   //       child: Center(
//   //         child: GestureDetector(
//   //           onTap: () {},
//   //           child: Container(
//   //             margin: EdgeInsets.symmetric(
//   //               horizontal: isMobile ? 20 : 100,
//   //               vertical: 40,
//   //             ),
//   //             constraints: const BoxConstraints(maxWidth: 900),
//   //             decoration: BoxDecoration(
//   //               color: Colors.white,
//   //               borderRadius: BorderRadius.circular(16),
//   //             ),
//   //             child: Column(
//   //               mainAxisSize: MainAxisSize.min,
//   //               children: [
//   //                 // Header
//   //                 Container(
//   //                   padding: const EdgeInsets.all(24),
//   //                   decoration: const BoxDecoration(
//   //                     color: Color(0xFFF8FAFC),
//   //                     borderRadius: BorderRadius.only(
//   //                       topLeft: Radius.circular(16),
//   //                       topRight: Radius.circular(16),
//   //                     ),
//   //                   ),
//   //                   child: Row(
//   //                     children: [
//   //                       const Icon(Icons.receipt_long, color: Color(0xFF3B82F6)),
//   //                       const SizedBox(width: 12),
//   //                       Expanded(
//   //                         child: Text(
//   //                           // 'Order Details - ${_selectedOrder!['orderId']}',
//   //                           'Order Details - ${orders.!['orderId']}',
//   //                           style: const TextStyle(
//   //                             fontSize: 20,
//   //                             fontWeight: FontWeight.bold,
//   //                             color: Color(0xFF1E293B),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                       IconButton(
//   //                         onPressed: () {
//   //                           setState(() {
//   //                             _showOrderDetails = false;
//   //                             _selectedOrder = null;
//   //                           });
//   //                         },
//   //                         icon: const Icon(Icons.close),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //
//   //                 // Content
//   //                 Flexible(
//   //                   child: SingleChildScrollView(
//   //                     padding: const EdgeInsets.all(24),
//   //                     child: Column(
//   //                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                       children: [
//   //                         // Customer & Order Info
//   //                         isMobile
//   //                             ? Column(
//   //                           crossAxisAlignment: CrossAxisAlignment.start,
//   //                           children: [
//   //                             _buildInfoSection(),
//   //                             const SizedBox(height: 24),
//   //                             _buildDeliverySection(),
//   //                           ],
//   //                         )
//   //                             : Row(
//   //                           crossAxisAlignment: CrossAxisAlignment.start,
//   //                           children: [
//   //                             Expanded(child: _buildInfoSection()),
//   //                             const SizedBox(width: 40),
//   //                             Expanded(child: _buildDeliverySection()),
//   //                           ],
//   //                         ),
//   //
//   //                         const SizedBox(height: 24),
//   //
//   //                         // Medicines
//   //                         Text(AppLocalizations.of(context)!.medicines,
//   //                             style: TextStyle(
//   //                                 fontSize: 13,
//   //                                 fontWeight: FontWeight.w600,
//   //                                 color: Colors.grey[600])),
//   //                         const SizedBox(height: 12),
//   //                         Wrap(
//   //                           spacing: 8,
//   //                           runSpacing: 8,
//   //                           children: (_selectedOrder!['medicines'] as List<String>)
//   //                               .map((m) => Container(
//   //                             padding: const EdgeInsets.symmetric(
//   //                                 horizontal: 14, vertical: 8),
//   //                             decoration: BoxDecoration(
//   //                               color: const Color(0xFFEFF6FF),
//   //                               borderRadius: BorderRadius.circular(8),
//   //                               border: Border.all(
//   //                                   color: const Color(0xFFDBEAFE)),
//   //                             ),
//   //                             child: Text(
//   //                               m,
//   //                               style: const TextStyle(
//   //                                 fontSize: 14,
//   //                                 fontWeight: FontWeight.w500,
//   //                                 color: Color(0xFF1E40AF),
//   //                               ),
//   //                             ),
//   //                           ))
//   //                               .toList(),
//   //                         ),
//   //
//   //                         const SizedBox(height: 32),
//   //
//   //                         // Order Timeline
//   //                          Text(AppLocalizations.of(context)!.orderTimeline,
//   //                             style: TextStyle(
//   //                                 fontSize: 16,
//   //                                 fontWeight: FontWeight.bold,
//   //                                 color: Color(0xFF1E293B))),
//   //                         const SizedBox(height: 16),
//   //
//   //                         ...(_selectedOrder!['timeline'] as List<Map<String, dynamic>>)
//   //                             .map((step) => _buildTimelineStep(
//   //                           title: step['title'],
//   //                           time: step['time'],
//   //                           isCompleted: step['completed'],
//   //                           isActive: step['active'] ?? false,
//   //                           isLast: step ==
//   //                               (_selectedOrder!['timeline'] as List).last,
//   //                         ))
//   //                             .toList(),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget _buildInfoSection() {
//     final orderVM = Provider.of<OrderHistoryViewModel>(context);
//     final orders = orderVM.orderHistoryModel?.data ?? [];
//
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     // Make sure _selectedOrder is of type Data
//     final selectedOrder = _selectedOrder as Data;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(AppLocalizations.of(context)!.customer, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//          selectedOrder.fullName??"",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(AppLocalizations.of(context)!.category, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//           selectedOrder.diseaseCategory??"",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(AppLocalizations.of(context)!.duration, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//          selectedOrder.medicineDuration??"",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(AppLocalizations.of(context)!.whatsApp, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//        selectedOrder.whatsappNumber??"",
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
//     final orderVM = Provider.of<OrderHistoryViewModel>(context);
//     final orders = orderVM.orderHistoryModel?.data ?? [];
//
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     // Make sure _selectedOrder is of type Data
//     final selectedOrder = _selectedOrder as Data;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(AppLocalizations.of(context)!.orderDate, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//         selectedOrder.createdAt??"",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(AppLocalizations.of(context)!.deliveryAddress,
//             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//          selectedOrder.deliveryAddress??"",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(AppLocalizations.of(context)!.estimatedDelivery,
//             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//         const SizedBox(height: 4),
//         Text(
//           _selectedOrder!['estimatedDelivery'],
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF1E293B),
//           ),
//         ),
//         if (_selectedOrder!['finalPrice'] != null) ...[
//           const SizedBox(height: 16),
//           Text(AppLocalizations.of(context)!.finalPrice,
//               style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//           const SizedBox(height: 4),
//           Text(
//             _selectedOrder!['finalPrice'],
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF10B981),
//             ),
//           ),
//         ],
//       ],
//     );
//   }
//
//   Widget _buildTimelineStep({
//     required String title,
//     required String time,
//     required bool isCompleted,
//     required bool isActive,
//     required bool isLast,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 color: isCompleted
//                     ? const Color(0xFF10B981)
//                     : isActive
//                     ? const Color(0xFF3B82F6)
//                     : Colors.grey[300],
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 isCompleted
//                     ? Icons.check
//                     : isActive
//                     ? Icons.access_time
//                     : Icons.circle,
//                 color: isCompleted || isActive ? Colors.white : Colors.grey[500],
//                 size: isCompleted || isActive ? 18 : 12,
//               ),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 40,
//                 color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
//               ),
//           ],
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: isCompleted || isActive
//                         ? const Color(0xFF1E293B)
//                         : Colors.grey[500],
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   time,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Order card builder
//   Widget _buildOrderCard(Data order) {
//     final orderVM = Provider.of<OrderHistoryViewModel>(context);
//     final orders = orderVM.orderHistoryModel?.data ?? [];
//
//     if (_selectedOrder == null) return const SizedBox.shrink();
//
//     // Make sure _selectedOrder is of type Data
//     final selectedOrder = _selectedOrder as Data;
//     return Container(
//       // height: double.infinity,
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
//               Text(
//                selectedOrder.randomOrderid??"",
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1E293B),
//                 ),
//               ),
//               // Container(
//               //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               //   decoration: BoxDecoration(
//               //     color: order['statusColor'],
//               //     borderRadius: BorderRadius.circular(20),
//               //   ),
//               //   child: Text(
//               //     selectedOrder.status==0:"Pending"?se,
//               //     style: TextStyle(
//               //       fontSize: 12,
//               //       fontWeight: FontWeight.w600,
//               //       color: order['statusTextColor'],
//               //     ),
//               //   ),
//               // ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: () {
//                     switch (selectedOrder.status) {
//                       case 0:
//                         return Colors.orange;
//                       case 1:
//                         return Colors.blue;
//                       case 2:
//                         return Colors.green;
//                       case 3:
//                         return Colors.red;
//                       default:
//                         return Colors.grey;
//                     }
//                   }(),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                       () {
//                     switch (selectedOrder.status) {
//                       case 0:
//                         return "Pending";
//                       case 1:
//                         return "Price Confirmation";
//                       case 2:
//                         return "Shipped";
//                       case 3:
//                         return "Pickup/On the way";
//                       case 4:
//                         return "Delivered";
//                         case 5:
//                         return "Cancel";
//                       default:
//                         return "Unknown";
//                     }
//                   }(),
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white, // Text color for good contrast
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//
//           const SizedBox(height: 4),
//           Text(
//             order.diseaseCategory??"",
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
//                     Text('Order Date:',
//                         style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//                     const SizedBox(height: 4),
//                     Text(order.createdAt??"",
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF1E293B))),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(AppLocalizations.of(context)!.duration,
//                         style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//                     const SizedBox(height: 4),
//                     Text(order.medicineDuration??"",
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF1E293B))),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           // Final Price
//           if (order.summary!.finalAmount != null &&
//               order.status != 'Pending Verification') ...[
//             const SizedBox(height: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(AppLocalizations.of(context)!.finalPrice,
//                     style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//                 const SizedBox(height: 4),
//                 Text(
//                   order.summary?.finalAmount??"",
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
//           // Tracking
//           // if (order['trackingId'] != null) ...[
//           //   const SizedBox(height: 16),
//           //   Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       Text('Tracking:',
//           //           style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//           //       const SizedBox(height: 4),
//           //       Text(
//           //         order['trackingId'],
//           //         style: const TextStyle(
//           //           fontSize: 14,
//           //           fontWeight: FontWeight.w600,
//           //           color: Color(0xFF1E293B),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ],
//
//           const SizedBox(height: 16),
//
//           // Medicines
//           Text(AppLocalizations.of(context)!.medicines,
//               style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//           const SizedBox(height: 8),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: (order.medicines as List<String>)
//                 .map((m) => Container(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF1F5F9),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Text(
//                 m,
//                 style: const TextStyle(
//                   fontSize: 13,
//                   color: Color(0xFF475569),
//                 ),
//               ),
//             ))
//                 .toList(),
//           ),
//
//           // // Pending Verification Message
//           // if (order['message'] != null) ...[
//           //   const SizedBox(height: 16),
//           //   Container(
//           //     padding: const EdgeInsets.all(12),
//           //     decoration: BoxDecoration(
//           //       color: const Color(0xFFFEF3C7),
//           //       borderRadius: BorderRadius.circular(8),
//           //     ),
//           //     child: Row(
//           //       children: [
//           //         const Icon(Icons.access_time,
//           //             color: Color(0xFF92400E), size: 18),
//           //         const SizedBox(width: 8),
//           //         Expanded(
//           //           child: Text(
//           //             order['message'],
//           //             style: const TextStyle(
//           //               fontSize: 12,
//           //               color: Color(0xFF92400E),
//           //             ),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ],
//
//           // Price Confirmation Section
//           if (order.status == 'Price Confirmation' &&
//               order.summary!.original != null &&
//               order.summary!.discount!= null) ...[
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
//                         order.summary!.original??"",
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
//                         order.summary?.discount??"",
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
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey[800]),
//                       ),
//                       Text(
//                         order.summary?.finalAmount??"",
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
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF10B981),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                             elevation: 0,
//                           ),
//                           child:  Text(AppLocalizations.of(context)!.accept,
//                               style: TextStyle(fontSize: 14)),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             side: const BorderSide(
//                                 color: Colors.redAccent, width: 1.5),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: Text(
//                             AppLocalizations.of(context)!.cancel,
//                             style: TextStyle(
//                                 color: Colors.redAccent, fontSize: 14),
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
//           // Shipped tracking info
//           // if (order.summary == 'Shipped' && order['trackingId'] != null) ...[
//           //   const SizedBox(height: 16),
//           //   Container(
//           //     padding: const EdgeInsets.all(12),
//           //     decoration: BoxDecoration(
//           //       color: const Color(0xFFD1FAE5),
//           //       borderRadius: BorderRadius.circular(8),
//           //     ),
//           //     child: Row(
//           //       children: [
//           //         const Icon(Icons.local_shipping,
//           //             color: Color(0xFF065F46), size: 18),
//           //         const SizedBox(width: 8),
//           //         Expanded(
//           //           child: Text(
//           //             '${AppLocalizations.of(context)!.shippedTrack} ${order['trackingId']}',
//           //             style: const TextStyle(
//           //               fontSize: 12,
//           //               fontWeight: FontWeight.w600,
//           //               color: Color(0xFF065F46),
//           //             ),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ],
//
//           const SizedBox(height: 20),
//
//           Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {
//                     setState(() {
//                       _selectedOrder = order as Map<String, dynamic>?;
//                       _showOrderDetails = true;
//                     });
//                   },
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     side: BorderSide(color: Colors.grey[400]!),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child:  Text(
//                     AppLocalizations.of(context)!.viewDetails,
//                     style: TextStyle(fontSize: 14, color: Color(0xFF475569)),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.chat_bubble_outline, size: 16),
//                   label:  Text(AppLocalizations.of(context)!.whatsApp, style: TextStyle(fontSize: 14)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF10B981),
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Help Section
//
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:v_pharmashing/view_model/order_history_view_model.dart';
// //
// // import '../../l10n/app_localizations.dart';
// // import '../../model/order_history_model.dart';
// //
// // class YourOrdersScreen extends StatefulWidget {
// //   const YourOrdersScreen({super.key});
// //
// //   @override
// //   State<YourOrdersScreen> createState() => _YourOrdersScreenState();
// // }
// //
// // class _YourOrdersScreenState extends State<YourOrdersScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       final viewModel =
// //       Provider.of<OrderHistoryViewModel>(context, listen: false);
// //       viewModel.orderHistoryApi(context);
// //     });
// //   }
// //
// //   bool _showOrderDetails = false;
// //   Data? _selectedOrder; // Changed from Map to Data type
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         bool isMobile = constraints.maxWidth < 800;
// //         final orderVM = Provider.of<OrderHistoryViewModel>(context);
// //         final orders = orderVM.orderHistoryModel?.data ?? [];
// //
// //         return Stack(
// //           children: [
// //             SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   // Header
// //                   Container(
// //                     width: double.infinity,
// //                     padding: EdgeInsets.symmetric(
// //                       vertical: 60,
// //                       horizontal: isMobile ? 20 : 40,
// //                     ),
// //                     decoration: const BoxDecoration(
// //                       gradient: LinearGradient(
// //                         begin: Alignment.topLeft,
// //                         end: Alignment.bottomRight,
// //                         colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
// //                       ),
// //                     ),
// //                     child: Column(
// //                       children: [
// //                         Text(
// //                           AppLocalizations.of(context)!.yourOrders,
// //                           style: const TextStyle(
// //                             fontSize: 48,
// //                             fontWeight: FontWeight.bold,
// //                             color: Color(0xFF1E293B),
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         Text(
// //                           AppLocalizations.of(context)!.trackOrdersInfo,
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             color: Colors.grey[600],
// //                             height: 1.5,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //
// //                   const SizedBox(height: 40),
// //
// //                   // Orders List
// //                   Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
// //                     child: orders.isEmpty
// //                         ? Center(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(40),
// //                         child: Text(
// //                           'No orders found',
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             color: Colors.grey[600],
// //                           ),
// //                         ),
// //                       ),
// //                     )
// //                         : isMobile
// //                         ? Column(
// //                       children: orders
// //                           .map((order) => Padding(
// //                         padding: const EdgeInsets.only(bottom: 20),
// //                         child: _buildOrderCard(order),
// //                       ))
// //                           .toList(),
// //                     )
// //                         : IntrinsicHeight(
// //                       child: Row(
// //                         crossAxisAlignment: CrossAxisAlignment.stretch,
// //                         children: orders
// //                             .map((order) => Expanded(
// //                           child: Padding(
// //                             padding: const EdgeInsets.symmetric(
// //                                 horizontal: 10),
// //                             child: _buildOrderCard(order),
// //                           ),
// //                         ))
// //                             .toList(),
// //                       ),
// //                     ),
// //                   ),
// //
// //                   const SizedBox(height: 80),
// //                 ],
// //               ),
// //             ),
// //
// //             // Order Details Overlay
// //             if (_showOrderDetails && _selectedOrder != null)
// //               _buildOrderDetailsOverlay(isMobile),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   // Order card builder - FIXED VERSION
// //   Widget _buildOrderCard(Data order) {
// //     return Container(
// //       padding: const EdgeInsets.all(24),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: Colors.grey.withOpacity(0.2)),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.08),
// //             blurRadius: 20,
// //             offset: const Offset(0, 8),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Order ID + Status
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 order.randomOrderid ?? 'N/A',
// //                 style: const TextStyle(
// //                   fontSize: 15,
// //                   fontWeight: FontWeight.bold,
// //                   color: Color(0xFF1E293B),
// //                 ),
// //               ),
// //               Container(
// //                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                 decoration: BoxDecoration(
// //                   color: _getStatusColor(order.status),
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Text(
// //                   _getStatusText(order.status),
// //                   style: const TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //
// //           const SizedBox(height: 4),
// //           Text(
// //             order.diseaseCategory ?? 'N/A',
// //             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
// //           ),
// //           const SizedBox(height: 20),
// //
// //           // Dates
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text('Order Date:',
// //                         style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //                     const SizedBox(height: 4),
// //                     Text(order.createdAt ?? 'N/A',
// //                         style: const TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w600,
// //                             color: Color(0xFF1E293B))),
// //                   ],
// //                 ),
// //               ),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(AppLocalizations.of(context)!.duration,
// //                         style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //                     const SizedBox(height: 4),
// //                     Text(order.medicineDuration ?? 'N/A',
// //                         style: const TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w600,
// //                             color: Color(0xFF1E293B))),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //
// //           const SizedBox(height: 16),
// //
// //           // Medicines
// //           Text(AppLocalizations.of(context)!.medicines,
// //               style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //           const SizedBox(height: 8),
// //           Wrap(
// //             spacing: 8,
// //             runSpacing: 8,
// //             children: (order.medicines ?? [])
// //                 .map((m) => Container(
// //               padding:
// //               const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF1F5F9),
// //                 borderRadius: BorderRadius.circular(6),
// //               ),
// //               child: Text(
// //                 '${m.quantity ?? 0} x ${m.quantity ?? 'N/A'}',
// //                 style: const TextStyle(
// //                   fontSize: 13,
// //                   color: Color(0xFF475569),
// //                 ),
// //               ),
// //             ))
// //                 .toList(),
// //           ),
// //
// //           const SizedBox(height: 20),
// //
// //           // Buttons
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: OutlinedButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       _selectedOrder = order;
// //                       _showOrderDetails = true;
// //                     });
// //                   },
// //                   style: OutlinedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(vertical: 12),
// //                     side: BorderSide(color: Colors.grey[400]!),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8)),
// //                   ),
// //                   child: Text(
// //                     AppLocalizations.of(context)!.viewDetails,
// //                     style: const TextStyle(fontSize: 14, color: Color(0xFF475569)),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                 child: ElevatedButton.icon(
// //                   onPressed: () {},
// //                   icon: const Icon(Icons.chat_bubble_outline, size: 16),
// //                   label: Text(AppLocalizations.of(context)!.whatsApp,
// //                       style: const TextStyle(fontSize: 14)),
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF10B981),
// //                     foregroundColor: Colors.white,
// //                     padding: const EdgeInsets.symmetric(vertical: 12),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8)),
// //                     elevation: 0,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Helper methods for status
// //   Color _getStatusColor(int? status) {
// //     switch (status) {
// //       case 0:
// //         return Colors.orange;
// //       case 1:
// //         return Colors.blue;
// //       case 2:
// //         return Colors.green;
// //       case 3:
// //         return Colors.purple;
// //       case 4:
// //         return Colors.teal;
// //       case 5:
// //         return Colors.red;
// //       default:
// //         return Colors.grey;
// //     }
// //   }
// //
// //   String _getStatusText(int? status) {
// //     switch (status) {
// //       case 0:
// //         return "Pending";
// //       case 1:
// //         return "Price Confirmation";
// //       case 2:
// //         return "Shipped";
// //       case 3:
// //         return "Pickup/On the way";
// //       case 4:
// //         return "Delivered";
// //       case 5:
// //         return "Cancelled";
// //       default:
// //         return "Unknown";
// //     }
// //   }
// //
// //   // Order Details Overlay
// //   Widget _buildOrderDetailsOverlay(bool isMobile) {
// //     if (_selectedOrder == null) return const SizedBox.shrink();
// //
// //     final selectedOrder = _selectedOrder!;
// //
// //     return GestureDetector(
// //       onTap: () {
// //         setState(() {
// //           _showOrderDetails = false;
// //           _selectedOrder = null;
// //         });
// //       },
// //       child: Container(
// //         color: Colors.black.withOpacity(0.5),
// //         child: Center(
// //           child: GestureDetector(
// //             onTap: () {},
// //             child: Container(
// //               margin: EdgeInsets.symmetric(
// //                 horizontal: isMobile ? 20 : 100,
// //                 vertical: 40,
// //               ),
// //               constraints: const BoxConstraints(maxWidth: 900),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(16),
// //               ),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   // Header
// //                   Container(
// //                     padding: const EdgeInsets.all(24),
// //                     decoration: const BoxDecoration(
// //                       color: Color(0xFFF8FAFC),
// //                       borderRadius: BorderRadius.only(
// //                         topLeft: Radius.circular(16),
// //                         topRight: Radius.circular(16),
// //                       ),
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.receipt_long, color: Color(0xFF3B82F6)),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Text(
// //                             'Order Details - ${selectedOrder.randomOrderid ?? 'N/A'}',
// //                             style: const TextStyle(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xFF1E293B),
// //                             ),
// //                           ),
// //                         ),
// //                         IconButton(
// //                           onPressed: () {
// //                             setState(() {
// //                               _showOrderDetails = false;
// //                               _selectedOrder = null;
// //                             });
// //                           },
// //                           icon: const Icon(Icons.close),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //
// //                   // Content
// //                   Flexible(
// //                     child: SingleChildScrollView(
// //                       padding: const EdgeInsets.all(24),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // Customer & Order Info
// //                           isMobile
// //                               ? Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               _buildInfoSection(),
// //                               const SizedBox(height: 24),
// //                               _buildDeliverySection(),
// //                             ],
// //                           )
// //                               : Row(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Expanded(child: _buildInfoSection()),
// //                               const SizedBox(width: 40),
// //                               Expanded(child: _buildDeliverySection()),
// //                             ],
// //                           ),
// //
// //                           const SizedBox(height: 24),
// //
// //                           // Medicines
// //                           Text(
// //                             AppLocalizations.of(context)!.medicines,
// //                             style: TextStyle(
// //                               fontSize: 13,
// //                               fontWeight: FontWeight.w600,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ),
// //                           const SizedBox(height: 12),
// //                           Wrap(
// //                             spacing: 8,
// //                             runSpacing: 8,
// //                             children: (selectedOrder.medicines ?? [])
// //                                 .map((m) => Container(
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 14, vertical: 8),
// //                               decoration: BoxDecoration(
// //                                 color: const Color(0xFFEFF6FF),
// //                                 borderRadius: BorderRadius.circular(8),
// //                                 border: Border.all(
// //                                     color: const Color(0xFFDBEAFE)),
// //                               ),
// //                               child: Text(
// //                                 '${m.quantity ?? 0} x ${m.quantity ?? 'N/A'}',
// //                                 style: const TextStyle(
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w500,
// //                                   color: Color(0xFF1E40AF),
// //                                 ),
// //                               ),
// //                             ))
// //                                 .toList(),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInfoSection() {
// //     if (_selectedOrder == null) return const SizedBox.shrink();
// //
// //     final selectedOrder = _selectedOrder!;
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(AppLocalizations.of(context)!.customer,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.fullName ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         Text(AppLocalizations.of(context)!.category,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.diseaseCategory ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         Text(AppLocalizations.of(context)!.duration,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.medicineDuration ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         Text(AppLocalizations.of(context)!.whatsApp,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.whatsappNumber ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildDeliverySection() {
// //     if (_selectedOrder == null) return const SizedBox.shrink();
// //
// //     final selectedOrder = _selectedOrder!;
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(AppLocalizations.of(context)!.orderDate,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.createdAt ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         Text(AppLocalizations.of(context)!.deliveryAddress,
// //             style: TextStyle(fontSize: 13, color: Colors.grey[600])),
// //         const SizedBox(height: 4),
// //         Text(
// //           selectedOrder.deliveryAddress ?? "N/A",
// //           style: const TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w600,
// //             color: Color(0xFF1E293B),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/view_model/confirm_order_view_model.dart';
import 'package:v_pharmashing/view_model/order_history_view_model.dart';

import '../../l10n/app_localizations.dart';
import '../../model/order_history_model.dart';
import '../../res/const_color.dart';
import '../../res/sizing_const.dart';

class YourOrdersScreen extends StatefulWidget {
  const YourOrdersScreen({super.key});

  @override
  State<YourOrdersScreen> createState() => _YourOrdersScreenState();
}

class _YourOrdersScreenState extends State<YourOrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel =
      Provider.of<OrderHistoryViewModel>(context, listen: false);
      viewModel.orderHistoryApi(context);
    });
  }

  bool _showOrderDetails = false;
  Data? _selectedOrder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        final orderVM = Provider.of<OrderHistoryViewModel>(context);
        final orders = orderVM.orderHistoryModel?.data ?? [];

        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 60,
                      horizontal: isMobile ? 20 : 40,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.yourOrders,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.trackOrdersInfo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                  //   child: orders.isEmpty
                  //       ? const Center(
                  //     child: Padding(
                  //       padding: EdgeInsets.all(40),
                  //       child: Text(
                  //         'No orders found',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  //       : isMobile
                  //       ? Column(
                  //     children: orders
                  //         .map((order) => Padding(
                  //       padding: const EdgeInsets.only(bottom: 20),
                  //       child: _buildOrderCard(order),
                  //     ))
                  //         .toList(),
                  //   )
                  //       : IntrinsicHeight(
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //       children: orders
                  //           .map((order) => Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 10),
                  //           child: _buildOrderCard(order),
                  //         ),
                  //       ))
                  //           .toList(),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                    child: orders.isEmpty
                        ? Center(
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 60),
                        child:  AbsorbPointer(
                          // absorbing: userId != null,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth*0.03,vertical: Sizes.screenHeight*0.03),
                            width: isMobile
                                ? MediaQuery.of(context).size.width * 0.9
                                : 800,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("Please"),
                                SizedBox(height: Sizes.screenHeight*0.02,),
                                Text(
                                  "login",
                                  style: TextStyle(
                                    color: AppColor.blueColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: Sizes.screenHeight*0.02,),
                                Text("to place an order"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        : isMobile
                        ? Column(
                      children: orders
                          .map((order) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _buildOrderCard(order),
                      ))
                          .toList(),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of columns
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1, // adjust height
                      ),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return _buildOrderCard(orders[index]);
                      },
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),

            // Order Details Overlay
            if (_showOrderDetails && _selectedOrder != null)
              _buildOrderDetailsOverlay(isMobile),
          ],
        );
      },
    );
  }

  // Order card builder - FIXED
  Widget _buildOrderCard(Data order) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order.randomOrderid ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getStatusText(order.status),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Text(
            order.diseaseCategory ?? 'N/A',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),

          // Dates
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Date:',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text(_formatDate(order.createdAt),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B))),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.duration,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text(order.medicineDuration ?? 'N/A',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B))),
                  ],
                ),
              ),
            ],
          ),

          // Final Price - Fixed field access
          if (order.summary?.finalAmount != null &&
              order.summary!.finalAmount!.isNotEmpty &&
              order.summary!.finalAmount != '0.00') ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.finalPrice,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Text(
                  '₹${order.summary!.finalAmount}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),

          // Medicines - Fixed empty list handling
          Text(AppLocalizations.of(context)!.medicines,
              style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          const SizedBox(height: 8),
          (order.medicines == null || order.medicines!.isEmpty)
              ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'No medicines listed',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF475569),
                fontStyle: FontStyle.italic,
              ),
            ),
          )
              : Wrap(
            spacing: 8,
            runSpacing: 8,
            children: order.medicines!
                .map((m) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${m.quantity ?? 0} x ${m.medicineName ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF475569),
                ),
              ),
            ))
                .toList(),
          ),

          // Price Confirmation Section - Fixed
          if (order.status == 1 &&
              order.summary?.original != null &&
              order.summary!.original!.isNotEmpty &&
              order.summary!.original != '0.00') ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFDBEAFE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.priceConfirmationRequired,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Original:',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      Text(
                        '₹${order.summary!.original}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.discount,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      Text(
                        '-₹${order.summary!.discount}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Final:',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]),
                      ),
                      Text(
                        '₹${order.summary!.finalAmount}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             final confirmOrderViewModel = Provider.of<ConfirmOrderViewModel>(context,listen: false);
// confirmOrderViewModel.confirmOrderApi(
//     order.id,
//     order.status,
//     context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF10B981),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                             elevation: 0,
//                           ),
//                           child: Text(AppLocalizations.of(context)!.accept,
//                               style: const TextStyle(fontSize: 14)),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             side: const BorderSide(
//                                 color: Colors.redAccent, width: 1.5),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: Text(
//                             AppLocalizations.of(context)!.cancel,
//                             style: const TextStyle(
//                                 color: Colors.redAccent, fontSize: 14),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final confirmOrderViewModel = Provider.of<ConfirmOrderViewModel>(context, listen: false);

                            // API call
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              order.status,
                              context,
                            );

                            // Status update after confirmation
                            setState(() {
                              order.status = "Shipped" as int?; // ya agar int use kar rahe ho to order.status = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.accept,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final confirmOrderViewModel = Provider.of<ConfirmOrderViewModel>(context, listen: false);

                            // API call
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              order.status,
                              context,
                            );

                            // Status update after confirmation
                            setState(() {
                              order.status = "Cancel" as int?; // ya agar int use kar rahe ho to order.status = 2;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Colors.redAccent, width: 1.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _selectedOrder = order;
                      _showOrderDetails = true;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Colors.grey[400]!),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.viewDetails,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF475569)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add WhatsApp functionality here
                  },
                  icon: const Icon(Icons.chat_bubble_outline, size: 16),
                  label: Text(AppLocalizations.of(context)!.whatsApp,
                      style: const TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper methods
  Color _getStatusColor(int? status) {
    switch (status) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.teal;
      case 5:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(int? status) {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "Price Confirmation";
      case 2:
        return "Shipped";
      case 3:
        return "Pickup/On the way";
      case 4:
        return "Delivered";
      case 5:
        return "Cancelled";
      default:
        return "Unknown";
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateStr;
    }
  }

  // Order Details Overlay
  Widget _buildOrderDetailsOverlay(bool isMobile) {
    if (_selectedOrder == null) return const SizedBox.shrink();

    final selectedOrder = _selectedOrder!;

    return GestureDetector(
      onTap: () {
        setState(() {
          _showOrderDetails = false;
          _selectedOrder = null;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 40,
              ),
              constraints: const BoxConstraints(maxWidth: 900),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.receipt_long, color: Color(0xFF3B82F6)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Order Details - ${selectedOrder.randomOrderid ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _showOrderDetails = false;
                              _selectedOrder = null;
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),

                  // Content
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Customer & Order Info
                          isMobile
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoSection(),
                              const SizedBox(height: 24),
                              _buildDeliverySection(),
                            ],
                          )
                              : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildInfoSection()),
                              const SizedBox(width: 40),
                              Expanded(child: _buildDeliverySection()),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Medicines
                          Text(
                            AppLocalizations.of(context)!.medicines,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12),
                          (selectedOrder.medicines == null ||
                              selectedOrder.medicines!.isEmpty)
                              ? const Text(
                            'No medicines listed',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                              : Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: selectedOrder.medicines!
                                .map((m) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF),
                                borderRadius:
                                BorderRadius.circular(8),
                                border: Border.all(
                                    color: const Color(0xFFDBEAFE)),
                              ),
                              child: Text(
                                '${m.quantity ?? 0} x ${m.medicineName ?? 'N/A'}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1E40AF),
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    if (_selectedOrder == null) return const SizedBox.shrink();

    final selectedOrder = _selectedOrder!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.customer,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          selectedOrder.fullName ?? "N/A",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context)!.category,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          selectedOrder.diseaseCategory ?? "N/A",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context)!.duration,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          selectedOrder.medicineDuration ?? "N/A",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context)!.whatsApp,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          selectedOrder.whatsappNumber ?? "N/A",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliverySection() {
    if (_selectedOrder == null) return const SizedBox.shrink();

    final selectedOrder = _selectedOrder!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.orderDate,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          _formatDate(selectedOrder.createdAt),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context)!.deliveryAddress,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          selectedOrder.deliveryAddress ?? "N/A",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        if (selectedOrder.estimatedDeliveryDate != null) ...[
          const SizedBox(height: 16),
          Text(AppLocalizations.of(context)!.estimatedDelivery,
              style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            _formatDate(selectedOrder.estimatedDeliveryDate),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
        ],
        if (selectedOrder.summary?.finalAmount != null &&
            selectedOrder.summary!.finalAmount!.isNotEmpty &&
            selectedOrder.summary!.finalAmount != '0.00') ...[
          const SizedBox(height: 16),
          Text(AppLocalizations.of(context)!.finalPrice,
              style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            '₹${selectedOrder.summary!.finalAmount}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF10B981),
            ),
          ),
        ],
      ],
    );
  }
}