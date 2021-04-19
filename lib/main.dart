import 'package:crud_flutter/views/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: UserList(),
    ),
  );
}
