import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_app/Views/otp_verification_screen.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final TextEditingController _phoneController = TextEditingController();
  bool isValidPhone = false;

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(_validatePhone);
  }

  void _validatePhone() {
    setState(() {
      String phone = _phoneController.text.trim();
      // Karakter kontrolü
      isValidPhone = phone.length == 11 && RegExp(r'^[0-9]+$').hasMatch(phone);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  Text("+65", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, //Sadece rakam girişine izin verir (harf, özel karakter engelir)
                  LengthLimitingTextInputFormatter(
                    11,
                  ), //Maksimum 11 karakter sınırı koyar
                ],
                decoration: InputDecoration(
                  hintText: "9876XXXXXX",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isValidPhone
                ? const Color.fromARGB(255, 187, 61, 33)
                : const Color.fromARGB(255, 246, 245, 245),
            foregroundColor: isValidPhone ? Colors.white : Colors.grey,
            fixedSize: Size(350, 50),
          ),

          onPressed: isValidPhone
              ? () {
                  String fullPhoneNumber = "+65${_phoneController.text}";
                  print("Telefon numarası: $fullPhoneNumber");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(),
                    ),
                  );
                }
              : null,
          child: Text(
            "Continue",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
