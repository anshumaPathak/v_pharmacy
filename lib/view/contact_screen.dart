import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/sizing_const.dart';
import '../l10n/app_localizations.dart';
import '../res/const_color.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<String> categories = [
    "General Inquiry",
    "Order Issue",
    "Technical Support",
    "Feedback"
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ===== Top Section =====
          Container(
            height: Sizes.screenHeight * 0.3,
            width: double.infinity,
            color: const Color(0xFFe8f2ff),
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.03, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.getInTouch,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Sizes.spaceHeight10,
                Text(
                  AppLocalizations.of(context)!.weHereToHelpReachOutToUsAnytimeForSupport,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppLocalizations.of(context)!.medicineOrdersAndVerification,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // ===== Contact Methods =====
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.screenWidth * 0.03, vertical: 20),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.contactMethods,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.chooseYourPreferredWayToReachUs,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 20),

                // ✅ Responsive Layout (Row → Column)
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      // 📱 Mobile View
                      return Column(
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title:  AppLocalizations.of(context)!.whatsAppSupport,
                            subtitle:  AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.chatNow,
                            buttonColor: Colors.green,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.call,
                            title:  AppLocalizations.of(context)!.phoneSupport,
                            subtitle:  AppLocalizations.of(context)!.talkToOurSupportTeam,
                            info: "+1-234-567-8900",
                            buttonText:  AppLocalizations.of(context)!.callNow,
                            buttonColor: Colors.blue,
                          ),
                          SizedBox(height: 20),
                          _contactCard(
                            icon: Icons.email,
                            title:  AppLocalizations.of(context)!.emailSupport,
                            subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
                            info: "support@medicare.com",
                            buttonText:   AppLocalizations.of(context)!.sendEmail,
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    } else {
                      // 💻 Desktop View
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _contactCard(
                            icon: Icons.whatshot_outlined,
                            title:   AppLocalizations.of(context)!.whatsAppSupport,
                            subtitle:   AppLocalizations.of(context)!.getInstantHelpViaWhatsApp,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.chatNow,
                            buttonColor: Colors.green,
                          ),
                          _contactCard(
                            icon: Icons.call,
                            title:  AppLocalizations.of(context)!.phoneSupport,
                            subtitle:   AppLocalizations.of(context)!.talkToOurSupportTeam,
                            info: "+1-234-567-8900",
                            buttonText:   AppLocalizations.of(context)!.callNow,
                            buttonColor: Colors.blue,
                          ),
                          _contactCard(
                            icon: Icons.email,
                            title:   AppLocalizations.of(context)!.emailSupport,
                            subtitle:   AppLocalizations.of(context)!.sendUsYourQueries,
                            info: "support@medicare.com",
                            buttonText:   AppLocalizations.of(context)!.sendEmail,
                            buttonColor: Colors.purple,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // ===== Contact Form Section =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.sendUsAMessage,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.fillOutTheFormBelowAndWeGetBackToYouWithin24Hours,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 40),

                // ===== Form Card =====
                Container(
                  width: screen.width < 700 ? double.infinity : 900,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row 1 - Full Name & Email
                      screen.width < 700
                          ? Column(
                        children: [
                          _buildTextField(
                              label: "${  AppLocalizations.of(context)!.fullName} *",
                              hint:   AppLocalizations.of(context)!.enterYourFullName,
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                              label: "${  AppLocalizations.of(context)!.emailAddress}*",
                              hint: "your.email@example.com"),
                        ],
                      )
                          : Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              label: "${  AppLocalizations.of(context)!.fullName} *",
                              hint:   AppLocalizations.of(context)!.enterYourFullName,),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: _buildTextField(
                                label: "${AppLocalizations.of(context)!.emailAddress}*",
                                hint: "your.email@example.com"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Row 2 - Phone & Category
                      screen.width < 700
                          ? Column(
                        children: [
                          _buildTextField(
                              label: AppLocalizations.of(context)!.phoneNumber,
                              hint: "+1-234-567-8900"),
                          SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "${AppLocalizations.of(context)!.category} *",
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8)),
                            ),
                            value: selectedCategory,
                            items: categories
                                .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedCategory = val;
                              });
                            },
                          ),
                        ],
                      )
                          : Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                                label: AppLocalizations.of(context)!.phoneNumber,
                                hint: "+1-234-567-8900"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "${AppLocalizations.of(context)!.category} *",
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              value: selectedCategory,
                              items: categories
                                  .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedCategory = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      _buildTextField(
                          label: "${AppLocalizations.of(context)!.subject} *",
                          hint:AppLocalizations.of(context)!.briefDescriptionOfYourInquiry),
                      SizedBox(height: 20),

                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.description,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.submitMessage,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: AppColor.blueColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.ourSupportHours,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 700) {
                      return Column(
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: AppLocalizations.of(context)!.whatsAppSupport,
                            timing: "${AppLocalizations.of(context)!.available} 24/7",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: AppLocalizations.of(context)!.phoneSupport,
                            timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
                          ),
                          SizedBox(height: 40),
                          _supportHourCard(
                            icon: Icons.people,
                            title: AppLocalizations.of(context)!.liveChat,
                            timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _supportHourCard(
                            icon: Icons.access_time,
                            title: AppLocalizations.of(context)!.whatsAppSupport,
                            timing: "${AppLocalizations.of(context)!.available} 24/7",
                          ),
                          _supportHourCard(
                            icon: Icons.headset_mic,
                            title: AppLocalizations.of(context)!.phoneSupport,
                            timing: "24/7 ${AppLocalizations.of(context)!.emergency}",
                          ),
                          _supportHourCard(
                            icon: Icons.people,
                            title: AppLocalizations.of(context)!.liveChat,
                            timing: "9 AM - 9 PM ${AppLocalizations.of(context)!.daily}",
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700; // adjust breakpoint if needed

              return Container(
                width: isMobile ? double.infinity : 900,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side (Address & Hours)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Address
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(AppLocalizations.of(context)!.address,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.medicalDistrict,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("${AppLocalizations.of(context)!.newYork} 10001",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.unitedStates,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Office Hours
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.access_time,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(AppLocalizations.of(context)!.officeHours,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                Text(AppLocalizations.of(context)!.sundayClosed,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black87)),
                                SizedBox(height: 8),
                                Text("${AppLocalizations.of(context)!.emergency}: 24/7",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Map below in mobile
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                           Text(
                               AppLocalizations.of(context)!.interactiveMap,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                           Text(
                               AppLocalizations.of(context)!.clickToViewLocation,
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.location_on,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(AppLocalizations.of(context)!.address,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("123 ${AppLocalizations.of(context)!.healthcareAvenue}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.medicalDistrict,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("${AppLocalizations.of(context)!.newYork} 10001",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.unitedStates,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Office Hours
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.access_time,
                                    color: Colors.blue, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context)!.officeHours,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text("${AppLocalizations.of(context)!.mondayFriday}: 9:00 AM - 6:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text("${AppLocalizations.of(context)!.saturday}: 10:00 AM - 4:00 PM",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  Text(AppLocalizations.of(context)!.sundayClosed,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black87)),
                                  SizedBox(height: 8),
                                  Text("${AppLocalizations.of(context)!.emergency}: 24/7",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    // Map on Right
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,
                              size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                           Text(
                             AppLocalizations.of(context)!.interactiveMap,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 5),
                           Text(
                             AppLocalizations.of(context)!.clickToViewLocation,
                            style:
                            TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  // ====== Reusable TextField ======
  Widget _buildTextField({required String label, required String hint}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ====== Contact Card Widget ======
  Widget _contactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String info,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Container(
      width: 260,
      height: 270,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12)),
          Text(info,
              textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.03),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: Size(double.infinity, 50), // yaha height 50 kar di
                padding: EdgeInsets.symmetric(vertical: 14), // thoda extra padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // thoda rounded corners
                ),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ====== Support Hour Card Widget ======
  Widget _supportHourCard({
    required IconData icon,
    required String title,
    required String timing,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          timing,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
