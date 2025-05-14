import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final greenColor = const Color(0xFF329B37);

    final List<Map<String, dynamic>> posts = [
      {
        'name': 'Ulin',
        'time': '3 hari yang lalu',
        'title': 'Pemanfaatan limbah makanan',
        'content': 'Limbah makanan bisa diolah menjadi apa ya?',
        'comments': 10,
        'likes': 35,
      },
      {
        'name': 'Reza',
        'time': '3 hari yang lalu',
        'title': 'Ampas tahu',
        'content': 'ada saran gak ampas tahu bisa dibikin apa aja?',
        'comments': 6,
        'likes': 2,
      },
      {
        'name': 'Nyamuk',
        'time': '5 hari yang lalu',
        'title': 'Ampas tahu',
        'content': 'ada saran gak ampas tahu bisa dibikin apa aja?',
        'comments': 7,
        'likes': 15,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forum',
          style: TextStyle(fontFamily: 'PLUSJAKARTASANS'),
        ),
        leading: const BackButton(),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi buat postingan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Buat postingan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PLUSJAKARTASANS',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: greenColor,
                                  ),
                                ),
                                Text(
                                  post['time'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: greenColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(post['content']),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.comment, size: 18),
                            const SizedBox(width: 4),
                            Text('${post['comments']}'),
                            const SizedBox(width: 12),
                            const Icon(Icons.favorite, size: 18),
                            const SizedBox(width: 4),
                            Text('${post['likes']}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
