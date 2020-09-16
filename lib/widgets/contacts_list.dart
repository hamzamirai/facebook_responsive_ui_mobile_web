import 'dart:ui';

import 'package:fb_responsive_ui_web_mb/models/models.dart';
import 'package:fb_responsive_ui_web_mb/widgets/user_card.dart';
import 'package:flutter/material.dart';

/// Created By Hamza Chaouki [DevHcH].
/// 9/16/2020

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                child: new Text(
                  'Contacts',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              new Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8.0,
              ),
              new Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          new Expanded(
            child: new ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(
                    user: user,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
