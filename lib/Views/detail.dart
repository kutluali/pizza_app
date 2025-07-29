import 'package:flutter/material.dart';
import 'package:pizza_app/Model/custom_colors.dart';
import 'package:pizza_app/Widgets/custom_app_bar.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // flu grey background
      body: Column(
        children: [
          Stack(
            children: [
              // Arka plan ve ürün resmi için Container
              Container(
                height: 400,
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    'images/pepperoniPizza1.png', // ürün resmi (ortalı)
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Geri dön butonu (sol üst)
              Positioned(
                top: 40,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.blueGrey.shade500,
                        size: 14,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),

              // Favori butonu (sağ üst)
              Positioned(
                top: 40,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.blueGrey.shade500,
                      ),
                      onPressed: () {
                        // Favori ekle işlemi
                      },
                    ),
                  ),
                ),
              ),
              // Adet butonları
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // azalt
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18,
                          ), // 🔽 Daha küçük
                        ),
                        SizedBox(width: 8),
                        Text(
                          "02",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ), // 🔽 Küçük yazı
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // arttır
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ), // 🔽 Daha küçük
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), // üst sol köşe
                  topRight: Radius.circular(30), // üst sağ köşe
                ),
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        "Pepperoni Pizza",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(" 4.5"),
                    ],
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Baked to perfection on a crispy golden crust,  this pizza delivers the perfect balance of bold flavors  and cheesy goodness...",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: "Read More",
                          style: TextStyle(color: CustomColors.primary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset("images/clock.png"),
                          Text(
                            "8-10 Min",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Image.asset("images/medium.png"),
                          Text(
                            "Medium",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Image.asset("images/fire.png"),
                          Text(
                            "250 Kcal",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Toppings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.asset("images/icon1.png"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.asset("images/icon2.png"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          child: Image.asset("images/icon3.png"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.asset("images/icon4.png"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.asset("images/icon5.png"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "\$10.00",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "\$10.00",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add to Bag",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(200, 55),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
