import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Information'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Hiển thị hình ảnh
              Image.asset(
                'assets/profile_image.png', // Đường dẫn đến hình ảnh
                width: 100, // Chiều rộng của hình ảnh
                height: 100, // Chiều cao của hình ảnh
              ),
              SizedBox(height: 20), // Khoảng cách giữa hình ảnh và văn bản
              Text(
                'Trần Võ Quang Huy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'TPHCM, Việt Nam',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}