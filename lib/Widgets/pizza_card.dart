import 'package:flutter/material.dart';
import 'package:pizza_app/Model/custom_colors.dart';

class PizzaCard extends StatelessWidget {
  final String pizzaId,
      imagesName,
      titleText,
      titleSubText,
      minSize,
      point,
      disCount,
      price;
  final bool isLiked;
  final VoidCallback onLikeToggle;

  const PizzaCard({
    super.key,
    required this.pizzaId,
    required this.imagesName,
    required this.titleText,
    required this.titleSubText,
    required this.minSize,
    required this.point,
    required this.disCount,
    required this.price,
    required this.isLiked,
    required this.onLikeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.card,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10, right: 10),
          child: Row(
            children: [
              Expanded(flex: 30, child: Image.asset("images/$imagesName.png")),
              SizedBox(width: 10),
              Expanded(
                flex: 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          titleText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: onLikeToggle,
                          child: Icon(
                            isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            size: 22,
                            color: isLiked ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(titleSubText),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text("$minSize min"),
                        SizedBox(width: 8),
                        Icon(Icons.circle, size: 10),
                        SizedBox(width: 4),
                        Text(point),
                        SizedBox(width: 8),
                        Icon(Icons.star_rate_rounded, color: Colors.amber),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$$price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.primary,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            "$disCount% Off",
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.add_circle_outlined, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
