import 'package:flutter/material.dart';

void main() {
  runApp(DietApp());
}

class DietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipesScreen(),
    );
  }
}

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diet App", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Recipes", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(label: "All", selected: true),
                FilterButton(label: "Main dish"),
                FilterButton(label: "Starter"),
                FilterButton(label: "Dessert"),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  RecipeCard(
                    title: "Roast chicken with herbs",
                    prepTime: "15 min",
                    cookTime: "1h 30min",
                    difficulty: "Easy",
                    category: "Main dish",
                    isFavorite: true,
                  ),
                  RecipeCard(
                    title: "Mushroom risotto",
                    prepTime: "20 min",
                    cookTime: "30 min",
                    difficulty: "Medium",
                    category: "Main dish",
                    isFavorite: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String prepTime;
  final String cookTime;
  final String difficulty;
  final String category;
  final bool isFavorite;

  const RecipeCard({
    required this.title,
    required this.prepTime,
    required this.cookTime,
    required this.difficulty,
    required this.category,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      Badge(label: difficulty),
                      SizedBox(width: 5),
                      Badge(label: category),
                    ],
                  ),
                ],
              ),
            ),
            Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final String label;

  const Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}
