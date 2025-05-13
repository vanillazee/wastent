import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UploadWastePage extends StatefulWidget {
  const UploadWastePage({super.key});

  @override
  State<UploadWastePage> createState() => _UploadWastePageState();
}

class _UploadWastePageState extends State<UploadWastePage> {
  final TextEditingController _dateController = TextEditingController();
  String? selectedCategory;
  String? selectedCleanliness;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xFFE6E6E6),
                child: Center(
                  child: _selectedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icons/upload.png',
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Unggah foto sisa makanan',
                              style: TextStyle(
                                color: Color(0xFF329B37),
                                fontFamily: 'PLUSJAKARTASANS',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : Image.file(
                          _selectedImage!,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const _TextField(label: 'Nama Produk'),
            const SizedBox(height: 12),
            const _TextField(label: 'Deskripsi Produk', maxLines: 2),
            const SizedBox(height: 12),

            // Kategori (Dropdown)
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Kategori'),
              value: selectedCategory,
              items: ['Kategori_1', 'Kategori_2', 'Kategori_3']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCategory = value),
            ),
            const SizedBox(height: 12),

            // Berat dan Tanggal
            Row(
              children: [
                const Expanded(child: _TextField(label: 'Berat (dalam kg)', keyboardType: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: _inputDecoration('Tanggal dihasilkan'),
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Kebersihan dan Umur tersisa
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Kebersihan'),
                    value: selectedCleanliness,
                    items: ['Kebersihan_1', 'Kebersihan_2', 'Kebersihan_3']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedCleanliness = value),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(child: _TextField(label: 'Umur tersisa (hari)', keyboardType: TextInputType.number)),
              ],
            ),
            const SizedBox(height: 12),
            const _TextField(label: 'Tingkat kelayakan'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF329B37),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Kirim logika
                },
                child: const Text(
                  'Unggah Produk',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PLUSJAKARTASANS',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        fontFamily: 'PLUSJAKARTASANS',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black,
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF329B37)),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextInputType? keyboardType;

  const _TextField({
    required this.label,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'PLUSJAKARTASANS',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
        border: const OutlineInputBorder(),
        floatingLabelStyle: const TextStyle(color: Color(0xFF329B37)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF329B37)),
        ),
      ),
    );
  }
}
