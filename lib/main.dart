import 'package:crud_flutter/provider/users_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/splash_screen.dart';
import 'package:crud_flutter/views/user_form.dart';
import 'package:crud_flutter/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crud Flutter',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFE5F1F7),
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.SPLASH: (ctx) => SplashScreen(),
          AppRoutes.HOME: (ctx) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm(),
        },
      ),
    );
  }
}
