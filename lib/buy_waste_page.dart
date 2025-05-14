import 'package:flutter/material.dart';

class BuyWastePage extends StatefulWidget {
  const BuyWastePage({super.key});

  @override
  State<BuyWastePage> createState() => _BuyWastePageState();
}

class _BuyWastePageState extends State<BuyWastePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedCategory;

  final List<String> categories = [
    'Kategori_1',
    'Kategori_2',
    'Kategori_3',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final greenColor = const Color(0xFF329B37);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Limbah',
          style: TextStyle(fontFamily: 'PLUSJAKARTASANS'),
        ),
        leading: const BackButton(),
        bottom: TabBar(
          controller: _tabController,
          labelColor: greenColor,
          unselectedLabelColor: Colors.black54,
          indicatorColor: greenColor,
          tabs: const [
            Tab(text: 'Buat permintaan'),
            Tab(text: 'Tersedia'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Buat Permintaan
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: ListView(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.list),
                  ),
                  value: selectedCategory,
                  items: categories.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(height: 12),
                _buildInputField('Jumlah Kebutuhan (dalam kg)'),
                _buildInputField('Tujuan Penggunaan'),
                _buildInputField('Lokasi Penerima'),
                _buildInputField('Frekuensi Kebutuhan'),
                _buildInputField('Kondisi'),
                _buildInputField('Batas Waktu'),
                _buildInputField('Catatan Tambahan', hint: 'Tulis Catatan'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Ajukan Permintaan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PLUSJAKARTASANS',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tab Tersedia
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: ListView(
              children: [
                _buildAvailableCard(
                  image: 'assets/images/LimbahMakanan.png',
                  title: 'Limbah Makanan',
                  price: 'Rp10.000 / kg',
                  stock: 'Stok 5 kg',
                  sold: 'Terjual 10 kg',
                  detailInfo: {
                    'Deskripsi': 'Makanan yang tidak dikonsumsi dan dibuang',
                    'Berat': '5 kg',
                    'Tanggal dihasilkan': '10 Mei 2025',
                    'Kebersihan': 'Cukup',
                    'Umur tersisa': '3 hari',
                  },
                ),
                const SizedBox(height: 12),
                _buildAvailableCard(
                  image: 'assets/images/LimbahSerabutKelapa.png',
                  title: 'Limbah Sabut Kelapa',
                  price: 'Rp15.000 / kg',
                  stock: 'Stok 7 kg',
                  sold: 'Terjual 13 kg',
                ),
                const SizedBox(height: 12),
                _buildAvailableCard(
                  image: 'assets/images/LimbahAyamTiren.png',
                  title: 'Limbah Ayam Tiren',
                  price: 'Rp25.000 / kg',
                  stock: 'Stok habis',
                  sold: 'Terjual 20 kg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, {String? hint}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildAvailableCard({
    required String image,
    required String title,
    required String price,
    required String stock,
    required String sold,
    Map<String, String>? detailInfo,
  }) {
    final greenColor = const Color(0xFF329B37);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PLUSJAKARTASANS',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(price),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.inventory_2_outlined, size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(stock),
                        const SizedBox(width: 12),
                        const Icon(Icons.shopping_cart_outlined, size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(sold),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Hubungi Penjual',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: detailInfo != null
                      ? () => _showDetailModal(image, title, detailInfo)
                      : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Detail', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showDetailModal(String image, String title, Map<String, String> detailInfo) {
    final greenColor = const Color(0xFF329B37);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Produk: $title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...detailInfo.entries.map((e) => Text('${e.key}: ${e.value}')),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                      
                    ),
                    child: const Text('Tolak'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: greenColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Terima'),
                  ),
                ),
              ],
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
