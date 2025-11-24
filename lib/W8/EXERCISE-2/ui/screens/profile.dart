import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../../data/profile_data.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(ronanProfile.avatarUrl),
            ),
            const SizedBox(height: 20),
            Text(
              ronanProfile.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              ronanProfile.position,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            for (var i = 0; i < ronanProfile.tiles.length; i++)
              ProfileTile(
                icon: ronanProfile.tiles[i].icon,
                title: ronanProfile.tiles[i].title,
                data: ronanProfile.tiles[i].value,
              ),

            for (var i = 0; i < ronanProfile.tiles.length; i++)
              ProfileTile(
                icon: ronanProfile.tiles[i].icon,
                title: ronanProfile.tiles[i].title,
                data: ronanProfile.tiles[i].value,
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
