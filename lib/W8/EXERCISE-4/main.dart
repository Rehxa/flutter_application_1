import 'data/joke_data.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home: AllCards()));

class AllCards extends StatefulWidget {
  const AllCards({super.key});

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  void onFavorite(int index) {
    setState(() {
      if (jokes[index].isFavorite) {
        jokes[index].isFavorite = false;
      } else {
        for (var joke in jokes) {
          joke.isFavorite = false;
        }
        jokes[index].isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(
        children: [
          for (var i = 0; i < jokes.length; i++)
            FavoriteCard(index: i, onFavorite: () => onFavorite(i)),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.index,
    required this.onFavorite,
  });

  final int index;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokes[index].title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(jokes[index].joke),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              jokes[index].isFavorite ? Icons.favorite : Icons.favorite_border,
              color: jokes[index].isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
