import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/home/home_view.dart';
import 'package:repository/repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
