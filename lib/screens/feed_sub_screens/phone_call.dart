import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/feed_sub_screens/fav_person_call.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/home/widgets/custom_card_button.dart';
import 'package:safegaurd/screens/notifications/notification.dart';
import 'package:safegaurd/screens/support&help/help.dart';
import 'package:safegaurd/screens/widgets/appbar.dart';

class PhoneCallScreen extends StatelessWidget {
  const PhoneCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(label: "Emergency"),
      body: Center(
        child: SizedBox(
      height: 500,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          CustomCardButton(
            title: "Ambulance",
            imagePath: "assets/call/ambulance.jpg",
            gradient: LinearGradient(colors: [Colors.blue[300]!, Colors.blue[600]!]),
            onTap: () async {
                FlutterPhoneDirectCaller.callNumber('108');
              },
          ),
          CustomCardButton(
            title: "Police",
            imagePath: "assets/call/police.jpg",
            onTap: () async {
                FlutterPhoneDirectCaller.callNumber('100');
              },
            gradient: LinearGradient(colors: [Colors.green[300]!, Colors.green[600]!]),
          ),
          CustomCardButton(
            title: "Fire Extinguisher",
            imagePath: "assets/call/firefighter.jpg",
            onTap: () async {
                FlutterPhoneDirectCaller.callNumber('101');
              },
            gradient: LinearGradient(colors: [Colors.red[300]!, Colors.red[600]!]),
          ),
          CustomCardButton(
            title: "Favorite Person",
            imagePath: "assets/call/fav.jpg",
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const FavPersonCallScreen()));
            },
            gradient: LinearGradient(colors: [Colors.orange[300]!, Colors.orange[600]!]),
          ),
        ],
      ),
      ),
      ),
    );
  }
}