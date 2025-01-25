import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:safegaurd/backend/auth/auth_methods.dart';
import 'package:safegaurd/constants/colors.dart'; 
import 'package:safegaurd/constants/toast.dart';
import 'package:safegaurd/screens/auth/login.dart';
import 'package:safegaurd/screens/home/feed_screen.dart';
import 'package:safegaurd/screens/home/widgets/navbaritems.dart';
import 'package:safegaurd/screens/maps/map.dart';
import 'package:safegaurd/screens/notifications/notification.dart';
import 'package:safegaurd/screens/profile/user_profile.dart';
import 'package:safegaurd/screens/settings/settings.dart';
import 'package:safegaurd/screens/support&help/help.dart';
import 'package:safegaurd/constants/dialog.dart';

class HomeScreen extends StatefulWidget {
  final int? initialIndex;
  final bool isLoginOrSignUp;
  const HomeScreen({super.key, this.initialIndex=0, this.isLoginOrSignUp=false}); 

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  @override
  @override
void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;

    // Display toast immediately
    if (widget.isLoginOrSignUp) {
      toastMessage(
        context: context,
        message: "Welcome Back!",
        leadingIcon: const Icon(Icons.emoji_emotions),
        position: DelightSnackbarPosition.top,
      );
    }

    // Delayed execution for dialogs
    Future.delayed(const Duration(seconds: 5), () {
      const CustomDialog().showLogoutDialog(
        context: context,
        label: "Notifications",
        message: "Allow SafeGaurd to send notifications",
        option1: "Allow",
        onPressed1: () {
          Navigator.of(context).pop();
        },
        option2: "Deny",
        onPressed2: () {
        },
      );
    });

    Future.delayed(const Duration(seconds: 10), () {
      const CustomDialog().showLogoutDialog(
        context: context,
        label: "Location",
        message: "Allow SafeGaurd to access the location",
        option1: "Allow",
        onPressed1: () {
          Navigator.of(context).pop();
        },
        option2: "Deny",
        onPressed2: () {
        },
      );
    });
}


  final List<Widget> screens = [
    const FeedScreen(),
    const MapScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(context),
      drawer: customNavigationBar(context),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
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
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: blueColor,
      toolbarHeight: 70,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Open Menu',
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_sharp),
          tooltip: 'Help',
          onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SupportHelpScreen()));
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
          // icon: provider.user.profileUrl != ''
          //     ? CircleAvatar(
          //         backgroundImage: NetworkImage(provider.user.profileUrl),
          //       )
          //     : CircleAvatar(
          //         child: Text(provider.user.name[0]),
          //       ),
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
    );
  }

  Drawer customNavigationBar(BuildContext context){
    return Drawer(
      backgroundColor: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
          //   UserAccountsDrawerHeader(
          //   decoration: const BoxDecoration(color: blueColor),
          //   onDetailsPressed: () => Navigator.of(context).push(
          //       MaterialPageRoute(
          //           builder: (context) => const UserProfileScreen())),
          //   accountName: Text(
          //     provider.user.name,
          //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          //   accountEmail: Text(
          //     provider.user.email,
          //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          //   ),
          //   currentAccountPicture: provider.user.profileUrl != ''
          //       ? CircleAvatar(
          //           backgroundImage: NetworkImage(provider.user.profileUrl),
          //         )
          //       : CircleAvatar(
          //           child: Text(
          //             provider.user.name[0],
          //             style: const TextStyle(
          //                 fontSize: 24, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          // ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: blueColor
                ),
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/home/profile.jpg',
                          width: 110,
                          height: 110,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    const Text("Lokesh Surya Prakash", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: backgroundColor),),
                    const Text("lokesh@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: backgroundColor)),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen(initialIndex: 2,)));
              },
            ),
            const SizedBox(height: 10),

            Navbaritems(icon: Icons.home, label: "Home", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },),
            Navbaritems(icon: Icons.person, label: "Profile", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen(initialIndex: 2,)));
              },),
            Navbaritems(icon: Icons.notifications, label: "Notifications", onTap:  () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotificationScreen()));
              },),
            Navbaritems(icon: Icons.settings, label: "Settings", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SettingsScreen()));
              },),
            Navbaritems(icon: Icons.logout, label: "SignOut", 
              onTap :() {
                const CustomDialog().showLogoutDialog(
                  context: context, 
                  label: "LogOut", 
                  message: "Are you sure you want to  Log Out?", 
                  option1: "Cancel",
                  onPressed1: () {
                    Navigator.of(context).pop();
                  }, 
                  option2: "Yes",
                  onPressed2: () {
                       AuthService().logout();
                       Navigator.of(context)
                           .pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                     },
                );
              },
              labelColor: Colors.red,), 
          ],
        ),
      ),
    );
  }

}
