import 'package:flutter/material.dart';
import 'package:v_pharmashing/res/const_color.dart';
import 'package:v_pharmashing/res/sizing_const.dart';

class ServiceVerifiedOrderScreen extends StatefulWidget {
  const ServiceVerifiedOrderScreen({super.key});

  @override
  State<ServiceVerifiedOrderScreen> createState() =>
      _ServiceVerifiedOrderScreenState();
}

class _ServiceVerifiedOrderScreenState
    extends State<ServiceVerifiedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Center(
        child: Container(
          width: screenWidth < 800 ? screenWidth * 0.9 : 800,
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04,
            horizontal: screenWidth * 0.05,
          ),
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.hourglass_top,
                size: screenWidth * 0.12,
                color: Colors.white,
              ),
              SizedBox(height: screenWidth * 0.05),
              Text(
                "Coming Soon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
