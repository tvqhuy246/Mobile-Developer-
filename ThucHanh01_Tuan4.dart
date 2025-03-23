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
                      'Navigation',
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
                        'is a framework that simplifies the implementation of navigation between different UI components (activities, fragments, or composables) in an app',
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
                    "PUSH",
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
  final List<Map<String, String>> items = [
    {"title": "01", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
    {"title": "02", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
    {"title": "03", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
    {"title": "04", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
    {"title": "05", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
    {"title": "1000000", "subtitle": "The only way to do great work is to love what you do.", "category": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LazyColumn',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 || items[index - 1]["category"] != item["category"])
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    item["category"]!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformScreen(title: item["title"]!),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(item["title"]!),
                    subtitle: Text(item["subtitle"]!),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class InformScreen extends StatelessWidget {
  final String title;
  InformScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '$title Details',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "The only way to do great work is to love what you do $title.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/image 4.png'),
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
                  "BACK TO ROOT",
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
    );
  }
}
