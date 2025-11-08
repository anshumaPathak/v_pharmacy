import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/utils.dart';
import 'package:v_pharmashing/view_model/auth_view_model/create_order_view_model.dart';
import '../l10n/app_localizations.dart';
import '../view_model/diases_category_view_model.dart';
import '../view_model/profile_view_model.dart';
import '../view_model/user_view_model.dart';

class OrderMedicineScreen extends StatefulWidget {
  const OrderMedicineScreen({super.key});

  @override
  State<OrderMedicineScreen> createState() => _OrderMedicineScreenState();
}

class _OrderMedicineScreenState extends State<OrderMedicineScreen> {

  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  List<File> _selectedImages = [];
  List<Uint8List> _webImages = [];
  String? _selectedCategory;
  String? _selectedDuration;
  String? userId;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _alternateController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  bool showOtherDurationField = false;
  TextEditingController _otherDurationController = TextEditingController();
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DisasesCategoryViewModel>(context, listen: false)
          .diseaseCategoryApi();
      _refreshProfile();
      _loadUserId();
    });
  }
  void _refreshProfile() async {
    if (_isRefreshing) return;
    setState(() => _isRefreshing = true);
    await Provider.of<ProfileViewModel>(context, listen: false)
        .profileApi(context);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) setState(() => _isRefreshing = false);
  }
  Future<void> _loadUserId() async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? id = await userViewModel.getUser();
    setState(() {
      userId = id;
    });
  }
  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    _whatsappController.clear();
    _alternateController.clear();
    _instructionsController.clear();
    _otherDurationController.clear();
    _selectedCategory = null;
    _selectedDuration = null;
    showOtherDurationField = false;
    _selectedImages.clear();
    _webImages.clear();
    setState(() {}); // UI update
  }


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
    final categoryVM = Provider.of<DisasesCategoryViewModel>(context);

    // ✅ Fetch list safely from API model
    final List<String> categories = categoryVM.disaseCategoryModel?.data
        ?.map((e) => e.name ?? "")
        .toList() ??
        [];
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


    final durations = [
      "7 Days",
      "15 Days",
      "30 Days",
      "60 Days",
      "90 Days",
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
              const SizedBox(height: 40),
              if (userId == null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 60),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.screenWidth * 0.03,
                        vertical: Sizes.screenHeight * 0.03),
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

              const SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                child: Column(
                  children: [
                    // Order Form Container
                    Align(
                      alignment: Alignment.topCenter,
                      child: AbsorbPointer(
                        absorbing: userId == null,
                        child: Container(
                          width: isMobile ? MediaQuery.of(context).size.width * 0.9 : 800,
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
                                        color: Color(0xFF1E293B),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Name & Category
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
                                      label: "Disease Category",
                                      hint: "Select Category",
                                      items: categories,
                                      value: _selectedCategory,
                                      onChanged: (val) {
                                        setState(() => _selectedCategory = val);
                                      },
                                      icon: Icons.medical_services_outlined,
                                    ),
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

                                // Address
                                _buildTextField(
                                    controller: _addressController,
                                    label: AppLocalizations.of(context)!.deliveryAddress,
                                    hint: AppLocalizations.of(context)!.enterAddress,
                                    maxLines: 3,
                                    icon: Icons.location_on_outlined),

                                const SizedBox(height: 20),

                                // Email, Phone & Alternate Phone
                                isMobile
                                    ? Column(
                                  children: [
                                    _buildTextField(
                                        controller: _emailController,
                                        label: AppLocalizations.of(context)!.emailAddressOptional,
                                        hint: AppLocalizations.of(context)!.enterEmail,
                                        icon: Icons.email_outlined),
                                    const SizedBox(height: 24),

                                    _buildNumberTextField(
                                        controller: _phoneController,
                                        label: AppLocalizations.of(context)!.phoneNumber,
                                        hint: AppLocalizations.of(context)!.enterPhoneNumber,
                                        icon: Icons.phone_outlined),
                                    const SizedBox(height: 24),
                                    _buildNumberTextField(
                                        controller: _alternateController,
                                        label: AppLocalizations.of(context)!.alternateNumber,
                                        hint: AppLocalizations.of(context)!.alternateNumber,
                                        icon: Icons.phone_outlined),
                                  ],
                                )
                                    : Row(
                                  children: [
                                    Expanded(
                                      child:
                                      _buildNumberTextField(
                                          controller: _phoneController,
                                          label: AppLocalizations.of(context)!.phoneNumber,
                                          hint: AppLocalizations.of(context)!.enterPhoneNumber,
                                          icon: Icons.phone_outlined),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: _buildNumberTextField(
                                          controller: _alternateController,
                                          label:AppLocalizations.of(context)!.alternateNumber,
                                          hint: AppLocalizations.of(context)!.alternateNumber,
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
                                    child: _selectedImages.isEmpty && _webImages.isEmpty
                                        ?  Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.tapToUploadPrescription,
                                        style: TextStyle(color: Color(0xFF2563EB)),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: ScrollConfiguration(
                                        behavior: ScrollConfiguration.of(context).copyWith(
                                          scrollbars: true, // ✅ show scrollbar in web
                                          dragDevices: {
                                            PointerDeviceKind.touch,
                                            PointerDeviceKind.mouse, // ✅ mouse scroll support
                                          },
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...List.generate(
                                                kIsWeb ? _webImages.length : _selectedImages.length,
                                                    (index) {
                                                  final imageWidget = kIsWeb
                                                      ? Image.memory(
                                                    _webImages[index],
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  )
                                                      : Image.file(
                                                    _selectedImages[index],
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  );

                                                  return Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: imageWidget,
                                                        ),
                                                        Positioned(
                                                          top: -5,
                                                          right: -5,
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return AlertDialog(
                                                                    title: const Text("Choose an action"),
                                                                    content: const Text("Do you want to delete this image?"),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(context),
                                                                        child: const Text("Cancel"),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () {
                                                                          setState(() {
                                                                            if (kIsWeb) {
                                                                              _webImages.removeAt(index);
                                                                            } else {
                                                                              _selectedImages.removeAt(index);
                                                                            }
                                                                          });
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: const Text(
                                                                          "Delete",
                                                                          style: TextStyle(color: Colors.red),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration: const BoxDecoration(
                                                                color: Colors.red,
                                                                shape: BoxShape.circle,
                                                              ),
                                                              padding: const EdgeInsets.all(4),
                                                              child: const Icon(
                                                                Icons.close,
                                                                size: 18,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: _pickImages,
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue.shade400,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      size: 24,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                const SizedBox(height: 32),

                                // Medicine Duration
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_month_outlined, color: Color(0xFF1E293B), size: 20),
                                        const SizedBox(width: 8),
                                        Text(
                                          AppLocalizations.of(context)!.medicineDuration,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF646b75),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    if (!showOtherDurationField)
                                      DropdownButtonFormField<String>(
                                        value: _selectedDuration,
                                        dropdownColor: Colors.white,
                                        hint: Text(
                                          AppLocalizations.of(context)!.selectDuration,
                                          style: TextStyle(color: Colors.grey[400]),
                                        ),
                                        decoration: InputDecoration(
                                          constraints: const BoxConstraints(maxHeight: 38),
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
                                        items: [
                                          ...durations.map(
                                                (d) => DropdownMenuItem<String>(
                                              value: d,
                                              child: Text(d),
                                            ),
                                          ),
                                          const DropdownMenuItem<String>(
                                            value: "Other",
                                            child: Text("Other"),
                                          ),
                                        ],
                                        onChanged: (val) {
                                          setState(() {
                                            if (val == "Other") {
                                              showOtherDurationField = true;
                                              _selectedDuration = null;
                                            } else {
                                              _selectedDuration = val;
                                            }
                                          });
                                        },
                                      ),
                                    if (showOtherDurationField)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: AppColor.blueColor, width: 2),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              TextField(
                                                controller: _otherDurationController,
                                                maxLength: 2,
                                                keyboardType: TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.digitsOnly,
                                                ],
                                                onChanged: (value) {
                                                  (value);
                                                },
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  constraints: const BoxConstraints(maxHeight: 40),
                                                  filled: true,
                                                  fillColor: const Color(0xFFf8fafc),
                                                  hintText: "Enter duration",
                                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),

                                              // 👇 Ye “days” ko input ke text ke bagal me show karega
                                              Positioned(
                                                left: 50, // 👈 apne input ke hisab se adjust karlo
                                                child: ValueListenableBuilder<TextEditingValue>(
                                                  valueListenable: _otherDurationController,
                                                  builder: (context, value, _) {
                                                    return value.text.isNotEmpty
                                                        ? Text(
                                                      "days",
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    )
                                                        : const SizedBox();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),



                                  ],
                                ),

                                const SizedBox(height: 32),

                                // Special Instructions
                                _buildInstructionsField(
                                    controller: _instructionsController,
                                    label: AppLocalizations.of(context)!.specialInstructionsOptional,
                                    hint: AppLocalizations.of(context)!.addSpecialInstructions,
                                    ),

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
  Widget _buildNumberTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // ✅ Only digits allowed
            LengthLimitingTextInputFormatter(10),   // ✅ Optional: limit to 10 digits
          ],
          decoration: InputDecoration(
            counterText: "",
            hintText: hint,
            constraints: BoxConstraints(
              maxHeight: 38
            ),
            filled: true,
            fillColor: isEditable ? const Color(0xFFf8fafc) : Colors.grey.shade100,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
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
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFF646b75),
            ),
          ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          readOnly: !isEditable,
          minLines: 1,
          maxLines: null, // unlimited lines, auto-expand
          // textAlign: TextAlign.center,
          // textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.multiline,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                r'[\u{1F600}-\u{1F64F}' // emoticons
                r'\u{1F300}-\u{1F5FF}' // symbols & pictographs
                r'\u{1F680}-\u{1F6FF}' // transport & map
                r'\u{2600}-\u{26FF}'   // misc symbols
                r'\u{2700}-\u{27BF}]', // dingbats
                unicode: true,
              ),
            ),
          ],
          scrollPhysics: const NeverScrollableScrollPhysics(), // scroll disable
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: isEditable ? const Color(0xFFf8fafc) : Colors.grey.shade100,
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
        ),
      ],
    );
  }

  bool get isEditable => userId != null;
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int minLines = 1,
    int maxLines = 5, // max height fix, iske baad auto expand
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
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 38, // maximum height
          ),
          child: TextFormField(
            controller: controller,
            readOnly: !isEditable,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: TextInputType.multiline,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9/\s]')),
            ],
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: isEditable ? const Color(0xFFf8fafc) : Colors.grey.shade100,
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
          ),
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
        IgnorePointer(
          ignoring: !isEditable,
          child: DropdownButtonFormField<String>(
            dropdownColor: Colors.white,
            value: value,
            hint: Text(hint, style: TextStyle(color: Colors.grey[400])),
            decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: 38
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
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            items: items
                .map((String item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  void showApiPopup({
    required BuildContext context,
    required String title,
    required String message,
    bool isSuccess = true,
    VoidCallback? onOk,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onOk != null) onOk();
            },
            child: Text(
              "OK",
              style: TextStyle(color: isSuccess ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSubmitButton() {
    final createOrderViewModel = Provider.of<CreateOrderViewModel>(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: createOrderViewModel.loading
            ? null
            : () async {
          String name = _nameController.text.trim();
          String phone = _phoneController.text.trim();
          String address = _addressController.text.trim();
          String instruction = _instructionsController.text.trim();

          final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
          final addressRegex = RegExp(r'^[a-zA-Z0-9\s\/,\.\-]+$');
          final instructionRegex = RegExp(r'^[a-zA-Z\s]+$');
          final phoneRegex = RegExp(r'^[0-9]{10}$');

          if (name.isEmpty || !nameRegex.hasMatch(name)) {
            Utils.show("Please enter a valid full name (letters and spaces only)", context);
            return;
          }

          if (_selectedCategory == null || _selectedCategory!.isEmpty) {
            Utils.show("Please select a valid category", context);
            return;
          }

          if (address.isEmpty || !addressRegex.hasMatch(address)) {
            Utils.show(
              "Please enter a valid delivery address (you can use letters, numbers, spaces, / , . and -)",
              context,
            );
            return;
          }


          if (phone.isEmpty || !phoneRegex.hasMatch(phone)) {
            Utils.show("Please enter a valid 10-digit phone number", context);
            return;
          }

          if (instruction.isNotEmpty && !instructionRegex.hasMatch(instruction)) {
            Utils.show("Special instructions can only contain letters and spaces", context);
            return;
          }

          if ((_selectedDuration == null || _selectedDuration!.isEmpty) &&
              _otherDurationController.text.isEmpty) {
            Utils.show("Please select or enter medicine duration", context);
            return;
          }

          // 🔹 Prepare prescription files
          List<dynamic> filesToSend = kIsWeb ? _webImages : _selectedImages;

          // 🔹 Show loader
          createOrderViewModel.setLoading(true);

          try {
            await createOrderViewModel.createOrderApi(
              name,
              _selectedCategory!,
              address,
              phone,
              _alternateController.text,
              _selectedDuration ?? _otherDurationController.text,
              instruction,
              filesToSend,
              context,
            );
            _refreshProfile();
            showApiPopup(
              context: context,
              title: "Order Placed!",
              message: "Your order has been successfully placed.",
              isSuccess: true,
              onOk: _resetForm,
            );
          }
          catch (e) {
            Utils.show("Something went wrong. Please try again later.", context);
          } finally {
            createOrderViewModel.setLoading(false);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),

        // 🔹 Button content
        child: createOrderViewModel.loading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          AppLocalizations.of(context)!.submitOrder,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
