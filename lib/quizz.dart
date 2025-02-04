import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  final List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctAnswer": 1,
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctAnswer": 2,
    },
    {
      "question": "Who is the founder of SpaceX?",
      "options": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctAnswer": 3,
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctAnswer": 0,
    },
    {
      "question": "Who is the founder of Meta?",
      "options": ["Steve Jobs", "Mark Zuckerberg", "Larry Page", "Elon Musk"],
      "correctAnswer": 1,
    },
  ];

  int currentIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0;
  bool questionPage = true;

  void checkAnswer(int answerIndex) {
    if (selectedAnswerIndex == -1) {
      if (answerIndex == allQuestions[currentIndex]['correctAnswer']) {
        score++;
      }
      selectedAnswerIndex = answerIndex;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(questionPage ? "Quiz App" : "Result"),
        backgroundColor: const Color.fromARGB(255, 228, 213, 244),
      ),
      body: questionPage ? buildQuestionPage() : buildResultPage(),
    );
  }

  Widget buildQuestionPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Question ${currentIndex + 1} of ${allQuestions.length}",
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 155, 15, 170)),
          ),
          const SizedBox(height: 20),
          Text(
            allQuestions[currentIndex]['question'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          ...List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedAnswerIndex == index
                      ? (index == allQuestions[currentIndex]['correctAnswer']
                          ? Colors.green
                          : Colors.red)
                      : const Color.fromARGB(255, 116, 85, 149),
                ),
                onPressed: () => checkAnswer(index),
                child: Text(
                  allQuestions[currentIndex]['options'][index],
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          }),
          const Spacer(),
          FloatingActionButton.extended(
            onPressed: () {
              if (selectedAnswerIndex != -1) {
                if (currentIndex < allQuestions.length - 1) {
                  currentIndex++;
                } else {
                  questionPage = false;
                }
                selectedAnswerIndex = -1;
                setState(() {});
              }
            },
            label: const Text("Next"),
            backgroundColor: const Color.fromARGB(255, 228, 213, 244),
          ),
        ],
      ),
    );
  }

  Widget buildResultPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events,
              size: 100, color: Color.fromARGB(255, 232, 194, 78)),
          const SizedBox(height: 20),
          const Text(
            "Congratulations!",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 155, 15, 170)),
          ),
          const SizedBox(height: 20),
          Text(
            "Your Score: $score / ${allQuestions.length}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentIndex = 0;
                score = 0;
                questionPage = true;
                selectedAnswerIndex = -1;
              });
            },
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
