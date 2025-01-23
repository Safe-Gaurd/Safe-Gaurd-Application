import 'package:flutter/material.dart';
import 'package:safegaurd/backend/auth/auth_methods.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/auth/login.dart';
import 'package:safegaurd/screens/home/widgets/custom_card.dart';
import 'package:safegaurd/screens/home/widgets/navbaritems.dart';
import 'package:safegaurd/screens/profile/user_profile.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(context),
      drawer: customNavigationBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              decoration: const BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text("Wekcome, \nLokesh Surya Prakash", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            
            //Weather Box
            const SizedBox(height: 20,),
            Container(
              height: 100,
              color: Colors.grey,
            ),
        
            //Buttons
            const SizedBox(height: 20,),
            const CustomCard(),
            // const SizedBox(height: 10,),
          ],
        ),
      ),
      );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: blueColor,
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
            // Action for Help
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Notifications',
          onPressed: () {
            // Action for Notifications
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
                builder: (context) => const UserProfileScreen(),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
              },
            ),
            const SizedBox(height: 10),

            Navbaritems(icon: Icons.home, label: "Home", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FeedScreen()));
              },),
            Navbaritems(icon: Icons.person, label: "Profile", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
              },),
            Navbaritems(icon: Icons.settings, label: "Settings", onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
              },),
            Navbaritems(icon: Icons.notifications, label: "Notifications", onTap:  () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
              },),
            Navbaritems(icon: Icons.logout, label: "SignOut", onTap :() => _showLogoutDialog(context),
              labelColor: Colors.red,), 
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          AuthService().logout();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}