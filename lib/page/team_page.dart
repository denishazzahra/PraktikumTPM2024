import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const List<Map<String, dynamic>> profile = [
      {
        "name": "Denisha Kyla Azzahra",
        "nim": "123210130",
        "github": "denishazzahra",
        "pic": "kucing_teriak.jpeg",
      },
      {
        "name": "I Gusti Ketut Dimas Pramantya",
        "nim": "123210022",
        "github": "DimasPramantya",
        "pic": "github_default.png"
      }
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Team Members',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              _profileCarrousel(screenWidth, profile),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileCarrousel(
      double screenWidth, List<Map<String, dynamic>> profile) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
      items: [0, 1].map((i) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: const Color(0xfffffbff),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/${profile[i]["pic"]}'),
                radius: 50,
              ),
              const SizedBox(height: 20),
              Text(
                profile[i]['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(profile[i]['nim']),
              const SizedBox(height: 5),
              _githubButton(profile[i]['github'], screenWidth),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _githubButton(String username, double screenWidth) {
    Uri url = Uri.parse('https://github.com/$username');
    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            _launchUrl(url);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/github.png',
                width: 18,
              ),
              const SizedBox(width: 10),
              const Text('Visit GitHub'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
