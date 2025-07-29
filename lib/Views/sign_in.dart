import 'package:flutter/material.dart';
import 'package:pizza_app/Widgets/custom_app_bar.dart';
import 'package:pizza_app/Widgets/language_dropdown.dart';
import 'package:pizza_app/Widgets/phone_input.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(orderWidgets: LanguageDropdown()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Ovenly",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            SizedBox(height: 8),
            Text(
              "We’ll send you a verification code to get started",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
            ),
            SizedBox(height: 20),
            Text(
              "Phone number*",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            PhoneInput(),
            SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You agree to our ',
                    style: TextStyle(
                      color: Color.fromRGBO(134, 134, 134, 1),
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: ' Terms of Service ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 61, 33),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    // Eğer tıklanabilir yapmak isterseniz:
                    // recognizer: TapGestureRecognizer()..onTap = () {
                    // Tıklanınca yapılacaklar
                  ),
                  TextSpan(
                    text: ' & ',
                    style: TextStyle(
                      color: Color.fromRGBO(134, 134, 134, 1),
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 61, 33),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
