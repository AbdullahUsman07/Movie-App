import 'package:flutter/material.dart';
import 'package:movie_app/screens/loginScreen.dart';
import 'package:movie_app/screens/registerScreen.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:movie_app/widgets/login-signupButton.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/new-bg.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Custom_Text(
                text: 'Welcome to Stream Free',
                color: Colors.white,
                font: 30,
              ),
              const SizedBox(height: 10),
              Center(
                child: Custom_Text(
                  text:
                      'The Ultimate Streaming App to brighten your days where you can find trending movies and popular TV Shows',
                  color: Colors.white,
                  font: 16,
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                color: Color.fromRGBO(5,33, 89,1),
                title: 'Login',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    )),
              const SizedBox(height: 15),
              CustomButton(
                color: Color.fromRGBO(5,33, 89,1),
                title: 'Register',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
