import 'package:flutter/material.dart';
import 'custom_badge.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String prepTime;
  final String cookTime;
  final String difficulty;
  final String category;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.prepTime,
    required this.cookTime,
    required this.difficulty,
    required this.category,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        margin: EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.restaurant_menu, size: 50, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title, 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 16),
                        SizedBox(width: 5),
                        Text("Prep: $prepTime"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department, size: 16),
                        SizedBox(width: 5),
                        Text("Cook: $cookTime"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CustomBadge(label: difficulty),
                        SizedBox(width: 5),
                        CustomBadge(label: category),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onFavoriteToggle,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border, 
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
