import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/jetpackCompose.png',
                      width: 150,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Jetpack Compose',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  child: Text(
                    "I'm ready",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Poppins', // Viết đúng font
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget sectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

/// Widget tạo một ô chứa với tiêu đề và mô tả
Widget customContainer(
    String title,
    String subtitle, {
      Color borderColor = Colors.blue,
    }) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      color: Colors.lightGreen[100],
      border: Border.all(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('UI Components List',
               style: TextStyle(
              color: Colors.blue, // Đổi màu chữ tại đây
              fontWeight: FontWeight.bold,), // (Tuỳ chọn) In đậm chữ
            ),
        ],
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("Display"),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer("Text", "Displays text"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer("Image", "Displays an image"),
              ),

              sectionTitle("Input"),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer("TextField", "Input field for text"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer(
                  "PasswordField",
                  "Input field for passwords",
                ),
              ),

              sectionTitle("Layout"),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer(
                  "Column",
                  "Arranges elements vertically",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformScreen()),
                  );
                },
                child: customContainer("Row", "Arranges elements horizontally"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Center(child: Text('Text Details',
                    style: TextStyle(
                      color: Colors.blue, // Đổi màu chữ tại đây
                      fontWeight: FontWeight.bold,),),
      ),
                ],
              ),
            ],
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset('assets/image_2.png'),
            ),
          ],
        ),
      ),
    );
  }
}
