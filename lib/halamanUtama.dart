import 'package:flutter/material.dart';
import 'package:tugas_teori/calculator.dart';
import 'package:tugas_teori/ganjilGenap.dart';
import 'package:tugas_teori/ganjilGenap2.dart';
import 'package:tugas_teori/loginPage.dart';
import 'package:tugas_teori/dataKelompok.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: const Text("Menu Utama"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttonData(context),
          buttonCalculator(context),
          buttonGanjilGenap(context),
        ]),
      ),
    );
  }

  Widget buttonData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return KelompokScreen();
          }));
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        ),
        child: const Text('Data Kelompok'),
      ),
    );
  }

  Widget buttonCalculator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CalculatorPage();
          }));
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        ),
        child: const Text('Kalkulator'),
      ),
    );
  }

  Widget buttonGanjilGenap(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GanjilGenapApp();
          }));
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07)),
        ),
        child: const Text('Cek Ganjil Genap'),
      ),
    );
  }
}
