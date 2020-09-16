import 'package:fb_responsive_ui_web_mb/data/data.dart';
import 'package:fb_responsive_ui_web_mb/screens/screens.dart';
import 'package:fb_responsive_ui_web_mb/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Created By Hamza Chaouki [DevHcH].
/// 9/15/2020

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(
      body: new Center(
        child: new Text('Videos'),
      ),
    ),
    Scaffold(
      body: new Center(
        child: new Text('Profile'),
      ),
    ),
    Scaffold(
      body: new Center(
        child: new Text('Invets'),
      ),
    ),
    Scaffold(
      body: new Center(
        child: new Text('Notification'),
      ),
    ),
    Scaffold(
      body: new Center(
        child: new Text('Menu'),
      ),
    ),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new DefaultTabController(
      length: _icons.length,
      child: new Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize(
          preferredSize: Size( screenSize.width, 100.0),
          child: new CustomAppBar(
            currentUser: currentUser,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ): null,
        body: new IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? new Container(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ) : const SizedBox.shrink(),
      ),
    );
  }
}
