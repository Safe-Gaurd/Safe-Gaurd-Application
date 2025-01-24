import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/widgets/custom_card.dart';

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
            const CustomCard(),
          ],
        ),
      ),
      );
  }

}