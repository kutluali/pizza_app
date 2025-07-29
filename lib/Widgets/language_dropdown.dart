import 'package:flutter/material.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectLanguage = "English";
  final List<String> languages = ["Turkish", "English", "French"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Sabit genişlik ekledik
      height: 30, // Sabit yükseklik ekledik
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: selectLanguage,
        icon: SizedBox.shrink(), // Sağdaki varsayılan oku kaldır
        underline: SizedBox(), // Alt çizgiyi kaldır
        isExpanded: true, // Genişlik uyumlu olsun
        items: languages.map((lang) {
          return DropdownMenuItem<String>(
            value: lang,
            child: Row(
              children: [
                Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                SizedBox(width: 6),
                Text(lang),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? select) {
          setState(() {
            selectLanguage = select!;
          });
        },
      ),
    );
  }
}
