import 'package:flutter/material.dart';
import '../models/user.dart';

// usuario en la lista 
class UserListItem extends StatelessWidget {
  final User user;
  final int index;

  const UserListItem({
    super.key,
    required this.user,
    required this.index,
  });

  // acá implemtente un color diferente para cada usuario 
  Color _getAvatarColor(int index) {
    final colors = [
      Colors.blue.shade600,
      Colors.purple.shade600,
      Colors.indigo.shade600,
      Colors.deepPurple.shade600,
      Colors.blueAccent.shade700,
      Colors.purpleAccent.shade700,
      Colors.blue.shade800,
      Colors.purple.shade800,
      Colors.indigo.shade800,
      Colors.deepPurple.shade800,
    ];
    
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: _getAvatarColor(index),
          radius: 25,
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            user.email,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
