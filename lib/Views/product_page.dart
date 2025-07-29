import 'package:flutter/material.dart';
import 'package:pizza_app/Model/custom_colors.dart';
import 'package:pizza_app/Views/detail.dart';
import 'package:pizza_app/Widgets/custom_app_bar.dart';
import 'package:pizza_app/Widgets/pizza_card.dart';
import 'package:pizza_app/data/favorites.dart' as favorites;
import 'package:pizza_app/data/pizza_data.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedCategory = "All Pizzas";
  final List<String> categories = ["All Pizzas", "Vegetarian", "Specials"];

  // Her pizza için like durumunu tutacak Set
  Set<String> likedPizzas = <String>{};
  // Like durumunu toggle eden fonksiyon

  // toggleLike fonksiyonunu şöyle yap:

  void toggleLike(String pizzaId) {
    setState(() {
      if (favorites.likedPizzas.contains(pizzaId)) {
        favorites.likedPizzas.remove(pizzaId);
      } else {
        favorites.likedPizzas.add(pizzaId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPizzas = pizzaData[selectedCategory] ?? [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        orderWidgets: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade100,
          ),
          child: Icon(Icons.notifications),
        ),
        locationWidget: Text("New York, USA"),
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Special Offer Card
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.card,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      top: 10,
                      left: 30,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Special Offer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("Discount 20% off applied at checkout"),
                              SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColors.primary,
                                  foregroundColor: CustomColors.white,
                                ),
                                onPressed: () {},
                                child: Text("Order Now"),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Image.asset("images/pizzaProduct.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Başlık ve See All
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Pizza",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: CustomColors.primary),
                    ),
                  ],
                ),
              ),

              // Kategori Seçici
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 0 : 8,
                        right: index == categories.length - 1 ? 0 : 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? CustomColors.primary
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              // Pizza Listesi - Sizin card metodunuzu kullanarak
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: currentPizzas.length,
                itemBuilder: (context, index) {
                  final pizza = currentPizzas[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail()),
                      );
                    },
                    child: PizzaCard(
                      pizzaId: pizza["id"],
                      imagesName: pizza["imagesName"],
                      titleText: pizza["titleText"],
                      titleSubText: pizza["titleSubText"],
                      minSize: pizza["minSize"],
                      point: pizza["point"],
                      disCount: pizza["disCount"],
                      price: pizza["price"],
                      isLiked: favorites.likedPizzas.contains(pizza["id"]),
                      onLikeToggle: () => toggleLike(pizza["id"]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
