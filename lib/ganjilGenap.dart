// import 'dart:ffi';

// import 'package:flutter/material.dart';

// class GanjilGenap extends StatefulWidget {
//   const GanjilGenap({super.key});

//   @override
//   State<GanjilGenap> createState() => _GanjilGenapState();
// }

// class _GanjilGenapState extends State<GanjilGenap> {
//   TextEditingController _numberController = TextEditingController();
//   int bilangan = 0;
//   String hasil = ' ';

//   @override
//   void initState() {
//     _numberController.text = bilangan.toString();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).secondaryHeaderColor,
//       appBar: AppBar(
//         title: const Text('Ganjil Genap'),
//         backgroundColor: Theme.of(context).secondaryHeaderColor,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               keyboardType: TextInputType.number,
//               // onChanged: (value) {
//               //   bilangan = value as int;
//               // },
//               showCursor: true,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.07),
//               controller: _numberController,
//               decoration: const InputDecoration(border: InputBorder.none),
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                   minimumSize: MaterialStateProperty.all(Size.fromHeight(
//                       MediaQuery.of(context).size.height * 0.07)),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     bilangan % 2 == 0 ? hasil = 'Genap' : hasil = 'Ganjil';
//                   });
//                 },
//                 child: const Text('Cek Angka')),
//             Text(
//               'Hasil: $hasil',
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.05),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
