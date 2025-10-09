import 'package:flutter/material.dart';

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        final orders = [
          _buildOrderCard(
            orderId: 'ORD-2024-1234',
            category: 'Heart & Blood Pressure',
            orderDate: '2024-01-15',
            duration: '30 days',
            medicines: ['Lisinopril 10mg', 'Metoprolol 50mg'],
            status: 'Pending Verification',
            statusColor: const Color(0xFFFEF3C7),
            statusTextColor: const Color(0xFF92400E),
            message: 'Waiting for admin verification. Updates via WhatsApp.',
          ),
          _buildOrderCard(
            orderId: 'ORD-2024-5678',
            category: 'Diabetes',
            orderDate: '2024-01-14',
            duration: '60 days',
            medicines: ['Metformin 500mg', 'Glipizide 5mg', '+1 more'],
            status: 'Price Confirmation',
            statusColor: const Color(0xFFDBEAFE),
            statusTextColor: const Color(0xFF1E40AF),
            finalPrice: '\$45.99',
            originalPrice: '\$57.99',
            discount: '-\$12.00',
          ),
          _buildOrderCard(
            orderId: 'ORD-2024-9999',
            category: 'Pain Relief',
            orderDate: '2024-01-10',
            duration: '15 days',
            medicines: ['Ibuprofen 400mg', 'Paracetamol 500mg'],
            status: 'Shipped',
            statusColor: const Color(0xFFD1FAE5),
            statusTextColor: const Color(0xFF065F46),
          ),
          _buildOrderCard(
            orderId: 'ORD-2024-7777',
            category: 'Allergy & Asthma',
            orderDate: '2024-01-05',
            duration: '30 days',
            medicines: ['Cetirizine 10mg', 'Montelukast 10mg'],
            status: 'Delivered',
            statusColor: const Color(0xFFD1FAE5),
            statusTextColor: const Color(0xFF065F46),
          ),
        ];

        return SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: isMobile ? 20 : 80,
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
                    const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Track all your medicine orders and manage price confirmations.',
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

              // Orders Grid (Row wise)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: orders
                      .map(
                        (card) => SizedBox(
                      width: isMobile
                          ? double.infinity
                          : (constraints.maxWidth / 2) - 80,
                      child: card,
                    ),
                  )
                      .toList(),
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
  static Widget _buildOrderCard({
    required String orderId,
    required String category,
    required String orderDate,
    required String duration,
    required List<String> medicines,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    String? message,
    String? finalPrice,
    String? originalPrice,
    String? discount,
  }) {
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
              Text(
                orderId,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(category, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          const SizedBox(height: 24),

          // Dates
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Date:', style: TextStyle(color: Colors.grey[600])),
                    Text(orderDate,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Duration:', style: TextStyle(color: Colors.grey[600])),
                    Text(duration,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Color(0xFF1E293B))),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Price Section
          if (finalPrice != null) ...[
            Text('Final Price:',
                style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            Text(finalPrice,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10B981))),
          ],

          const SizedBox(height: 16),

          // Medicines
          Text('Medicines:', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            children: medicines
                .map((m) => Chip(
              label: Text(m),
              backgroundColor: const Color(0xFFF1F5F9),
            ))
                .toList(),
          ),

          if (message != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Color(0xFF92400E), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF92400E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('View Details'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message, size: 16),
                  label: const Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
}
