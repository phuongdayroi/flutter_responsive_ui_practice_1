import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/app_bar/app_bar_widget.dart';
import 'package:flutter_responsive_ui/drawer/drawer_page.dart';
import 'package:flutter_responsive_ui/panel_center/panel_center_page.dart';
import 'package:flutter_responsive_ui/panel_left/panel_left_page.dart';
import 'package:flutter_responsive_ui/panel_right/panel_right_page.dart';
import 'package:flutter_responsive_ui/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: PanelCenterPage(),
        phone: PanelCenterPage(),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
