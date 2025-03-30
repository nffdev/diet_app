import 'package:flutter/material.dart';
import '../components/custom_badge.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Map<String, dynamic> recipe;
  
  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late bool _isFavorite;
  
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.recipe['isFavorite'] ?? false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit recipe screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Icon(
                Icons.restaurant_menu,
                size: 80,
                color: Colors.grey.shade600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe['title'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CustomBadge(label: widget.recipe['difficulty']),
                      SizedBox(width: 8),
                      CustomBadge(label: widget.recipe['category']),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.timer,
                          title: 'Prep Time',
                          value: widget.recipe['prepTime'],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.local_fire_department,
                          title: 'Cook Time',
                          value: widget.recipe['cookTime'],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildSection(
                    title: 'Ingredients',
                    content: widget.recipe['ingredients'] ?? 
                      '• 1 whole chicken\n• 2 tbsp olive oil\n• 3 cloves garlic, minced\n• 1 tbsp fresh rosemary\n• 1 tbsp fresh thyme\n• Salt and pepper to taste',
                  ),
                  SizedBox(height: 24),
                  _buildSection(
                    title: 'Instructions',
                    content: widget.recipe['instructions'] ?? 
                      '1. Preheat oven to 425°F (220°C).\n\n2. Mix olive oil, garlic, rosemary, thyme, salt, and pepper in a small bowl.\n\n3. Rub the mixture all over the chicken, including under the skin.\n\n4. Place chicken in a roasting pan and roast for 1 hour and 20 minutes, or until juices run clear.\n\n5. Let rest for 10 minutes before carving.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
