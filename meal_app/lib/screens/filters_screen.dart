import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal_app/screens/main_drawer.dart';

class FlitersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters ;
  FlitersScreen(this.saveFilters);

  @override
  _FlitersScreenState createState() => _FlitersScreenState();
}

class _FlitersScreenState extends State<FlitersScreen> {
  var _glutenFree = false;
  var _lactosFree = false;
  var _vegitarian = false;
  var _vegan = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(
              onPressed: ()
              {
                final selectedFilters = 
                {
                  'gluten': false,
                  'lactos': false,
                  'vegeterian': false,
                  'vegan': false,
                };
                widget.saveFilters(selectedFilters);}, 
              icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your filters",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    "Gluten Free", "Only Include gluten Free",
                     _glutenFree,
                    (newValue) {
                       setState(() {
                        _glutenFree = newValue;
                      });
                  ;
                }),
                _buildSwitchListTile(
                    "Lactose Free", "Only Include Lactose Free", 
                    _lactosFree,
                    (newValue) {
                       setState(() {
                         _lactosFree = newValue;
                      });
                 
                }),
                _buildSwitchListTile(
                    "Vegiterian", "Only Include Vegiterian",
                     _vegitarian,
                    (newValue) {
                       setState(() {
                        _vegitarian = newValue;
                      });
                  
                }),
                _buildSwitchListTile(
                    "Vegan", "Only Include Vegan", 
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                  
                })
              ],
            ))
          ],
        ));
  }
}
