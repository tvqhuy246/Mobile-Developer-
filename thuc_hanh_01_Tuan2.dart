import 'package:flutter/material.dart';

void main() {
  runApp(ThuVienApp());
}

class ThuVienApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thuc hanh 01',
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
  final tenNhanVienController = TextEditingController();
  final daiNhanVienController = TextEditingController();
  final tenSachController = TextEditingController();

  void themNhanVien() {
    setState(() {
      try {
        int tuoi = int.parse(daiNhanVienController.text);
        danhSachNhanVien.add(NhanVien(tenNhanVienController.text, tuoi));
        tenNhanVienController.clear();
        daiNhanVienController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Vui lòng nhập tuổi là số nguyên hợp lệ")),
        );
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thuc hanh 01'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tenNhanVienController,
              decoration: InputDecoration(labelText: 'Họ và tên'),
            ),
            TextField(
              controller: daiNhanVienController,
              decoration: InputDecoration(labelText: 'Tuổi'),
            ),
            ElevatedButton(
              onPressed: themNhanVien,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 20),
            Text(
              'Danh sách tên tuổi:',
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

          ],
        ),
      ),
    );
  }
}

class NhanVien {
  String ten;
  int tuoi;
  NhanVien(this.ten, this.tuoi);
  String phanloaituoi(){
    switch(tuoi){
      case <2 :
        return "Em Bé";
      case >=2 && <6:
        return "Trẻ em";
      case >=6 && <65:
        return "Người lớn";
      case >=65 :
        return "Người già";
      default:
        return "Không xác định";
    }
  }
  @override
  String toString() {

    return 'Họ và tên: $ten, Tuoi: $tuoi (${phanloaituoi()})';
  }
}

