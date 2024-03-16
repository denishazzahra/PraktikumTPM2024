import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/login_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await GetStorage.init('checkLogin');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final checkLogin = GetStorage('checkLogin');
    bool isLoggedIn = checkLogin.read('isLoggedIn') ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const HomeScreen() : const LoginPage(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
