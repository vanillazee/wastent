import 'package:flutter/material.dart';
import 'upload_waste_page.dart';
import 'uploaded_waste_page.dart';

class JualLimbahPage extends StatelessWidget {
  const JualLimbahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Jual Limbah',
            style: TextStyle(
              fontFamily: 'PLUSJAKARTASANS',
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: const TabBar(
            labelColor: Color(0xFF329B37),
            unselectedLabelColor: Colors.black,
            indicatorColor: Color(0xFF329B37),
            labelStyle: TextStyle(
              fontFamily: 'PLUSJAKARTASANS',
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(text: 'Unggah baru'),
              Tab(text: 'Barang terunggah'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UploadWastePage(),
            UploadedWastePage(), // Anda akan buat halaman ini
          ],
        ),
      ),
    );
  }
}
