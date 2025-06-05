import 'package:flutter/material.dart';
import 'package:quizapp/MyHomePage.dart';

class attempts extends StatefulWidget {
  final Map<String, num> scoresMap;
  const attempts({super.key, required this.scoresMap});

  @override
  State<attempts> createState() => _attemptsState();
}

class _attemptsState extends State<attempts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Attempts")),
      body: ListView.builder(
        itemCount: widget.scoresMap.length,
        itemBuilder: (context, index) {
          String key = widget.scoresMap.keys.elementAt(index);
          num value = widget.scoresMap[key]!;
          return ListTile(
            title: Text('$key'),
            trailing: Text('Score: $value'),
            leading: value < -1 ? Icon(Icons.link) : Icon(Icons.star),
          );
        },
      ),
      bottomSheet: Text(
        "If You See Link Then You Have To Better In That Subject Either You Are Better In That Subject",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
