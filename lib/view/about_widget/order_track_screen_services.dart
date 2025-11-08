import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_pharmashing/res/launcher.dart';
import 'package:v_pharmashing/view_model/confirm_order_view_model.dart';
import 'package:v_pharmashing/view_model/order_history_view_model.dart';
import 'package:v_pharmashing/view_model/pharmacist_rating_view_model.dart';
import 'package:v_pharmashing/view_model/rating_view_model.dart';

import '../../l10n/app_localizations.dart';
import '../../model/order_history_model.dart';
import '../../res/const_color.dart';
import '../../res/sizing_const.dart';
import '../../view_model/admin_contact_view_model.dart';
import '../../view_model/user_view_model.dart';

class YourOrdersScreen extends StatefulWidget {
  const YourOrdersScreen({super.key});

  @override
  State<YourOrdersScreen> createState() => _YourOrdersScreenState();
}

class _YourOrdersScreenState extends State<YourOrdersScreen> {
  int _limit = 4;
  int _currentOffset = 0;
  bool _isLoadingMore = false;
  String? userId;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final adminContactViewModel =
      Provider.of<AdminContactViewModel>(context, listen: false);
      adminContactViewModel.adminContactApi();
      _loadUserId();
      _loadInitialOrders();
    });
  }

  Future<void> _loadUserId() async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? id = await userViewModel.getUser();
    setState(() {
      userId = id;
    });
  }

  Future<void> _loadInitialOrders() async {
    final viewModel = Provider.of<OrderHistoryViewModel>(
      context,
      listen: false,
    );
    await viewModel.orderHistoryApi(_limit, 0, context);
    setState(() {
      _currentOffset = _limit;
    });
  }

  Future<void> _loadMoreOrders() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    final viewModel = Provider.of<OrderHistoryViewModel>(
      context,
      listen: false,
    );

    final currentCount = viewModel.orderHistoryModel?.data?.length ?? 0;

    await viewModel.orderHistoryApi(_limit, _currentOffset, context);

    final newCount = viewModel.orderHistoryModel?.data?.length ?? 0;

    setState(() {
      if (newCount > currentCount) {
        _currentOffset = newCount;
      }
      _isLoadingMore = false;
    });
  }

  void _showLessOrders() {
    final viewModel = Provider.of<OrderHistoryViewModel>(
      context,
      listen: false,
    );

    setState(() {
      _currentOffset = _limit;
    });

    viewModel.orderHistoryApi(_limit, 0, context);
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        final orderVM = Provider.of<OrderHistoryViewModel>(context);
        final orders = orderVM.orderHistoryModel?.data ?? [];

        final hasMoreOrders = orders.length == _currentOffset;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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

              // Login prompt
              if (userId == null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.screenWidth * 0.03,
                      vertical: Sizes.screenHeight * 0.03,
                    ),
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
                      children: [
                         Text(AppLocalizations.of(context)!.please,),
                        SizedBox(height: Sizes.screenHeight * 0.02),
                        Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            color: AppColor.blueColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: Sizes.screenHeight * 0.02),
                         Text(AppLocalizations.of(context)!.toPlaceAnOrder,),
                      ],
                    ),
                  ),
                ),

              // Orders list
              if (userId != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                  child: Column(
                    children: [
                      // No orders message
                      if (orders.isEmpty)
                         Center(
                          child: Text(
                            '👋 ${AppLocalizations.of(context)!.welcomeYouDontHaveAnyOrdersYet}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      // Orders grid/list
                      if (orders.isNotEmpty)
                        isMobile
                            ? Column(
                                children: orders
                                    .map(
                                      (order) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                        child: _buildOrderCard(order),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: orders
                                    .map(
                                      (order) => SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2 -
                                            80,
                                        child: _buildOrderCard(order),
                                      ),
                                    )
                                    .toList(),
                              ),

                      const SizedBox(height: 20),

                      // Show More/Less buttons
                      if (orders.isNotEmpty)
                        Column(
                          children: [
                            // Show More button
                            if (hasMoreOrders)
                              _isLoadingMore
                                  ? const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton.icon(
                                      onPressed: _loadMoreOrders,
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                      ),
                                      label:  Text(
                                        AppLocalizations.of(context)!.loadMoreOrders,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.blueColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        elevation: 2,
                                      ),
                                    ),

                            // Show Less button
                            if (orders.length > _limit)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: OutlinedButton(
                                  onPressed: _showLessOrders,
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    "Show Less",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),

              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }

  // Order card builder
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
                    Text(
                      'Order Date:',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(order.createdAt.toString()),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.duration,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.medicineDuration ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Final Price
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
                        'Final:',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
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
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount:',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      Builder(builder: (context) {
                        double original =
                            double.tryParse(order.summary!.original!) ?? 0.0;
                        double finalAmt =
                            double.tryParse(order.summary!.finalAmount!) ?? 0.0;
                        double discountPercent = 0.0;
                        if (original > 0) {
                          discountPercent = ((original - finalAmt) / original) * 100;
                        }
                        return Text(
                          '${discountPercent.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final confirmOrderViewModel =
                            Provider.of<ConfirmOrderViewModel>(
                              context,
                              listen: false,
                            );
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              "2",
                              context,
                            );

                            setState(() {
                              order.status = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                            final confirmOrderViewModel =
                            Provider.of<ConfirmOrderViewModel>(
                              context,
                              listen: false,
                            );
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              "5",
                              context,
                            );

                            setState(() {
                              order.status = 5;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(
                              color: Colors.redAccent,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          // if (order.summary?.finalAmount != null &&
          //     order.summary!.finalAmount!.isNotEmpty &&
          //     order.summary!.finalAmount != '0.00') ...[
          //   const SizedBox(height: 16),
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         AppLocalizations.of(context)!.finalPrice,
          //         style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          //       ),
          //       const SizedBox(height: 4),
          //       Text(
          //         '₹${order.summary!.finalAmount}',
          //         style: const TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: Color(0xFF10B981),
          //         ),
          //       ),
          //     ],
          //   ),
          // ],

          const SizedBox(height: 16),

          // Medicines
          Text(
            AppLocalizations.of(context)!.medicines,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          (order.medicines == null || order.medicines!.isEmpty)
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
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
              : ExpansionTile(
                  title: const Text(
                    "Medicines",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  children: order.medicines!.map((m) {
                    double price = double.tryParse(m.price.toString()) ?? 0.0;
                    double discount =
                        double.tryParse(m.discountPrice.toString()) ?? 0.0;
                    int quantity = m.quantity ?? 0;
                    double totalPrice =
                        double.tryParse(m.totalPrice.toString()) ?? 0.0;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${m.quantity ?? 0} x ${m.medicineName ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price: ₹$price',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              Text(
                                'Discount: ₹$discount',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Total: ₹$totalPrice',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0284C7),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

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
                          color: Colors.grey[800],
                        ),
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final confirmOrderViewModel =
                                Provider.of<ConfirmOrderViewModel>(
                                  context,
                                  listen: false,
                                );
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              "2",
                              context,
                            );

                            setState(() {
                              order.status = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                            final confirmOrderViewModel =
                                Provider.of<ConfirmOrderViewModel>(
                                  context,
                                  listen: false,
                                );
                            await confirmOrderViewModel.confirmOrderApi(
                              order.id,
                              "5",
                              context,
                            );

                            setState(() {
                              order.status = 5;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(
                              color: Colors.redAccent,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                            ),
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
                    // Navigate to OrderDetailsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsPage(order: order),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Colors.grey[400]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.viewDetails,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final adminVM = Provider.of<AdminContactViewModel>(context,listen: false);
                    final contact = adminVM.adminContactModel?.data;
                    if (contact?.whatsappNumber != null) {
                      final whatsappUrl =
                      Uri.parse("https://wa.me/91${contact!.whatsappNumber}");
                      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.chat_bubble_outline, size: 16),
                  label: Text(
                    AppLocalizations.of(context)!.whatsApp,
                    style: const TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
      case 6:
        return Colors.brown;
      case 7:
        return Colors.deepOrangeAccent;
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
      case 6:
        return "Return";
      case 7:
        return "Client Not Available";
      default:
        return "Unknown";
    }
  }


  String _formatDate(dynamic dateValue) {
    if (dateValue == null) return 'N/A';

    try {
      DateTime date;

      if (dateValue is String) {
        date = DateTime.parse(dateValue);
      } else if (dateValue is DateTime) {
        date = dateValue;
      } else {
        return 'N/A';
      }

      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return 'N/A';
    }
  }
}

class OrderDetailsPage extends StatelessWidget {
  final Data order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Order Details',
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order ID Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.receipt_long,
                          color: Color(0xFF3B82F6),
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Order ID',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                order.randomOrderid ?? 'N/A',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
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
                  ),

                  const SizedBox(height: 24),

                  // Customer & Delivery Info
                  isMobile
                      ? Column(
                          children: [
                            _buildInfoCard(context),
                            const SizedBox(height: 16),
                            _buildDeliveryCard(context),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildInfoCard(context)),
                            const SizedBox(width: 16),
                            Expanded(child: _buildDeliveryCard(context)),
                          ],
                        ),

                  const SizedBox(height: 24),

                  // Medicines Card
                  // Container(
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.all(24),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(16),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.05),
                  //         blurRadius: 10,
                  //         offset: const Offset(0, 4),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         AppLocalizations.of(context)!.medicines,
                  //         style: const TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           color: Color(0xFF1E293B),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 16),
                  //       (order.medicines == null || order.medicines!.isEmpty)
                  //           ? const Text(
                  //               'No medicines listed',
                  //               style: TextStyle(
                  //                 fontSize: 14,
                  //                 color: Colors.grey,
                  //                 fontStyle: FontStyle.italic,
                  //               ),
                  //             )
                  //           : Column(
                  //               children: order.medicines!.map((m) {
                  //                 double price =
                  //                     double.tryParse(m.price.toString()) ??
                  //                     0.0;
                  //                 double discount =
                  //                     double.tryParse(
                  //                       m.discountPrice.toString(),
                  //                     ) ??
                  //                     0.0;
                  //                 int quantity = m.quantity ?? 0;
                  //                 double totalPrice =
                  //                     double.tryParse(
                  //                       m.totalPrice.toString(),
                  //                     ) ??
                  //                     0.0;
                  //                 return Container(
                  //                   margin: const EdgeInsets.only(bottom: 12),
                  //                   padding: const EdgeInsets.all(16),
                  //                   decoration: BoxDecoration(
                  //                     color: const Color(0xFFEFF6FF),
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     border: Border.all(
                  //                       color: const Color(0xFFDBEAFE),
                  //                     ),
                  //                   ),
                  //                   child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Row(
                  //                         children: [
                  //                           Container(
                  //                             padding: const EdgeInsets.all(8),
                  //                             decoration: BoxDecoration(
                  //                               color: const Color(0xFF3B82F6),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(8),
                  //                             ),
                  //                             child: Text(
                  //                               '${m.quantity ?? 0}x',
                  //                               style: const TextStyle(
                  //                                 fontSize: 14,
                  //                                 fontWeight: FontWeight.bold,
                  //                                 color: Colors.white,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(width: 12),
                  //                           Expanded(
                  //                             child: Text(
                  //                               m.medicineName ?? 'N/A',
                  //                               style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 fontWeight: FontWeight.w600,
                  //                                 color: Color(0xFF1E293B),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       const SizedBox(height: 12),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                 'Price',
                  //                                 style: TextStyle(
                  //                                   fontSize: 12,
                  //                                   color: Colors.grey[600],
                  //                                 ),
                  //                               ),
                  //                               Text(
                  //                                 '₹$price',
                  //                                 style: const TextStyle(
                  //                                   fontSize: 14,
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: Color(0xFF475569),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                           Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                 'Discount',
                  //                                 style: TextStyle(
                  //                                   fontSize: 12,
                  //                                   color: Colors.grey[600],
                  //                                 ),
                  //                               ),
                  //                               Text(
                  //                                 '₹$discount',
                  //                                 style: const TextStyle(
                  //                                   fontSize: 14,
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: Colors.green,
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                           Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                 'Total',
                  //                                 style: TextStyle(
                  //                                   fontSize: 12,
                  //                                   color: Colors.grey[600],
                  //                                 ),
                  //                               ),
                  //                               Text(
                  //                                 '₹$totalPrice',
                  //                                 style: const TextStyle(
                  //                                   fontSize: 14,
                  //                                   fontWeight: FontWeight.bold,
                  //                                   color: Color(0xFF0284C7),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //             ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.medicines,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 16),
                        (order.medicines == null || order.medicines!.isEmpty)
                            ? const Text(
                          'No medicines listed',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                            : Column(
                          children: order.medicines!.map((m) {
                            double price = double.tryParse(m.price.toString()) ?? 0.0;
                            double discount =
                                double.tryParse(m.discountPrice.toString()) ?? 0.0;
                            int quantity = m.quantity ?? 0;
                            double totalPrice =
                                double.tryParse(m.totalPrice.toString()) ?? 0.0;

                            // Discount percentage calculation
                            double discountPercent = 0.0;
                            if (price > 0) {
                              discountPercent = ((price - discount) / price) * 100;
                            }

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFDBEAFE),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF3B82F6),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          '${quantity}x',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          m.medicineName ?? 'N/A',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Price',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '₹$price',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF475569),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Discount',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '₹${discount}%',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '₹$totalPrice',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0284C7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(
            'Customer',
            order.fullName ?? 'N/A',
            Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            AppLocalizations.of(context)!.category,
            order.diseaseCategory ?? 'N/A',
            Icons.medical_services_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            AppLocalizations.of(context)!.duration,
            order.medicineDuration ?? 'N/A',
            Icons.access_time,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            AppLocalizations.of(context)!.whatsApp,
            order.whatsappNumber ?? 'N/A',
            Icons.phone_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(
            AppLocalizations.of(context)!.orderDate,
            _formatDate(order.createdAt),
            Icons.calendar_today_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            AppLocalizations.of(context)!.deliveryAddress,
            order.deliveryAddress ?? 'N/A',
            Icons.location_on_outlined,
          ),
          if (order.estimatedDeliveryDate != null) ...[
            const SizedBox(height: 16),
            _buildInfoRow(
              AppLocalizations.of(context)!.estimatedDelivery,
              _formatDate(order.estimatedDeliveryDate),
              Icons.local_shipping_outlined,
            ),
          ],
          if (order.summary?.finalAmount != null &&
              order.summary!.finalAmount!.isNotEmpty &&
              order.summary!.finalAmount != '0.00') ...[
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.finalPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
                Text(
                  '₹${order.summary!.finalAmount}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ],
          if (order.status == 4) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showRatingDialog(context, order);
                },
                icon: const Icon(Icons.star_outline, size: 20),
                label: const Text(
                  'Rate Order',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
          if (order.pharmacistId != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showPharmacistRatingDialog(context, order);
                },
                icon: const Icon(Icons.person_outline, size: 20),
                label: const Text(
                  'Rate Pharmacist',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF3B82F6)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Color _getStatusColor(int? status) {
    switch (status) {
      case 0:
        return Colors.orange; // Pending
      case 1:
        return Colors.blue; // Price Confirmation
      case 2:
        return Colors.green; // Shipped
      case 3:
        return Colors.purple; // Pickup/On the way
      case 4:
        return Colors.teal; // Delivered
      case 5:
        return Colors.red; // Cancelled
      case 6:
        return Colors.brown; // Return
      case 7:
        return Colors.deepOrangeAccent;
      default:
        return Colors.grey; // Unknown
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
      case 6:
        return "Return";
      case 7:
        return "Client Not Available";
      default:
        return "Unknown";
    }
  }


  String _formatDate(dynamic dateValue) {
    if (dateValue == null) return 'N/A';

    try {
      DateTime date;

      if (dateValue is String) {
        date = DateTime.parse(dateValue);
      } else if (dateValue is DateTime) {
        date = dateValue;
      } else {
        return 'N/A';
      }

      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return 'N/A';
    }
  }

  void _showPharmacistRatingDialog(BuildContext context, Data order) {
    final pharmacistRatingViewModel = Provider.of<PharmacistRatingViewModel>(
      context,
      listen: false,
    );
    double _rating = 0;
    TextEditingController _descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              'Rating Pharmacist',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Please rate your Pharmacist experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 50,
                    unratedColor: Colors.grey[300],
                    itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  if (_rating > 0)
                    Text(
                      'Your rating: $_rating',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Write your feedback here...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  pharmacistRatingViewModel.pharmacistRatingApi(
                    order.pharmacistId,
                    order.id,
                    _rating,
                    _descController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRatingDialog(BuildContext context, Data order) {
    final ratingViewModel = Provider.of<RatingViewModel>(
      context,
      listen: false,
    );
    double _rating = 0;
    TextEditingController _descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              'Rate your order',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Please rate your delivery experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 50,
                    unratedColor: Colors.grey[300],
                    itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  if (_rating > 0)
                    Text(
                      'Your rating: $_rating',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Write your feedback here...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  ratingViewModel.ratingApi(
                    order.deliveryPartnerId,
                    order.id,
                    _rating,
                    _descController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
