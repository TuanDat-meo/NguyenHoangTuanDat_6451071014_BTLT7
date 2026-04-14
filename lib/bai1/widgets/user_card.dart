import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;

  const UserCard({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(email),
    );
  }
}