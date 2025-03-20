

import 'package:flutter/material.dart';
import 'package:movie_app/widgets/CustomInputFeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override void dispose() {
    
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg-image.jpg')),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color:Colors.black.withAlpha(70),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    Text('Login',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 40,),
                    CustomFormFeild(title: 'Email', controller: _emailController),
                    const SizedBox(height: 20,),
                    CustomFormFeild(title: 'Password', controller: _passwordController),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Dont Have an Account?'),
                      
                      TextButton(onPressed: (){}, child: const Text('Register'))
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
