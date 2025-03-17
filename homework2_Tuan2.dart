import 'package:flutter/material.dart';

void main() {
  runApp(ThuVienApp());
}

class ThuVienApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Thư viện',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuanLyThuVienScreen(),
    );
  }
}

class QuanLyThuVienScreen extends StatefulWidget {
  @override
  _QuanLyThuVienScreenState createState() => _QuanLyThuVienScreenState();
}

class _QuanLyThuVienScreenState extends State<QuanLyThuVienScreen> {
  List<NhanVien> danhSachNhanVien = [];
  List<Sach> danhSachSach = [];

  final tenNhanVienController = TextEditingController();
  final daiNhanVienController = TextEditingController();
  final tenSachController = TextEditingController();

  void themNhanVien() {
    setState(() {
      danhSachNhanVien.add(NhanVien(tenNhanVienController.text, daiNhanVienController.text));
      tenNhanVienController.clear();
      daiNhanVienController.clear();
    });
  }

  void themSach() {
    setState(() {
      danhSachSach.add(Sach(tenSachController.text));
      tenSachController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý Thư viện'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tenNhanVienController,
              decoration: InputDecoration(labelText: 'Tên nhân viên'),
            ),
            TextField(
              controller: daiNhanVienController,
              decoration: InputDecoration(labelText: 'Tuổi người mượn'),
            ),
            ElevatedButton(
              onPressed: themNhanVien,
              child: Text('Thêm nhân viên'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: tenSachController,
              decoration: InputDecoration(labelText: 'Tên sách'),
            ),
            ElevatedButton(
              onPressed: themSach,
              child: Text('Thêm sách'),
            ),
            SizedBox(height: 20),
            Text(
              'Danh sách nhân viên:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: danhSachNhanVien.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(danhSachNhanVien[index].toString()),
                  );
                },
              ),
            ),
            Text(
              'Danh sách sách:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: danhSachSach.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(danhSachSach[index].toString()),
                  );
                },/
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NhanVien {
  String ten;
  String tuoi;

  NhanVien(this.ten, this.tuoi);

  @override
  String toString() {
    return 'Nhân viên: $ten, Tuoi: $tuoi';
  }
}

class Sach {
  String tenSach;

  Sach(this.tenSach);

  @override
  String toString() {
    return 'Sách: $tenSach';
  }
}
