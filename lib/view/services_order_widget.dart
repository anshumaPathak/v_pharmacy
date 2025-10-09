import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../l10n/app_localizations.dart';

class OrderMedicineScreen extends StatefulWidget {
  const OrderMedicineScreen({super.key});

  @override
  State<OrderMedicineScreen> createState() => _OrderMedicineScreenState();
}

class _OrderMedicineScreenState extends State<OrderMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  File? _selectedImage;
  // ✅ Images at state level
  List<File> _selectedImages = []; // Mobile
  List<Uint8List> _webImages = []; // Web
  String? _selectedCategory;
  String? _selectedDuration;
  bool _isLoggedIn = true; // Testing ke liye true set kiya

  // Text Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _alternateController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      if (kIsWeb) {
        List<Uint8List> webBytes = [];
        for (var image in images) {
          final bytes = await image.readAsBytes();
          webBytes.add(bytes);
        }
        setState(() {
          _webImages.addAll(webBytes);
        });
      } else {
        setState(() {
          _selectedImages.addAll(images.map((e) => File(e.path)));
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = [];
    if (kIsWeb) {
      imageWidgets = _webImages
          .map((img) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.memory(img, width: 100, height: 100, fit: BoxFit.cover),
      ))
          .toList();
    } else {
      imageWidgets = _selectedImages
          .map((img) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.file(img, width: 100, height: 100, fit: BoxFit.cover),
      ))
          .toList();
    }

    if (kIsWeb) {
      imageWidgets = _webImages
          .map((img) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.memory(img, width: 100, height: 100, fit: BoxFit.cover),
      ))
          .toList();
    } else {
      imageWidgets = _selectedImages
          .map((img) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.file(img, width: 100, height: 100, fit: BoxFit.cover),
      ))
          .toList();
    }
    final categories = [
      AppLocalizations.of(context)!.categoryPainRelief,
      AppLocalizations.of(context)!.categoryColdFlu,
      AppLocalizations.of(context)!.categoryDiabetes,
      AppLocalizations.of(context)!.categoryHeartDisease,
      AppLocalizations.of(context)!.categoryBloodPressure,
      AppLocalizations.of(context)!.categorySkinCare,
      AppLocalizations.of(context)!.categoryDigestiveHealth,
      AppLocalizations.of(context)!.categoryMentalHealth,
    ];

    final durations = [
      AppLocalizations.of(context)!.duration1to7Days,
      AppLocalizations.of(context)!.duration1to2Weeks,
      AppLocalizations.of(context)!.duration2to4Weeks,
      AppLocalizations.of(context)!.duration1to3Months,
      AppLocalizations.of(context)!.duration3to6Months,
      AppLocalizations.of(context)!.duration6PlusMonths,
    ];

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
                  vertical: 60,
                  horizontal: isMobile ? 20 : 80,
                ),
                decoration:  BoxDecoration(
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
                      child: Text(
                        AppLocalizations.of(context)!.orderMedicine,
                        style: const TextStyle(
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
                        AppLocalizations.of(context)!.orderMedicineSubtitle,
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
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                child: Column(
                  children: [
                    // Order Form Container
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: isMobile
                            ? MediaQuery.of(context).size.width * 0.9
                            : 800,
                        padding: EdgeInsets.all(isMobile ? 24 : 40),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              Row(
                                children: [
                                  const Icon(
                                    Icons.description_outlined,
                                    color: Color(0xFF1E293B),
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    AppLocalizations.of(context)!.orderInformation,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w600,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              isMobile
                                  ? Column(
                                children: [
                                  _buildTextField(
                                      controller: _nameController,
                                      label: AppLocalizations.of(context)!.fullName,
                                      hint: AppLocalizations.of(context)!.enterFullName,
                                      icon: Icons.person_outline),
                                  const SizedBox(height: 24),
                                  _buildDropdownField(
                                      label: AppLocalizations.of(context)!.diseaseCategory,
                                      hint: AppLocalizations.of(context)!.selectCategory,
                                      items: categories,
                                      value: _selectedCategory,
                                      onChanged: (val) {
                                        setState(() => _selectedCategory = val);
                                      },
                                      icon: Icons.medical_services_outlined),
                                ],
                              )
                                  : Row(
                                children: [
                                  Expanded(
                                    child: _buildTextField(
                                        controller: _nameController,
                                        label: AppLocalizations.of(context)!.fullName,
                                        hint: AppLocalizations.of(context)!.enterFullName,
                                        icon: Icons.person_outline),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: _buildDropdownField(
                                        label: AppLocalizations.of(context)!.diseaseCategory,
                                        hint: AppLocalizations.of(context)!.selectCategory,
                                        items: categories,
                                        value: _selectedCategory,
                                        onChanged: (val) {
                                          setState(() => _selectedCategory = val);
                                        },
                                        icon: Icons.medical_services_outlined),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              _buildTextField(
                                  controller: _addressController,
                                  label: AppLocalizations.of(context)!.deliveryAddress,
                                  hint: AppLocalizations.of(context)!.enterAddress,
                                  maxLines: 3,
                                  icon: Icons.location_on_outlined),
                              const SizedBox(height: 20),

                              isMobile
                                  ? Column(
                                children: [
                                  _buildTextField(
                                      controller: _emailController,
                                      label: AppLocalizations.of(context)!.emailAddressOptional,
                                      hint: AppLocalizations.of(context)!.enterEmail,
                                      icon: Icons.email_outlined),
                                  const SizedBox(height: 24),
                                  _buildTextField(
                                      controller: _phoneController,
                                      label: AppLocalizations.of(context)!.phoneNumber,
                                      hint: AppLocalizations.of(context)!.enterPhoneNumber,
                                      icon: Icons.phone_outlined),
                                ],
                              )
                                  : Row(
                                children: [
                                  Expanded(
                                    child: _buildTextField(
                                        controller: _emailController,
                                        label: AppLocalizations.of(context)!.emailAddressOptional,
                                        hint: AppLocalizations.of(context)!.enterEmail,
                                        icon: Icons.email_outlined),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: _buildTextField(
                                        controller: _phoneController,
                                        label: AppLocalizations.of(context)!.phoneNumber,
                                        hint: AppLocalizations.of(context)!.enterPhoneNumber,
                                        icon: Icons.phone_outlined),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: _pickImages,
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEFF6FF),
                                    border: Border.all(color: const Color(0xFF2563EB)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: _selectedImages.isEmpty && _webImages.isEmpty
                                        ? const Text(
                                      "Tap to upload prescription",
                                      style: TextStyle(color: Color(0xFF2563EB)),
                                    )
                                        : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(children: imageWidgets),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              _buildDropdownField(
                                  label: AppLocalizations.of(context)!.medicineDuration,
                                  hint: AppLocalizations.of(context)!.selectDuration,
                                  items: durations,
                                  value: _selectedDuration,
                                  onChanged: (val) {
                                    setState(() => _selectedDuration = val);
                                  },
                                  icon: Icons.calendar_month_outlined),

                              const SizedBox(height: 32),

                              _buildTextField(
                                  controller: _instructionsController,
                                  label: AppLocalizations.of(context)!.specialInstructionsOptional,
                                  hint: AppLocalizations.of(context)!.addSpecialInstructions,
                                  maxLines: 4),

                              const SizedBox(height: 40),

                              _buildSubmitButton(),
                            ],
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: const Color(0xFF0F172A), size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF646b75),
                ),
              ),
            ],
          ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            constraints: BoxConstraints(
              maxHeight: 35
            ),
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: const Color(0xFFf8fafc),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF2563EB)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          validator: (value) => value!.isEmpty ? 'Field cannot be empty' : null,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required List<String> items,
    String? value,
    required Function(String?) onChanged,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFF1E293B), size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF646b75),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(hint, style: TextStyle(color: Colors.grey[400])),
          decoration: InputDecoration(
            constraints: BoxConstraints(
                maxHeight: 35
            ),
            filled: true,
            fillColor: const Color(0xFFf8fafc),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF2563EB)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   if (_selectedImage == null) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Please upload prescription')));
        //     return;
        //   }
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(const SnackBar(content: Text('Order Submitted!')));
        // }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(
        AppLocalizations.of(context)!.submitOrder,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }
}
