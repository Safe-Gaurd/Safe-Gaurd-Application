import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safegaurd/backend/auth/auth_methods.dart';
import 'package:safegaurd/backend/providers/user_provider.dart';
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
import 'package:safegaurd/screens/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoginOrSignUp;
  const HomeScreen({super.key, this.isLoginOrSignUp=false}); 

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int currentIndex=0;
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  @override
  @override
void initState() {
    super.initState();
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
    Future.delayed(const Duration(seconds: 1), () {
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

    // Future.delayed(const Duration(seconds: 10), () {
    //   const CustomDialog().showLogoutDialog(
    //     context: context,
    //     label: "Location",
    //     message: "Allow SafeGaurd to access the location",
    //     option1: "Allow",
    //     onPressed1: () {
    //       Navigator.of(context).pop();
    //     },
    //     option2: "Deny",
    //     onPressed2: () {
    //     },
    //   );
    // });

    getData();
}

void getData() async {
    UserProvider userProvider=Provider.of(context, listen: false);
    await userProvider.fetchUser();
}


  final List<Widget> screens = [
    const FeedScreen(),
    const MapScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _)
    {
      return userProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppbar(label: "",),
        drawer: customNavigationBar(provider: userProvider),
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
    );
  }


  Drawer customNavigationBar({required UserProvider provider}){
    return Drawer(
      backgroundColor: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: blueColor),
            onDetailsPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen())),
            accountName: Text(
              provider.user.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              provider.user.email,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            currentAccountPicture: provider.user.photoURL != ''
                ? CircleAvatar(
                    backgroundImage: NetworkImage(provider.user.photoURL!),
                  )
                : CircleAvatar(
                    child: Text(
                      provider.user.name[0],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
            const SizedBox(height: 10),

            Navbaritems(icon: Icons.home, label: "Home", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen()));
              },),
            // Navbaritems(icon: Icons.person, label: "Profile", onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
            //   },),
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
                  option2: "Cancel",
                  onPressed2: () {
                    Navigator.of(context).pop();
                  }, 
                  option1: "Yes",
                  onPressed1: () {
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
