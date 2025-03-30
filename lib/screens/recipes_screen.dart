import 'package:flutter/material.dart';
import '../components/filter_button.dart';
import '../components/recipe_card.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  String _selectedFilter = "All";
  List<Map<String, dynamic>> _recipes = [
    {
      "title": "Roast chicken with herbs",
      "prepTime": "15 min",
      "cookTime": "1h 30min",
      "difficulty": "Easy",
      "category": "Main dish",
      "isFavorite": true,
    },
    {
      "title": "Mushroom risotto",
      "prepTime": "20 min",
      "cookTime": "30 min",
      "difficulty": "Medium",
      "category": "Main dish",
      "isFavorite": false,
    },
    {
      "title": "Chocolate cake",
      "prepTime": "25 min",
      "cookTime": "45 min",
      "difficulty": "Medium",
      "category": "Dessert",
      "isFavorite": false,
    },
    {
      "title": "Caesar salad",
      "prepTime": "15 min",
      "cookTime": "0 min",
      "difficulty": "Easy",
      "category": "Starter",
      "isFavorite": true,
    },
  ];

  List<Map<String, dynamic>> get filteredRecipes {
    if (_selectedFilter == "All") {
      return _recipes;
    } else {
      return _recipes.where((recipe) => recipe["category"] == _selectedFilter).toList();
    }
  }

  void _toggleFavorite(int index) {
    setState(() {
      final recipeIndex = _recipes.indexWhere((recipe) => 
        recipe["title"] == filteredRecipes[index]["title"]);
      _recipes[recipeIndex]["isFavorite"] = !_recipes[recipeIndex]["isFavorite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diet App", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Recipes", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterButton(
                    label: "All", 
                    selected: _selectedFilter == "All",
                    onPressed: () => setState(() => _selectedFilter = "All"),
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    label: "Main dish", 
                    selected: _selectedFilter == "Main dish",
                    onPressed: () => setState(() => _selectedFilter = "Main dish"),
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    label: "Starter", 
                    selected: _selectedFilter == "Starter",
                    onPressed: () => setState(() => _selectedFilter = "Starter"),
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    label: "Dessert", 
                    selected: _selectedFilter == "Dessert",
                    onPressed: () => setState(() => _selectedFilter = "Dessert"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: filteredRecipes.isEmpty
                ? Center(
                    child: Text(
                      "No recipes found",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = filteredRecipes[index];
                      return RecipeCard(
                        title: recipe["title"],
                        prepTime: recipe["prepTime"],
                        cookTime: recipe["cookTime"],
                        difficulty: recipe["difficulty"],
                        category: recipe["category"],
                        isFavorite: recipe["isFavorite"],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(recipe: recipe),
                          ),
                        ),
                        onFavoriteToggle: () => _toggleFavorite(index),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipeScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Navigate to favorites
          } else if (index == 2) {
            // Navigate to settings
          }
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;
  
  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text("Recipe detail screen for ${recipe['title']}"),
      ),
    );
  }
}

class AddRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Recipe"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Text("Add recipe screen"),
      ),
    );
  }
}
