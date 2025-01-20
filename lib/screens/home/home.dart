import 'package:flutter/material.dart';
import 'package:safegaurd/constants/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
    toastMessage(
      context: context, 
      message: "Hi Prakash", 
      leadingIcon: const Icon(Icons.error_rounded),
      toastColor: Colors.red[200],
      borderColor: Colors.red
      );
        }, child: const Text("click")),
      ),
    );
  }
}