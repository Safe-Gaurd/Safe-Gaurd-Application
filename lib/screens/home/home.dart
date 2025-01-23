import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/constants/toast.dart';
import 'package:safegaurd/screens/home/widgets/appbar.dart';
import 'package:safegaurd/screens/home/feed_screen.dart';
import 'package:safegaurd/screens/home/widgets/side_navigation_bar.dart';
import 'package:safegaurd/screens/maps/map.dart';
import 'package:safegaurd/screens/profile/user_profile.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
   void initState() {
    super.initState();

    // Show the welcome toast when the screen is loaded
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   toastMessage(
    //     context: context,
    //     message: "Welcome Prakash!",
    //     leadingIcon: const Icon(Icons.emoji_emotions),
    //   );
    // });
  }

  int currentIndex = 0;
  List<Widget> screens=[
    const HomeScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomDesignAppBar(),
      // drawer: const CustomSideNavigationBar(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Navigation',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
      ),
    );
  }
}