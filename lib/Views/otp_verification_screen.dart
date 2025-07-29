import 'package:flutter/material.dart';
import 'package:pizza_app/Views/product_page.dart';
import 'package:pizza_app/Widgets/custom_app_bar.dart';
import 'package:pizza_app/Widgets/otp_input_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (i) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (i) => FocusNode());
  bool isLoading = false;

  @override
  void dispose() {
    _controllers.forEach((c) => c.dispose());
    _focusNodes.forEach((f) => f.dispose());
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 4) {
      _focusNodes[index + 1].requestFocus();
    }

    // 5 hane tamamlandı mı kontrol et
    String code = _controllers.map((c) => c.text).join();
    if (code.length == 5) {
      setState(() => isLoading = true);

      // 2 saniye sonra Product sayfasına git
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/main'); //
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Scaffold'ı Stack içine aldım
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(orderWidgets: Text("Need help?")),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify Your Number",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter your PIN here to log in",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => OTPInputWidget(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      onChanged: _onChanged,
                      index: index,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                if (!isLoading)
                  GestureDetector(
                    onTap: () => print("Try another way"),
                    child: Text(
                      "Try another way",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 198, 61, 19),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        // Loading - TÜM EKRANI KAPLAR (AppBar + Body + Her Şey!)
        if (isLoading)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 8,
                backgroundColor: Colors.white, // Arka kalan kısmın rengi
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 196, 67, 20), // Dönen kısmın rengi
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ProductSayfasi'nı import etmeyi unutmayın
