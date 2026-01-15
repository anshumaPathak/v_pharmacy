import 'package:flutter/material.dart';

class OurValuesSection extends StatelessWidget {
  const OurValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          const Text(
            'Our Values',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'The principles that guide everything we do',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Quality Assurance
              _buildValueCard(
                icon: Icons.shield_outlined,
                title: 'Quality Assurance',
                description:
                'Every medicine undergoes rigorous quality checks and verification processes to ensure safety and efficacy.',
              ),
              const SizedBox(width: 24),
              // Patient Care
              _buildValueCard(
                icon: Icons.favorite_border,
                title: 'Patient Care',
                description:
                'We prioritize patient well-being above all else, providing compassionate and reliable healthcare services.',
              ),
              const SizedBox(width: 24),
              // Reliability
              _buildValueCard(
                icon: Icons.check_circle_outline,
                title: 'Reliability',
                description:
                'Trusted by thousands of customers, we maintain the highest standards of service and delivery.',
              ),
              const SizedBox(width: 24),
              // Accessibility
              _buildValueCard(
                icon: Icons.schedule,
                title: 'Accessibility',
                description:
                '24/7 availability ensures you can access healthcare services whenever you need them.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Expanded(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEEBFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF2563EB),
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF64748B),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
