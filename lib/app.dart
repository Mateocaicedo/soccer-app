import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/screens/home_view.dart';
import 'package:repository/repository.dart';


//create a soccer app that displays the home screen
class SoccerApp extends StatelessWidget {
  const SoccerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
       
      create: (context) => Repository(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Soccer app',
        theme: ThemeData(
          fontFamily: "Poppins",
          
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
