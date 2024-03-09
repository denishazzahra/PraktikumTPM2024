import 'package:flutter/material.dart';
import 'package:tugas_teori/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Kelompok Mobile',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
      home: const LoginPage(),
    );
  }
}
