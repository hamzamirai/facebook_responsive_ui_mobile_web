import 'package:flutter/material.dart';

/// Created By Hamza Chaouki [DevHcH].
/// 9/14/2020

class CircleButton extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: new IconButton(
        icon: new Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
