import 'package:flutter/material.dart';
import 'package:quizapp/QuizzCategory.dart';

class MyHomepPge extends StatelessWidget {
  const MyHomepPge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome To Tech-Quizzz", style: TextStyle(fontSize: 22)),
        ),
      ),
      body: Material(
        child: ListView.separated(
          itemCount: QuizzCategory.category.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(QuizzCategory.category[index]),
              leading: Icon(Icons.question_answer),
              trailing: Icon(Icons.arrow_forward_ios),
              tileColor: Colors.white, // Optional: gives each tile a background
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: 12), // 👈 space between tiles
          padding: EdgeInsets.all(16), // Optional: outer padding
        ),
      ),
    );
  }
}
