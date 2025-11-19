import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavoriteCard(), FavoriteCard(), FavoriteCard()]),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  Color get iconColor => isFavorite ? Colors.red : Colors.grey;

  IconData get icon => isFavorite ? Icons.favorite : Icons.favorite_border;

  void onFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text("description"),
              ],
            ),
          ),
          IconButton(onPressed: onFavorite, icon: Icon(icon), color: iconColor),
        ],
      ),
    );
  }
}
