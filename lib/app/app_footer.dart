import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget implements PreferredSizeWidget {
  final double standardTextFontSize;

  const AppFooter({Key? key, this.standardTextFontSize = 0.0})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_drive_file_rounded),
          label: 'Документи',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flash_on_rounded),
          label: 'Послуги',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Повідомлення',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_rounded),
          label: 'Меню',
        ),
      ],
      selectedLabelStyle: TextStyle(fontSize: standardTextFontSize),
      unselectedLabelStyle: TextStyle(fontSize: standardTextFontSize),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    );
  }
}
