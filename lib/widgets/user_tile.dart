import 'package:flutter/material.dart';
import 'package:whuser/models/user_model.dart';

class UserTile extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;
  const UserTile({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.picture.large)),
      title: Text(user.name.first),
      subtitle: Text('${user.location.city}, ${user.location.country} • ${user.email}'),
      onTap: onTap,
    );
  }
}
