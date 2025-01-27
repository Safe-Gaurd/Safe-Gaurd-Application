import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/notifications/notification.dart';
import 'package:safegaurd/screens/support&help/help.dart';
import 'package:safegaurd/screens/widgets/appbar.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(label: "Settings"),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }

}