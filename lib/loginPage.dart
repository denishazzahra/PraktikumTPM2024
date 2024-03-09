import 'package:flutter/material.dart';
import 'halamanUtama.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 48),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Silahkan login terlebih dahulu",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  usernameField(),
                  passwordField(),
                  loginButton(context),
                ]),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: TextField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.tealAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      enabled: true,
      onChanged: (value) {
        password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          borderSide:
              BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (password == "admin" && username == "admin") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HalamanUtama();
            }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(content: Text(text));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        ),
        child: const Text(
          'Login',
        ),
        // style: ElevatedButton.styleFrom(

        //     primary: isLoginSuccess ? Colors.blue : Colors.red,
        //     onPrimary: Colors.white,
        //     shape: StadiumBorder()
        // ),
      ),
    );
  }
}
