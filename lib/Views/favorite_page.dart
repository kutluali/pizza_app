import 'package:flutter/material.dart';
import 'package:pizza_app/data/favorites.dart' as favorites;
import 'package:pizza_app/data/pizza_data.dart';
import 'package:pizza_app/Widgets/pizza_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // Favorideki pizza ID'lerine göre detayları bul
    final Set<String> addedIds = {};
    final List<Map<String, dynamic>> favoritePizzas = [];

    for (var category in pizzaData.values) {
      for (var pizza in category) {
        final pizzaId = pizza["id"];
        if (favorites.likedPizzas.contains(pizzaId) &&
            !addedIds.contains(pizzaId)) {
          favoritePizzas.add(pizza);
          addedIds.add(pizzaId);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        automaticallyImplyLeading: false,
      ),
      body: favoritePizzas.isEmpty
          ? Center(child: Text("No favorite pizzas yet!"))
          : ListView.builder(
              itemCount: favoritePizzas.length,
              itemBuilder: (context, index) {
                final pizza = favoritePizzas[index];
                return PizzaCard(
                  pizzaId: pizza["id"],
                  imagesName: pizza["imagesName"],
                  titleText: pizza["titleText"],
                  titleSubText: pizza["titleSubText"],
                  minSize: pizza["minSize"],
                  point: pizza["point"],
                  disCount: pizza["disCount"],
                  price: pizza["price"],
                  isLiked: true,
                  onLikeToggle: () {
                    setState(() {
                      favorites.likedPizzas.remove(pizza["id"]);
                    });
                  },
                );
              },
            ),
    );
  }
}
