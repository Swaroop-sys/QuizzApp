import 'package:flutter/material.dart';
import 'Questions.dart';

class QuizzPage extends StatefulWidget {
  final String category;

  const QuizzPage({super.key, required this.category});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    final questions = QuestionBank.questionsByCategory[widget.category];
    int count = 0;
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} Quiz")),
      body: questions == null
          ? Center(child: Text("No questions available for ${widget.category}"))
          : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q${index + 1}. ${q.question}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...List.generate(q.options.length, (i) {
                          return ListTile(
                            title: Text(q.options[i]),
                            leading: Icon(Icons.circle_outlined),
                            onTap: () {
                              final isCorrect = i == q.correctAnswerIndex;
                              setState(() {
                                if (isCorrect) {
                                  count++;
                                }
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isCorrect
                                        ? "Correct!    Score: $count"
                                        : "Wrong!",
                                  ),
                                  backgroundColor: isCorrect
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
