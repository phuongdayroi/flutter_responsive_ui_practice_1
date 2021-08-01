import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/constants.dart';
import 'package:flutter_responsive_ui/responsive_layout.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(ThemeConstants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10)
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30,
                child: Image.asset("image/avatar.png"),
              ),
            )
        ],
      ),
    );
  }
}
