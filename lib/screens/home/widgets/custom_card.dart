import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          addButton(
            title: "Weather",
            imagePath: "assets/home/weather.JPG",
            gradient: LinearGradient(colors: [Colors.blue[300]!, Colors.blue[600]!]),
          ),
          addButton(
            title: "Start Journey",
            imagePath: "assets/home/maps.jpg",
            width: 85,
            height: 85,
            gradient: LinearGradient(colors: [Colors.green[300]!, Colors.green[600]!]),
          ),
          addButton(
            title: "Emergency",
            imagePath: "assets/home/emergency.jpg",
            gradient: LinearGradient(colors: [Colors.red[300]!, Colors.red[600]!]),
          ),
          addButton(
            title: "Reports Analysis",
            imagePath: "assets/home/accident_analysis.jpg",
            width: 85,
            height: 85,
            gradient: LinearGradient(colors: [Colors.orange[300]!, Colors.orange[600]!]),
          ),
        ],
      ),
    );
  }

  Widget addButton({
    required String title,
    required String imagePath,
    LinearGradient? gradient,
    void Function()? onTap,
    double? width,
    double? height,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {}, // You can pass a callback or leave it as a no-op
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient, // Apply gradient background
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), // Padding inside the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: width ?? 100,
                  height: height ?? 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color to contrast with the background
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
