import 'package:fb_responsive_ui_web_mb/models/models.dart';
import 'package:fb_responsive_ui_web_mb/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Created By Hamza Chaouki [DevHcH].
/// 9/14/2020

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return new Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      elevation: isDesktop ? 1.0 : 0.0,
      child: new Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                ),
                new SizedBox(
                  width: 8.0,
                ),
                new Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            new Container(
              height: 40.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: new Text('Live'),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  FlatButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: new Text('Photo'),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  FlatButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(Icons.video_call,
                        color: Colors.purpleAccent),
                    label: new Text('Room'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
