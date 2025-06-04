class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuestionBank {
  static Map<String, List<Question>> questionsByCategory = {
    "Java": [
      Question(
        question: "What is JVM?",
        options: [
          "Java Virtual Machine",
          "Java Vendor Machine",
          "Java Visual Method",
          "Joint Visual Module",
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Which keyword is used to inherit a class in Java?",
        options: ["this", "super", "extends", "implements"],
        correctAnswerIndex: 2,
      ),
      Question(
        question: "Which method is the entry point of a Java program?",
        options: ["main()", "start()", "run()", "init()"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What does 'final' keyword mean in Java?",
        options: [
          "Variable can't be changed",
          "Method can be overridden",
          "Class can be extended",
          "None",
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Which of these is not a Java access modifier?",
        options: ["public", "private", "protected", "friendly"],
        correctAnswerIndex: 3,
      ),
      Question(
        question: "Which package contains the Scanner class?",
        options: ["java.util", "java.io", "java.net", "java.lang"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Which operator is used to compare two values?",
        options: ["=", "==", "===", "!"],
        correctAnswerIndex: 1,
      ),
    ],

    "Python": [
      Question(
        question: "What is the output of print(2 ** 3)?",
        options: ["6", "8", "9", "Error"],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Which data type is immutable?",
        options: ["List", "Set", "Tuple", "Dictionary"],
        correctAnswerIndex: 2,
      ),
      Question(
        question: "Which keyword is used for a function in Python?",
        options: ["function", "fun", "def", "define"],
        correctAnswerIndex: 2,
      ),
      Question(
        question: "What is the output of print(len('hello'))?",
        options: ["4", "5", "6", "Error"],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "How do you insert comments in Python?",
        options: [
          "// comment",
          "/* comment */",
          "# comment",
          "<!-- comment -->",
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        question: "What is the data type of: [1, 2, 3]?",
        options: ["Set", "List", "Tuple", "Dictionary"],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Which of the following is a loop structure in Python?",
        options: ["for", "do", "repeat", "next"],
        correctAnswerIndex: 0,
      ),
    ],
  };
}
