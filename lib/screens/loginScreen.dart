import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/firebase/firebaseAuth.dart';
import 'package:movie_app/screens/homescreen.dart';
import 'package:movie_app/screens/openingpage.dart';
import 'package:movie_app/screens/registerScreen.dart';
import 'package:movie_app/validation/validationLogic.dart';
import 'package:movie_app/widgets/CustomInputFeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CheckValidation validation = CheckValidation();
  UserAuth auth = UserAuth();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // this flag will help in login button toggle
  bool isLogin = false;

  // these parameters will be passed to Auth
  String email = '';
  String password = '';

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(70),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomFormFeild(
                      title: 'Email',
                      controller: _emailController,
                      errorText: validation.email.error,
                      keyboardType: TextInputType.emailAddress,
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
                      errorText: validation.password.error,
                      controller: _passwordController,
                      isPass: true,
                      obscureText: true,
                      onChanged: (value) {
                        validation.validatePassword(value);
                        setState(() {
                          password = value;
                          isLogin = true;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(5, 33, 89, 1),
                        foregroundColor: Colors.white,
                      ),
                      onPressed:
                          (isLogin && validation.isValidLogin)
                              ? () {
                                _emailController.clear();
                                _passwordController.clear();
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  // reset so that button will disable again
                                  isLogin = false;
                                });
                                _login();
                              }
                              : null,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont Have an Account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    User? user = await auth.loginUser(email, password);
    if (user != null) {
      Fluttertoast.showToast(msg: 'Login Successful');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    }
  }
}
