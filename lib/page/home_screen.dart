import 'calculator_page.dart';
import 'even_odd_page.dart';
import 'team_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, $username!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Try out our features.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
              child: _logoutButton(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                child: Image.asset(
                  'assets/images/home_illustration.png',
                ),
              ),
              const SizedBox(height: 20),
              _calculator(context),
              _evenOdd(context),
              _teamMembers(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _calculator(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CalculatorPage();
              },
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xfffffbff),
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(15),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/math.png',
                width: 64,
              ),
              const SizedBox(width: 15),
              Expanded(
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Calculator',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Do some simple calculations.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _evenOdd(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const EvenOddPage();
              },
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xfffffbff),
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(15),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/numbers.png',
                width: 64,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Odd or Even?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Check if your number is odd or even.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _teamMembers(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TeamPage();
              },
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xfffffbff),
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(15),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/team.png',
                width: 64,
              ),
              const SizedBox(width: 15),
              Expanded(
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Team Members',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Get to know the people behind this app.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return IconButton(
      iconSize: 16,
      icon: const Icon(Icons.logout),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ),
        );
      },
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
