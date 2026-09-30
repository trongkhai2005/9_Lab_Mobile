import 'package:flutter/material.dart';

void main() {
  runApp(const IAmRichApp());
}

class IAmRichApp extends StatelessWidget {
  const IAmRichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Bỏ AppBar để ảnh và chữ chiếm trọn không gian
        body: Stack(
          children: [
            // Lớp 1: Hình ảnh nền (Nằm dưới cùng)
            Image(
              image: const AssetImage('images/diamond.png'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // Lớp 2: Chữ (Nằm đè lên trên ảnh)
            const Center(
              child: Text(
                'I Am Rich',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  // Thêm bóng đổ để chữ nổi bật hơn trên nền ảnh
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
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