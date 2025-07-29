import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  var languages;
  String selectLanguage = "English";

  @override
  void initState() {
    super.initState();
    languages = ["Turkish", "English", "French"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Spacer(),
            DropdownButton(
              value: selectLanguage,
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String? select) {
                setState(() {
                  selectLanguage = select!;
                });
              },
            ),
          ],
        ),
      ),
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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Text("🇸🇬", style: TextStyle(fontSize: 18)),
                      SizedBox(width: 4),
                      Text(
                        "+65",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "9876543210",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 187, 61, 33),
                foregroundColor: Colors.white,
                fixedSize: Size(350, 50),
              ),
              onPressed: () {
                setState(() {});
              },
              child: Text(
                "Continue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
