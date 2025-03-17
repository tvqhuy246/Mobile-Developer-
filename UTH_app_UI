import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      home: PageOne(),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),automaticallyImplyLeading: false),
      body: PageBody(
        imagePath: 'assets/uth_logo.png',
        secondImagePath: 'assets/uth_smarttasks.png',
        description: '',
      ),
      bottomNavigationBar: BottomButtons(
        onNext: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo())),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageFour()),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent, // Màu chữ cho dễ nhìn
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      ),
      body: PageBody(
        imagePath: 'assets/Frame 56.png',
        description: 'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first ',
      ),
      bottomNavigationBar: BottomButtons(
        onBack: () => Navigator.pop(context),
        onNext: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageThree())),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3'), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageFour()),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent, // Màu chữ cho dễ nhìn
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],),
      body: PageBody(
        imagePath: 'assets/Frame 57.png',
        description: 'Time management and the determination of more important tasks will give your job statistics better and always improve',
      ),
      bottomNavigationBar: BottomButtons(
        onBack: () => Navigator.pop(context),
        onNext: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageFour())),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 4'), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageFour()),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent, // Màu chữ cho dễ nhìn
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],),
      body: PageBody(
        imagePath: 'assets/Frame 58.png',
        description: 'The advantage of this application is that it also provides reminders for you so you dont forget to keep doing your assignments well and according to the time you have set',
      ),
      bottomNavigationBar: BottomButtons(
        onBack: () => Navigator.pop(context),
      ),
    );
  }
}

// Widget for Bottom Navigation Buttons
class BottomButtons extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;

  BottomButtons({this.onBack, this.onNext});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (onBack != null)
              ElevatedButton(onPressed: onBack, child: Text('Back')),
            if (onNext != null)
              ElevatedButton(onPressed: onNext, child: Text('Next')),
          ],
        ),
      ),
    );
  }
}

// Widget to display an image and description in the center
class PageBody extends StatelessWidget {
  final String imagePath;
  final String? secondImagePath; // Hình thứ hai có thể có hoặc không
  final String description;

  PageBody({required this.imagePath, this.secondImagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
          if (secondImagePath != null) ...[ // Nếu có hình thứ hai thì hiển thị
            SizedBox(height: 20),
            Image.asset(
              secondImagePath!,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ],
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
