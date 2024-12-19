import 'package:chat_app/pages/settings_page.dart';

import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout() {
    //get authService.dart
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,
                size: 64,
              )),
            ),

            //home last tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("HOME"),
                leading: const Icon(Icons.home),
                onTap: () {
                  //pop the drawer
                  Navigator.pop(context);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("SETTINGS"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  //pop the drawer
                  Navigator.pop(context);

                  //Navigate to settings page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("Log out"),
                leading: const Icon(Icons.logout),
                onTap: logout,
              ),
            )
          ],
        ));
  }
}
