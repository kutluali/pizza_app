import 'package:flutter/material.dart';
import 'package:pizza_app/Model/custom_colors.dart';
import 'package:pizza_app/Views/basket_page.dart';
import 'package:pizza_app/Views/book_page.dart';
import 'package:pizza_app/Views/favorite_page.dart';
import 'package:pizza_app/Views/product_page.dart';
import 'package:pizza_app/Views/profile_page.dart';

class ButtonNavigationBar1 extends StatefulWidget {
  const ButtonNavigationBar1({super.key});

  @override
  State<ButtonNavigationBar1> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar1> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProductPage(),
    BookPage(),
    BasketPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem customNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        height: 56, // Seçildiğinde beyaz çemberin dizaynı
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? CustomColors.primary : Colors.white,
        ),
      ),
      label: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(22),
        child: ClipRRect(
          //Eğer ClipRRect kullanmazsan, borderRadius verse bile köşeler düz kalır çünkü clip işlemi yapılmaz.
          borderRadius: BorderRadius.circular(35),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              elevation: 5,
              selectedFontSize: 0, // Görüntü kaymmaması
              unselectedFontSize:
                  0, // Görüntü kaymmaması için label olan kısma bu sebeple ekledik
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                customNavItem(Icons.home_sharp, 0),
                customNavItem(Icons.book, 1),
                customNavItem(Icons.shopping_bag_rounded, 2),
                customNavItem(Icons.favorite_border_outlined, 3),
                customNavItem(Icons.person, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
