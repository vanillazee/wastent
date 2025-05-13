import 'package:flutter/material.dart';

class UploadedWastePage extends StatelessWidget {
  const UploadedWastePage({super.key});

  final greenColor = const Color(0xFF329B37);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          WasteCard(
            image: 'assets/images/LimbahMakanan.png',
            title: 'Limbah Makanan',
            price: 'Rp10.000',
            stock: 'Stok 5 kg',
            sold: 'Terjual 10 kg',
          ),
          const SizedBox(height: 12),
          WasteCard(
            image: 'assets/images/LimbahSerabutKelapa.png',
            title: 'Limbah Sabut Kelapa',
            price: 'Rp15.000',
            stock: 'Stok 7 kg',
            sold: 'Terjual 13 kg',
          ),
          const SizedBox(height: 12),
          WasteCard(
            image: 'assets/images/LimbahAyamTiren.png',
            title: 'Limbah Ayam Tiren',
            price: 'Rp25.000',
            stock: 'Stok habis',
            sold: 'Terjual 20 kg',
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Tidak ada lainnya',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'PLUSJAKARTASANS',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WasteCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String stock;
  final String sold;

  const WasteCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.stock,
    required this.sold,
  });

  @override
  Widget build(BuildContext context) {
    final greenColor = const Color(0xFF329B37);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF5F5F5),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Gambar + info produk dalam satu baris
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Info teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'PLUSJAKARTASANS',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$price / kg',
                      style: const TextStyle(
                        fontFamily: 'PLUSJAKARTASANS',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.inventory_2_outlined, size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(stock, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 12),
                        const Icon(Icons.shopping_cart_outlined, size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(sold, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Tombol di bawah gambar+info
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
                    'Batalkan',
                    style: TextStyle(
                      fontFamily: 'PLUSJAKARTASANS',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Detail',
                    style: TextStyle(
                      fontFamily: 'PLUSJAKARTASANS',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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