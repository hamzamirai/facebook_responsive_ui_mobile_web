import 'package:fb_responsive_ui_web_mb/config/palette.dart';
import 'package:fb_responsive_ui_web_mb/models/models.dart';
import 'package:fb_responsive_ui_web_mb/widgets/profile_avatar.dart';
import 'package:fb_responsive_ui_web_mb/widgets/widgets.dart';
import 'package:flutter/material.dart';

/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/14/2020
 */

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return new Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: new ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              User user = onlineUsers[index - 1];
              return new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: new ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new OutlineButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
      textColor: Palette.facebookBlue,
      child: new Row(
        children: <Widget>[
          // new ShaderMask(
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: new Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          new Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          new SizedBox(
            width: 4.0,
          ),
          new Text('Create\nRoom'),
        ],
      ),
    );
  }
}
