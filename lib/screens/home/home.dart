import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: blueColor,
            ),
            child: Center(
              child: Text('Welcome '),
            ),
          )
        ],
      ),
      );
  }
}