import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/notifications/notification.dart';
import 'package:safegaurd/screens/support&help/help.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        toolbarHeight: 70,
        actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_sharp),
          tooltip: 'Help',
          onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SupportHelpScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotificationScreen()));
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
        title: const Text("Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: backgroundColor),),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }

}