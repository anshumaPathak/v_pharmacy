import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class ServiceOrderProcess extends StatefulWidget {
  const ServiceOrderProcess({super.key});

  @override
  State<ServiceOrderProcess> createState() => _ServiceOrderProcessState();
}

class _ServiceOrderProcessState extends State<ServiceOrderProcess> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: isMobile
                            ? MediaQuery.of(context).size.width * 1.3
                            : 780,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color(0xffeff6ff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.orderProcess,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildProcessStep(
                              number: '1',
                              text: AppLocalizations.of(context)!.step1,
                            ),
                            const SizedBox(height: 16),
                            _buildProcessStep(
                              number: '2',
                              text: AppLocalizations.of(context)!.step2,
                            ),
                            const SizedBox(height: 16),
                            _buildProcessStep(
                              number: '3',
                              text: AppLocalizations.of(context)!.step3,
                            ),
                            const SizedBox(height: 16),
                            _buildProcessStep(
                              number: '4',
                              text: AppLocalizations.of(context)!.step4,
                            ),
                            const SizedBox(height: 16),
                            _buildProcessStep(
                              number: '5',
                              text: AppLocalizations.of(context)!.step5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _buildHelpSection(isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHelpSection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.needHelp,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xff1e293b),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.helpDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff64748b),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Add WhatsApp support action
                },
                icon: const Icon(Icons.chat_bubble_outline),
                label: Text(AppLocalizations.of(context)!.whatsappSupport),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff25d366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // Add call support action
                },
                icon: const Icon(Icons.phone_outlined),
                label: Text(AppLocalizations.of(context)!.callSupport),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xff1e293b),
                  side: const BorderSide(color: Color(0xffe2e8f0)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                '${AppLocalizations.of(context)!.whatsappNumber}: +1-234-567-8900',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748b),
                ),
              ),

              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.phoneNumber,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748b),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.available247,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748b),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep({required String number, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
