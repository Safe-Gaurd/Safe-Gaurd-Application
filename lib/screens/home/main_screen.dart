import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/constants/toast.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/maps/map.dart';
import 'package:safegaurd/screens/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
   void initState() {
    super.initState();

    // Show the welcome toast when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      toastMessage(
        context: context,
        message: "Welcome Prakash!",
        leadingIcon: const Icon(Icons.emoji_emotions),
      );
    });
  }

  int currentIndex = 0;
  List<Widget> screens=[
    const HomeScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        leading: const Icon(Icons.draw_rounded),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProfileScreen()));
            },
          )
        ],
      ),
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
      ),
    );
  }
}