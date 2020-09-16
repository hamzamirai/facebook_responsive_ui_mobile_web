import 'package:fb_responsive_ui_web_mb/config/palette.dart';
import 'package:fb_responsive_ui_web_mb/data/data.dart';
import 'package:fb_responsive_ui_web_mb/models/models.dart';
import 'package:fb_responsive_ui_web_mb/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: slash_for_doc_comments
/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/14/2020
 */

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: new Scaffold(
          body: new Responsive(
        mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
        desktop:
            _HomeScreenDesktop(scrollController: _trackingScrollController),
      )),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {

  final TrackingScrollController scrollController;

  const _HomeScreenMobile({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        new SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: new Text(
            'facebook',
            style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: <Widget>[
            new CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print('Search'),
            ),
            new CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        new SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        new SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: new SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        new SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: new SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key key,
    @required this.scrollController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Flexible(
          flex: 2,
          child: new Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        new Container(
          width: 600,
          child: new CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: new SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              new SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: new SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        const Spacer(),
        new Flexible(
          flex: 2,
          child: new Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        )
      ],
    );
  }
}
