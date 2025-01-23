// import 'package:flutter/material.dart';
// import 'package:safegaurd/constants/colors.dart';

// class CustomDesignAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomDesignAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: blueColor,
//       leading: Builder(
//         builder: (context) => IconButton(
//           icon: const Icon(Icons.menu),
//           tooltip: 'Open Menu',
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.help_outline_sharp),
//           tooltip: 'Help',
//           onPressed: () {
//             // Action for Help
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.notifications),
//           tooltip: 'Notifications',
//           onPressed: () {
//             // Action for Notifications
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.person_pin),
//           tooltip: 'Profile',
//           onPressed: () {
//             // Action for Profile
//           },
//         ),
//         const SizedBox(width: 15),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
