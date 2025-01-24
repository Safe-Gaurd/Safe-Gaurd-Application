import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/notifications/notification.dart';


class SupportHelpScreen extends StatelessWidget {
  const SupportHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: blueColor,
        toolbarHeight: 70,
        actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const NotificationScreen()));
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
        title: const Text("Help & Support", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: backgroundColor),),
      ),
      body: Center(
        child: Text("Help & Support screen"),
      ),
    );
  }
}