

import 'package:flutter/material.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:movie_app/widgets/CustomInputFeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _recheckcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _recheckcontroller.dispose();
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
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(70),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Text('Register',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 40,),
                  CustomFormFeild(title: 'Username', controller: _namecontroller),
                  const SizedBox(height: 20,),
                  CustomFormFeild(title: 'Email', controller: _emailcontroller),
                  const SizedBox(height: 20,),
                  CustomFormFeild(title: 'Password', controller: _passwordcontroller),
                  const SizedBox(height: 20,),
                  CustomFormFeild(title: 'Re-enter Password', controller: _recheckcontroller),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?'),
                      TextButton(onPressed: (){}, child: const Text('Login')),
                    ],)
                ],
              ),
            ),),
        ),
      ),
    );
  }
}