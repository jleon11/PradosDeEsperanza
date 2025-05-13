import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ServiceCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 1, child: Image.asset(imagePath, fit: BoxFit.cover)),
          Container(
            width: double.infinity,
            color: Colors.blue[800],
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
