import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TaskScreen()));
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Future<List<dynamic>> fetchTasks() async {
    final response =
    await http.get(Uri.parse("https://amock.io/api/researchUTH/task"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is Map<String, dynamic> && data.containsKey("data")) {
        final taskData = data["data"];

        if (taskData is List) {
          return taskData;
        }

        if (taskData is Map<String, dynamic> &&
            taskData.containsKey("subtasks") &&
            taskData["subtasks"] is List) {
          return taskData["subtasks"];
        }
      }
      return [];
    } else {
      throw Exception("Lỗi kết nối: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách Subtasks")),
      body: FutureBuilder<List<dynamic>>(
        future: fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return EmptyView(); // Gọi trang trống khi không có dữ liệu
          } else {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index] as Map<String, dynamic>;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(task: task),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.primaries[index % Colors.primaries.length],
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        task["title"] ?? "Không có tiêu đề",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(task["isCompleted"] == true
                          ? "Hoàn thành"
                          : "Chưa xong"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Widget hiển thị trang trống
class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "Không có dữ liệu!",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Màn hình chi tiết
class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> task;

  DetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết Subtask")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task["title"] ?? "Không có tiêu đề",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              task["isCompleted"] == true ? "Hoàn thành" : "Chưa xong",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "Mô tả: ${task["description"] ?? "Không có mô tả"}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
