import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xffA9D453),
      body: Center(
        widthFactor: double.infinity,
        heightFactor: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: [
              ScoreCard(title: "My Score in Dart", initialScore: 3),
              ScoreCard(title: "My Score in Flutter", initialScore: 6),
              ScoreCard(title: "My Score in Firebase", initialScore: 9),
            ],
          ),
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key, required this.title, required this.initialScore});

  final String title;
  final int initialScore;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  int get flexBar => score;
  int get barWhiteSpace => 10 - score;

  Color get color {
    if (score >= 0 && score <= 3) {
      return Colors.red;
    } else if (score >= 4 && score <= 6) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  void onAdd() {
    setState(() {
      score++;
      if (score > 10) {
        score = 10;
      }
    });
  }

  void onMinus() {
    setState(() {
      score--;
      if (score < 0) {
        score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff9E9E9E),
              fontSize: 35,
            ),
          ),

          Text(
            "$score",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff9E9E9E),
              fontSize: 20,
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: onMinus, icon: Icon(Icons.minimize)),
              IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            ],
          ),

          SizedBox(height: 20),

          Container(
            clipBehavior: Clip.hardEdge,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: flexBar,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: color,
                    ),
                  ),
                ),
                Expanded(
                  flex: barWhiteSpace,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
