import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/AdminPage.dart';
import 'package:quizapp/Login.dart';
import 'package:quizapp/Profile.dart';
import 'package:quizapp/QuizAttempt.dart';
import 'package:quizapp/QuizzPage.dart';
import 'package:quizapp/quiz.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/Logos.dart';
import 'MyHomePage.dart' as QuizzPageState;

class MyHomepPge extends StatefulWidget {
  const MyHomepPge({super.key});

  @override
  State<MyHomepPge> createState() => _MyHomepPgeState();
}

int count = 0;

class _MyHomepPgeState extends State<MyHomepPge> {
  final user = FirebaseAuth.instance.currentUser;

  Map<String, num> mpp = {};

  @override
  Widget build(BuildContext context) {
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
              leading: const Icon(Icons.abc_sharp),
              title: const Text("Quizz Attempted"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => attempts(scoresMap: mpp),
                  ),
                );
              },
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hardcoded categories list
            const Text(
              "Predefined Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: QuizzCategory.category.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final cat = QuizzCategory.category[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(cat, style: const TextStyle(fontSize: 16)),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(getImageFromCategory(cat)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      setState(() {
                        mpp[cat] = QuizzPageState.count;
                        print(mpp.keys);
                        print(mpp.values);
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizzPage(category: cat),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // Firebase categories
            const Text(
              "Categories from Firebase",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('category')
                  .doc('wCptW2h5Y5newUCknf4T')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(child: Text("Category not found"));
                }

                final data = snapshot.data!.data()! as Map<String, dynamic>;
                final categoryName = data['category'] ?? "Unknown";

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      categoryName,
                      style: const TextStyle(fontSize: 16),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        getImageFromCategory(categoryName),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      setState(() {
                        mpp[categoryName] = QuizzPageState.count;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizzPage(category: categoryName),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          (user != null && user?.email?.toLowerCase() == 'admin@gmail.com')
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminPage(adminEmail: "admin@example.com"),
                  ),
                );
              },
              child: const Icon(Icons.admin_panel_settings),
              tooltip: 'Admin Panel',
            )
          : null,
    );
  }
}
