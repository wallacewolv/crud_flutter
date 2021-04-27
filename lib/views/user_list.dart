import 'dart:math';

import 'package:crud_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/components/user_tile.dart';
import 'package:crud_flutter/provider/users_provider.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: double.maxFinite,
          child: Text(
            "Lista de Usuários",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
