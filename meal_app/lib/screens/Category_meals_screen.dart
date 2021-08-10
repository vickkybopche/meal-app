import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  
  static const routeName = '/category-meal';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {


  String categoryTitle ="";
  List<Meal> displayMeals=[];
  var _loadedInitData = false;

  
 

  @override
  void didChangeDependencies() {
    if(!_loadedInitData)
    {
      final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];
    displayMeals = widget.availableMeals
        .where((meals) => meals.categories.contains(categoryId))
        .toList();
        _loadedInitData = true; 
    }

    
    super.didChangeDependencies();
  }

  void _removeMeals(String mealId) {
    setState(() {
      displayMeals.removeWhere((Meal)=> Meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle as String),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              duration: displayMeals[index].duration,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              imageUrl: displayMeals[index].imageUrl,
              title: displayMeals[index].title,
              id: displayMeals[index].id,
              removeItem: _removeMeals,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
