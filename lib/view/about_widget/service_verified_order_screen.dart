import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

class ServiceVerifiedOrderScreen extends StatefulWidget {
  const ServiceVerifiedOrderScreen({super.key});

  @override
  State<ServiceVerifiedOrderScreen> createState() =>
      _ServiceVerifiedOrderScreenState();
}

class _ServiceVerifiedOrderScreenState
    extends State<ServiceVerifiedOrderScreen> {
  bool isBarcodeScannerSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Check if your medicine is genuine, expired, or counterfeit using our verification system.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),

          // Verification Method Switch (Tabs)
          Container(
            height: 180, // Container height same rakhi
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // color white
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // halka shadow
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify Method",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Sizes.screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isBarcodeScannerSelected = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBarcodeScannerSelected ? Colors.blue : Colors.white,
                          foregroundColor: isBarcodeScannerSelected ? Colors.white : Colors.black,
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              size: 32,
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Barcode Scanner",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isBarcodeScannerSelected = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBarcodeScannerSelected ? Colors.white : Colors.blue,
                          foregroundColor: isBarcodeScannerSelected ? Colors.black : Colors.white,
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, size: 32),
                            const SizedBox(height: 6),
                            const Text(
                              "Manual Entry",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          const SizedBox(height: 30),

          // Barcode Scanner or Manual Entry Input
          isBarcodeScannerSelected
              ? Container(
            height: 300,
            width: Sizes.screenWidth,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // color white
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // halka shadow
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                         child: Text(
                          "Barcode Scanner",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),
                                               ),
                       ),
                      const SizedBox(height: 8),
                    Text("Barcode Number"),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints:  BoxConstraints(
                          minWidth: Sizes.screenWidth,
                          maxWidth: Sizes.screenWidth,
                          minHeight: 50,
                          maxHeight: 50,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter barcode number or scan",
                            filled: true,
                            fillColor: Colors.grey[200], // light grey background
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none, // removes the default border
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.camera_alt, color: Colors.blue),
                              onPressed: () {
                                // Add barcode scanner logic here
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DottedBorder(

                        child: Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.qr_code_scanner, size: 40, color: Colors.blue),
                              SizedBox(height: 8),
                              Text(
                                "Point your camera at the barcode\nor enter the number manually",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Medicine Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter code manually",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
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

