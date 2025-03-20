
import 'package:flutter/material.dart';
import 'package:movie_app/screens/loginScreen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:movie_app/provider/tv-movie-provider.dart';
import 'package:movie_app/screens/homescreen.dart';
import 'package:movie_app/screens/openingpage.dart';
import 'package:movie_app/screens/registerScreen.dart';
import 'package:provider/provider.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(MyApp(localStorage: localStorage));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;
  const MyApp({super.key, required this.localStorage});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieAndShowProvider(localStorage))
      ],
      child: MaterialApp(  
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: RegisterScreen(),
      ),
    );
  }
}


