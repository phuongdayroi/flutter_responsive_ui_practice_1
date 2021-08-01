import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/constants.dart';
import 'package:flutter_responsive_ui/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtonInfo {
  String title;
  IconData icon;

  ButtonInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtonInfo> _buttonName = [
  ButtonInfo(title: "Home", icon: Icons.home),
  ButtonInfo(title: "Setting", icon: Icons.settings),
  ButtonInfo(title: "Notifications", icon: Icons.notifications),
  ButtonInfo(title: "Contacts", icon: Icons.contacts),
  ButtonInfo(title: "Sales", icon: Icons.sell),
  ButtonInfo(title: "Marketing", icon: Icons.mark_email_read_outlined),
  ButtonInfo(title: "Security", icon: Icons.verified_user),
  ButtonInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(ThemeConstants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Admin Menu",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
              ),
              ...List.generate(
                  _buttonName.length,
                  (index) => Column(
                        children: [
                          Container(
                            decoration: _currentIndex == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(colors: [
                                      ThemeConstants.redDark.withOpacity(0.9),
                                      ThemeConstants.orangeDark.withOpacity(0.9)
                                    ]))
                                : null,
                            child: ListTile(
                              title: Text(
                                _buttonName[index].title,
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Padding(
                                padding:
                                    EdgeInsets.all(ThemeConstants.kPadding),
                                child: Icon(
                                  _buttonName[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 0.1,
                          )
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
