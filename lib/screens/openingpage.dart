
import 'package:flutter/material.dart';
import 'package:movie_app/screens/loginScreen.dart';
import 'package:movie_app/screens/registerScreen.dart';
import 'package:movie_app/widgets/login-signupButton.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 10.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg-image.jpg'))
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 350,),
              CustomButton(
                onTap: ()=> Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> LoginScreen())),
                title: 'Login', color: Theme.of(context).primaryColor),
              const SizedBox(height: 15,),
              CustomButton(
                onTap: ()=> Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>RegisterScreen())),
                title: 'Register', color: Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}