import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Login.dart';
import 'package:quizapp/QuizzPage.dart';
import 'package:quizapp/quiz.dart';

class MyHomepPge extends StatelessWidget {
  const MyHomepPge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome To Tech-Quizzz", style: TextStyle(fontSize: 22)),
        ),
        leading: InkWell(
          child: Icon(Icons.logout),
          onTap: () async {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed('/login');
          },
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
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        QuizzPage(category: QuizzCategory.category[index]),
                  ),
                );
              },
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
