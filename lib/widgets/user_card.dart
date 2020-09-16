import 'package:fb_responsive_ui_web_mb/models/models.dart';
import 'package:fb_responsive_ui_web_mb/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

/// Created By Hamza Chaouki [DevHcH].
/// 9/16/2020

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imageUrl: user.imageUrl,
          ),
          const SizedBox(
            width: 6.0,
          ),
          new Flexible(
            child: new Text(
              user.name,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
