import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/feed_sub_screens/phone_call.dart';
import 'package:safegaurd/screens/feed_sub_screens/report_analysis.dart';
import 'package:safegaurd/screens/feed_sub_screens/weather.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/home/widgets/custom_card_button.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
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
            customCard(context),
          ],
        ),
      ),
      );
  }

  Widget customCard(BuildContext context){
    return SizedBox(
      height: 400,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          CustomCardButton(
            title: "Weather",
            imagePath: "assets/home/weather.JPG",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const WeatherScreen()));
            },
            gradient: LinearGradient(colors: [Colors.blue[300]!, Colors.blue[600]!]),
          ),
          CustomCardButton(
            title: "Start Journey",
            imagePath: "assets/home/maps.jpg",
            width: 85,
            height: 85,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen(initialIndex: 1,)));
            },
            gradient: LinearGradient(colors: [Colors.green[300]!, Colors.green[600]!]),
          ),
          CustomCardButton(
            title: "Emergency",
            imagePath: "assets/home/emergency.jpg",
            gradient: LinearGradient(colors: [Colors.red[300]!, Colors.red[600]!]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PhoneCallScreen()));
            },
          ),
          CustomCardButton(
            title: "Reports Analysis",
            imagePath: "assets/home/accident_analysis.jpg",
            width: 85,
            height: 85,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ReportAnalysisScreen()));
            },
            gradient: LinearGradient(colors: [Colors.orange[300]!, Colors.orange[600]!]),
          ),
        ],
      ),
    );
  }

}