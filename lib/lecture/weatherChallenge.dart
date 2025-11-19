import 'package:flutter/material.dart';

enum Seasons {
  summer(image: "assets/weather/summer.JPG"),
  autumn(image: "assets/weather/autumn.JPG"),
  winter(image: "assets/weather/winter.JPG"),
  spring(image: "assets/weather/spring.JPG");

  final String image;
  const Seasons({required this.image});
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SEASONS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SeasonCard(country: "Frence", currentSeason: Seasons.winter),
                  SeasonCard(
                    country: "Cambodia",
                    currentSeason: Seasons.summer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key,
    required this.country,
    required this.currentSeason,
  });

  final String country;
  final Seasons currentSeason;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Seasons season;
  late int index;

  @override
  void initState() {
    super.initState();
    season = widget.currentSeason;
    index = Seasons.values.indexOf(widget.currentSeason);
  }

  // late int index;
  int get inde => Seasons.values.indexOf(widget.currentSeason);

  String get image => Seasons.values[index].image;

  void onSeason() {
    setState(() {
      index++;
      if (index > Seasons.values.length - 1) {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSeason,
      child: Container(
        height: 400,
        width: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Image.asset(image),
            SizedBox(height: 10),
            Text(
              widget.country,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
