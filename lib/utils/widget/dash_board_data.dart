import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../../l10n/app_localizations.dart';
import '../../res/const_color.dart';
import '../../res/sizing_const.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final isMobile = screen.width < 800;

    return Container(
      width: double.infinity,
      height: isMobile ? null : 700, // auto height for mobile
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 0,
      ),
      decoration: BoxDecoration(color: AppColor.lightBlueColor),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DashboardTextSection(isMobile: isMobile),
          DashboardImageSection(isMobile: isMobile),
        ],
      ),
    );
  }
}

class DashboardTextSection extends StatelessWidget {
  final bool isMobile;
  const DashboardTextSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    Widget content = Padding(
      padding: EdgeInsets.symmetric(horizontal: screen.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
          AppLocalizations.of(context)!.yourTrusted,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          Text(
        AppLocalizations.of(context)!.medicinePartner,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 20),
          Text(
             AppLocalizations.of(context)!.orderVerifiedMedicinesTrackDeliver,
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              color: Colors.black54,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                height: screen.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.blueColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_shopping_cart_sharp,
                        color: AppColor.whiteColor),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalizations.of(context)!.orderMedicine,
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                height: screen.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.whiteColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.learnMore,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              ...List.generate(
                5,
                    (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
               Text(
                "4.9 / 5 ${AppLocalizations.of(context)!.rating}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return isMobile ? content : Expanded(flex: 1, child: content);
  }
}

class DashboardImageSection extends StatelessWidget {
  final bool isMobile;
  const DashboardImageSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    Widget content = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screen.width * 0.08, vertical: screen.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 10), // shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            Assets.assetsGirl,
            fit: BoxFit.cover,
            height: isMobile ? screen.height * 0.35 : null,
          ),
        ),
      ),
    );

    return isMobile ? content : Expanded(flex: 1, child: content);
  }
}

