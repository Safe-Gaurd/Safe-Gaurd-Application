// import 'package:flutter/material.dart';
// import 'package:safegaurd/backend/auth/auth_methods.dart';
// import 'package:safegaurd/constants/colors.dart';
// import 'package:safegaurd/screens/home/feed_screen.dart';
// import 'package:safegaurd/screens/profile/user_profile.dart';

// class CustomSideNavigationBar extends StatelessWidget {
//   const CustomSideNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             InkWell(
//               child: Container(
//                 padding: const EdgeInsets.all(5),
//                 decoration: const BoxDecoration(
//                   color: blueColor
//                 ),
//                 height: 250,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/home/profile.jpg',
//                           width: 110,
//                           height: 110,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height:20),
//                     const Text("Lokesh Surya Prakash", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor),),
//                     const Text("lokesh@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: whiteColor)),
//                   ],
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
//               },
//             ),
//             const SizedBox(height: 10),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text("Home"),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FeedScreen()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.person),
//               title: const Text("Profile"),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text("Settings"),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.notifications),
//               title: const Text("Notifications"),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text("SignOut"),
//               onTap: () {
//                 AuthService().logout();
//               },
//             ),
        
        
            
//           ],
//         ),
//       ),
//     );
//   }
// }