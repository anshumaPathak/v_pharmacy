import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPrescriptionSection extends StatefulWidget {
  const UploadPrescriptionSection({super.key});

  @override
  State<UploadPrescriptionSection> createState() => _UploadPrescriptionSectionState();
}

class _UploadPrescriptionSectionState extends State<UploadPrescriptionSection> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages = [];

  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        _selectedImages = images;
      });
    }
  }

  Widget _buildUploadSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: const [
          Icon(Icons.upload_outlined, color: Color(0xFF1E293B), size: 20),
          SizedBox(width: 8),
          Text(
            'Upload Prescription *',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      GestureDetector(
        onTap: _pickImages,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(Icons.upload_outlined, color: Colors.grey[400], size: 48),
              const SizedBox(height: 16),
              const Text(
                'Click to upload prescription',
                style: TextStyle(fontSize: 15, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 8),
              Text(
                'Supports: JPG, PNG, PDF (Max 10MB)',
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),

      // ✅ Selected Images Preview
      if (_selectedImages != null && _selectedImages!.isNotEmpty)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _selectedImages!.map((img) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(img.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImages!.remove(img);
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildUploadSection();
  }
}
