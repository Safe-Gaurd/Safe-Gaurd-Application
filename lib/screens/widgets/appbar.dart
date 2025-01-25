import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/notifications/notification.dart';
import 'package:safegaurd/screens/support&help/help.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final TextStyle? style;
  const CustomAppbar({
    super.key,
    required this.label,
    this.style,
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blueColor,
      toolbarHeight: 70,
      title: Text(
        label,
        style: style ?? const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: backgroundColor,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_sharp),
          tooltip: 'Help',
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SupportHelpScreen(),
              ),
            );
          },
        ),
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
                builder: (context) => const HomeScreen(initialIndex: 2),
              ),
            );
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
