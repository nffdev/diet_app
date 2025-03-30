import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import '../components/custom_badge.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  
  String _selectedDifficulty = 'Easy';
  String _selectedCategory = 'Main dish';
  
  List<String> _difficulties = ['Easy', 'Medium', 'Hard'];
  List<String> _categories = ['Main dish', 'Starter', 'Dessert', 'Snack', 'Drink'];

  @override
  void dispose() {
    _titleController.dispose();
    _prepTimeController.dispose();
    _cookTimeController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recipe saved successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                label: 'Recipe Title',
                hintText: 'Enter recipe title',
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              
              Row(
                children: [
                  Expanded(
                    child: CustomInput(
                      label: 'Prep Time',
                      hintText: 'e.g. 15 min',
                      controller: _prepTimeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomInput(
                      label: 'Cook Time',
                      hintText: 'e.g. 30 min',
                      controller: _cookTimeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              
              Text(
                'Difficulty',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _difficulties.map((difficulty) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDifficulty = difficulty;
                      });
                    },
                    child: CustomBadge(
                      label: difficulty,
                      backgroundColor: _selectedDifficulty == difficulty 
                          ? Colors.black 
                          : Colors.grey.shade200,
                      textColor: _selectedDifficulty == difficulty 
                          ? Colors.white 
                          : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              
              SizedBox(height: 16),
              Text(
                'Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: CustomBadge(
                      label: category,
                      backgroundColor: _selectedCategory == category 
                          ? Colors.black 
                          : Colors.grey.shade200,
                      textColor: _selectedCategory == category 
                          ? Colors.white 
                          : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              
              SizedBox(height: 16),
              CustomInput(
                label: 'Ingredients',
                hintText: 'Enter ingredients, one per line',
                controller: _ingredientsController,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ingredients';
                  }
                  return null;
                },
              ),
              
              CustomInput(
                label: 'Instructions',
                hintText: 'Enter cooking instructions',
                controller: _instructionsController,
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter instructions';
                  }
                  return null;
                },
              ),
              
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: Text('Save Recipe'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
