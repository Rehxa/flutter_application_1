import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(isFavorite: true),
          FavoriteCard(isFavorite: false),
          FavoriteCard(isFavorite: true),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.isFavorite});

  final bool isFavorite;

  Color get iconColor => isFavorite ? Colors.red : Colors.grey;

  IconData get icon => isFavorite ? Icons.favorite : Icons.favorite_border;

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
          IconButton(onPressed: () => {}, icon: Icon(icon), color: iconColor),
        ],
      ),
    );
  }
}
