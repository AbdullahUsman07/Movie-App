import 'package:flutter/material.dart';
import 'package:movie_app/screens/homescreen.dart';
import 'package:movie_app/screens/loginScreen.dart';
import 'package:movie_app/screens/openingpage.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:movie_app/validation/validationLogic.dart';
import 'package:movie_app/widgets/CustomInputFeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CheckValidation validation = CheckValidation();

  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _recheckcontroller = TextEditingController();

  // these will pass in the auth function
  String email = '';
  String password = '';
  String username = '';

  // this flag will disable the signup button again once the signup is successful
  bool isRegistered = false;

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LandingScreen()),
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/new-bg.jpg'),
          ),
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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomFormFeild(
                    title: 'Username',
                    errorText: validation.username.error,
                    controller: _namecontroller,
                    onChanged: (value) {
                      validation.validateUsername(value);
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFormFeild(
                    title: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    errorText: validation.email.error,
                    controller: _emailcontroller,
                    onChanged: (value) {
                      validation.validateEmail(value);
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFormFeild(
                    title: 'Password',
                    isPass: true,
                    obscureText: true,
                    errorText: validation.password.error,
                    controller: _passwordcontroller,
                    onChanged: (value) {
                      validation.validatePassword(value);
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFormFeild(
                    title: 'Re-enter Password',
                    obscureText: true,
                    controller: _recheckcontroller,
                    isPass: true,
                    errorText: validation.reEnter.error,
                    onChanged: (value) {
                      validation.validateReEnter(value);
                      setState(() {
                        isRegistered = true;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(5,33, 89,1),
                      foregroundColor: Colors.white,
                      
                    ),
                    onPressed:
                        (isRegistered && validation.isValidRegister)
                            ? () {
                              _emailcontroller.clear();
                              _passwordcontroller.clear();
                              _recheckcontroller.clear();
                              _namecontroller.clear();

                              FocusScope.of(context).unfocus();

                              setState(() {
                                isRegistered= false;
                              });

                             Navigator.pushAndRemoveUntil(
                              context,
                               MaterialPageRoute(builder: (context) => HomeScreen()),
                                (route) => false);
                            }
                            : null,
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
