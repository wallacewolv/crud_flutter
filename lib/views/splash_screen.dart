import 'package:crud_flutter/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(
    //   seconds: 10,
    // )).then(
    //   (value) => Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => UserList(),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserList(),
            ),
          );
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                  "FLUTTER CRUD",
                  style: GoogleFonts.architectsDaughter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1766A7),
                  ),
                ),
              ),
              Container(
                child: Lottie.asset(
                  'assets/animations/dev_lottie.json',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "Tap to screen",
                  style: GoogleFonts.architectsDaughter(
                    fontSize: 18,
                    color: Color(0xFF1766A7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
