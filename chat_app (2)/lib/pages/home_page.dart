import 'dart:js';

import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //chat and aouth services
  final ChatServices _chatServices= ChatServices();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList()
  {
    return StreamBuilder(
      stream: _chatServices.getUserStream(), 
      builder: (context, snapshot)
      {
        //error
        if(snapshot.hasError){
          return const Text("Error");
        }

        //loading
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return const Text("loading..");
        }

        //return ListView
        return ListView(
          children: 
            snapshot.data!.map<Widget>((userData) => _buildUserListItems).toList(),
          
        );
      }
      );
  }

//build individual list tile for user
Widget _buildUserListitem(Map<String, dynamic> userData, BuildContext context )
return UserTile();

}
