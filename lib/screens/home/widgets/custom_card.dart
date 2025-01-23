import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          addButton(title: "Weather", imagePath: "assets/home/weather.jpg"),
          addButton(title: "Start Journey", imagePath: "assets/home/maps.jpeg"),
          addButton(title: "Emergency", imagePath: "assets/home/emergency.jpg"),
          addButton(title: "Acident Reports Analysis", imagePath: "assets/home/accident_analysis.jpg"),
        ],
      ),
    );
  }

  Widget addButton({
    required String title,
    required String imagePath,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {}, // You can pass a callback or leave it as a no-op
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
