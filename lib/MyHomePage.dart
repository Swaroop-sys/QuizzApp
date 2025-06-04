import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Login.dart';
import 'package:quizapp/Profile.dart';
import 'package:quizapp/QuizzPage.dart';
import 'package:quizapp/quiz.dart';

class MyHomepPge extends StatelessWidget {
  const MyHomepPge({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Welcome To Tech-Quizzz", style: TextStyle(fontSize: 22)),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  user?.photoURL ??
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                ),
              ),
              accountName: Text(
                user?.displayName ?? "Tech Learner",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(user?.email ?? "No Email"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My Profile"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // TODO: Settings screen
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: QuizzCategory.category.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                QuizzCategory.category[index],
                style: const TextStyle(fontSize: 16),
              ),
              leading: const Icon(Icons.question_answer),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        QuizzPage(category: QuizzCategory.category[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
