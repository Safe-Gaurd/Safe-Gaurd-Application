import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/support&help/help.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: blueColor,
      toolbarHeight: 70,
      title: const Text("Notifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: backgroundColor)),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_sharp),
          tooltip: 'Help',
          onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SupportHelpScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.person_pin),
          tooltip: 'Profile',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(initialIndex: 2,),
              ),
            );
          },
        ),
        const SizedBox(width: 15),
      ],
    ),
      body: Center(
        child: Text("Notification"),
      ),
    );
  }


}