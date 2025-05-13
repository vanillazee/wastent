import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'upload_waste_page.dart';
import 'jual_limbah_page.dart';



void main() {
  runApp(const FoodWasteApp());
}

class FoodWasteApp extends StatelessWidget {
  const FoodWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodWaste',
      theme: ThemeData(
        fontFamily: 'PLUSJAKARTASANS-LIGHT',
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const greenDark = Color(0xFF0C2E1B);

    // Atur warna status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: greenDark,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false, // ⬅️ Nonaktifkan padding atas
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tambahkan container agar status bar terisi warna hijau
            Container(
              height: MediaQuery.of(context).padding.top,
              color: greenDark,
            ),

            // Banner Hijau (Header + Banner)
            Container(
              decoration: const BoxDecoration(
                color: greenDark,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.account_circle,
                            color: Colors.white, size: 28),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text("Hello, Danu!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PLUSJAKARTASANS',
                                  fontSize: 18)),
                        ),
                        Image.asset(
                          'assets/images/icons/message.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  // Banner image
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/banner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Putih
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text("Menu",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'PLUSJAKARTASANS',
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 0),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          MenuTile(
                            title: "Jual \nLimbah",
                            imagePath: 'assets/images/icons/shoppingbag.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const JualLimbahPage(),
                                ),
                              );
                            },
                          ),

                          const MenuTile(
                            title: "Beli Limbah",
                            imagePath: 'assets/images/icons/shoppingcart.png',
                          ),
                          const MenuTile(
                            title: "Forum",
                            imagePath: 'assets/images/icons/forum.png',
                          ),
                          const MenuTile(
                            title: "Keranjang",
                            imagePath: 'assets/images/icons/basket.png',
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const MenuTile({
    super.key,
    required this.title, 
    required this.imagePath,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0C2E1B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PLUSJAKARTASANS',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                imagePath,
                width: 112,
                height: 112,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


