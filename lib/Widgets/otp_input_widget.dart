import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String, int) onChanged;
  final int index;
  const OTPInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => focusNode.requestFocus(),
        //Kutu Tasarımı
        child: Container(
          height: 55,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade100,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(color: Colors.transparent),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) => onChanged(value, index),
                ),
              ),
              IgnorePointer(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Icon(
                      Icons.circle,
                      color: controller.text.isEmpty
                          ? Colors
                                .grey
                                .shade400 //Eğer boşsa Gri Renkte
                          : const Color.fromARGB(
                              255,
                              196,
                              67,
                              20,
                            ), // Eğer Kod Rakam Girildiyse  Koyu kahve renkte
                      size: 15,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
