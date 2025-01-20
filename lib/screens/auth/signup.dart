import 'package:flutter/material.dart';
import 'package:safegaurd/constants/toast.dart';
import 'package:safegaurd/screens/auth/forgot_password.dart';
import 'package:safegaurd/screens/auth/login.dart';
import 'package:safegaurd/screens/auth/widgets/custom_auth_buttons.dart';
import 'package:safegaurd/screens/auth/widgets/customtextformfield.dart';
import 'package:safegaurd/backend/auth/auth_methods.dart';
import 'package:safegaurd/screens/home/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phonenum = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  bool obscureText = true;
  bool isLoading = false;
  bool isgoogleLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phonenum.dispose();
    name.dispose();
    super.dispose();
  }

  void signUpEmail() async {
    if (!formKey.currentState!.validate()){
      toastMessage(
          context: context,
          message: 'Fill All Fields!',
          leadingIcon: const Icon(Icons.message),
          toastColor: Colors.yellow[300],
          borderColor: Colors.orange,
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String res = await authService.handleSignUpWithEmail(
        email: email.text.trim(),
        password: password.text.trim(),
        name: name.text.trim(),
        phoneNumber: phonenum.text.trim(),
      );

      if (res == "success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        toastMessage(
          context: context,
          message: res,
          leadingIcon: const Icon(Icons.message),
          toastColor: Colors.yellow[300],
          borderColor: Colors.orange,
        );
      }
    } catch (e) {
      toastMessage(
        context: context,
        message: e.toString(),
        leadingIcon: const Icon(Icons.error),
        toastColor: Colors.red[200],
        borderColor: Colors.red,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/auth/signup.jpg",
                    width: 270,
                    height: 280,
                  ),
                  CustomTextFormField(
                    label: "Name",
                    hinttext: "Enter Your Name",
                    controller: name,
                    prefixicon: Icons.person_2,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Name is required' : null,
                  ),
                  CustomTextFormField(
                    label: "Email",
                    hinttext: "Enter Your Email",
                    controller: email,
                    prefixicon: Icons.email_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    hinttext: "Enter Your Password",
                    controller: password,
                    prefixicon: Icons.lock,
                    isobsure: obscureText,
                    suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter';
                      } else if (!RegExp(r'\d').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                          .hasMatch(value)) {
                        return 'Password must contain at least one special character';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Phone Number",
                    hinttext: "Enter Your Mobile Number",
                    controller: phonenum,
                    prefixicon: Icons.phone,
                    keyboard: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.isEmpty || value.length < 10
                            ? 'Please enter a valid phone number'
                            : null,
                  ),
                  const SizedBox(height: 10,),
                  LoginSignupButtons(
                          label: "SignUP",
                          onTap: signUpEmail,
                          isLoading: isLoading,
                          backgroundColor: Colors.blue[500],
                        ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  LoginSignupButtons(
                    imagepath: "assets/auth/google.jpg",
                    label: "SignUP With Google",
                    onTap: (){
                      setState(() {
                        isgoogleLoading = true;
                      });
                      String res=authService.handleSignUpWithGoogle().toString();
                      res=="success"
                      ? Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        )
                      : toastMessage(context: context, message: res);

                      setState(() {
                          isgoogleLoading = false;
                        });

                    },
                    isLoading: isgoogleLoading,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Already Have an Account?",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
