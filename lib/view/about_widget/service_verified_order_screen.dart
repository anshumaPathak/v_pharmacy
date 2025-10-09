import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

class ServiceVerifiedOrderScreen extends StatefulWidget {
  const ServiceVerifiedOrderScreen({super.key});

  @override
  State<ServiceVerifiedOrderScreen> createState() => _ServiceVerifiedOrderScreenState();
}

class _ServiceVerifiedOrderScreenState extends State<ServiceVerifiedOrderScreen> {
  bool isBarcodeScannerSelected = true;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Sizes.screenWidth*0.08),
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
              height: 200,
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isBarcodeScannerSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isBarcodeScannerSelected ? Colors.blue : Colors.white,
                        foregroundColor:
                        isBarcodeScannerSelected ? Colors.white : Colors.black,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.qr_code_scanner),
                          SizedBox(height: 4),
                          Text("Barcode Scanner"),
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
                        backgroundColor:
                        isBarcodeScannerSelected ? Colors.white : Colors.blue,
                        foregroundColor:
                        isBarcodeScannerSelected ? Colors.black : Colors.white,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(height: 4),
                          Text("Manual Entry"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Barcode Scanner or Manual Entry Input
            isBarcodeScannerSelected
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Barcode Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter barcode number or scan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        // Add barcode scanner logic
                      },
                    ),
                  ),
                ),
              ],
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
