import 'package:flutter/material.dart';

class OrderMedicineScreen extends StatefulWidget {
  const OrderMedicineScreen({super.key});

  @override
  State<OrderMedicineScreen> createState() => _OrderMedicineScreenState();
}

class _OrderMedicineScreenState extends State<OrderMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  bool _isLoggedIn = false;

  final List<String> categories = [
    'Pain Relief',
    'Cold & Flu',
    'Diabetes',
    'Heart Disease',
    'Blood Pressure',
    'Skin Care',
    'Digestive Health',
    'Mental Health',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return SingleChildScrollView(
          child: Column(
            children: [
              // Gradient Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: 60, horizontal: isMobile ? 20 : 80),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
                  ),
                ),
                child: Column(
                  children: [
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: const Text(
                        'Order Medicine',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 1000),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Opacity(opacity: value, child: child);
                      },
                      child: Text(
                        'Fill out the form below to order your medicines. Upload your prescription for verification.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
                child: Column(
                  children: [
                    // Login Warning
                    if (!_isLoggedIn)
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: 0.95 + (0.05 * value),
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFFBBF24),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                const Color(0xFFFBBF24).withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: isMobile
                              ? Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.info_outline_rounded,
                                      color: Color(0xFFF59E0B),
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Expanded(
                                    child: Text(
                                      'Please login to place an order',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF92400E),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'You need to be logged in to access the order form.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFF2563EB),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                              : Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.info_outline_rounded,
                                  color: Color(0xFFF59E0B),
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Please login to place an order',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF92400E),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'You need to be logged in to access the order form.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFF2563EB),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Order Form
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, double value, child) {
                        return Opacity(
                          opacity: _isLoggedIn ? value : 0.4,
                          child: child,
                        );
                      },
                      child: AbsorbPointer(
                        absorbing: !_isLoggedIn,
                        child: Container(
                          padding: EdgeInsets.all(isMobile ? 24 : 48),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2563EB)
                                            .withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.description_rounded,
                                        color: Color(0xFF2563EB),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Text(
                                      'Order Information',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E293B),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 40),

                                // Responsive name/category
                                isMobile
                                    ? Column(
                                  children: [
                                    _buildNameField(),
                                    const SizedBox(height: 24),
                                    _buildCategoryField(),
                                  ],
                                )
                                    : Row(
                                  children: [
                                    Expanded(child: _buildNameField()),
                                    const SizedBox(width: 24),
                                    Expanded(child: _buildCategoryField()),
                                  ],
                                ),

                                const SizedBox(height: 28),

                                _buildAddressField(),

                                const SizedBox(height: 28),

                                // Contact fields
                                isMobile
                                    ? Column(
                                  children: [
                                    _buildPhoneField(),
                                    const SizedBox(height: 24),
                                    _buildEmailField(),
                                  ],
                                )
                                    : Row(
                                  children: [
                                    Expanded(child: _buildPhoneField()),
                                    const SizedBox(width: 24),
                                    Expanded(child: _buildEmailField()),
                                  ],
                                ),

                                const SizedBox(height: 40),

                                _buildUploadSection(),

                                const SizedBox(height: 40),

                                _buildSubmitButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
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

  // === Subsections ===

  Widget _buildNameField() => _inputField('Full Name *', 'Enter your full name');
  Widget _buildCategoryField() => _inputField('Disease/Ailment Category *', 'Select category');
  Widget _buildAddressField() => _inputField('Delivery Address *', 'Enter your complete address', maxLines: 3);
  Widget _buildPhoneField() => _inputField('Phone Number *', '+91 XXXXX XXXXX');
  Widget _buildEmailField() => _inputField('Email Address (Optional)', 'your.email@example.com');
  Widget _buildUploadSection() => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FAFC),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.2)),
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.cloud_upload_rounded,
              color: Color(0xFF2563EB), size: 48),
        ),
        const SizedBox(height: 20),
        const Text('Upload Prescription *',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B))),
        const SizedBox(height: 8),
        const Text(
          'Drag and drop your prescription here, or click to browse',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file_rounded),
          label: const Text('Choose File'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            padding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    ),
  );

  Widget _buildSubmitButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Place Order',
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(width: 12),
          Icon(Icons.arrow_forward_rounded),
        ],
      ),
    ),
  );

  Widget _inputField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF334155))),
        const SizedBox(height: 12),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
        ),
      ],
    );
  }
}
