import 'package:flutter/material.dart';
import 'package:liquid/demo_data.dart';
import 'package:liquid/drink_data.dart';
import 'package:liquid/drink_list_card.dart';

class LiquidScreen extends StatefulWidget {
  const LiquidScreen({Key? key}) : super(key: key);

  @override
  _LiquidScreenState createState() => _LiquidScreenState();
}

class _LiquidScreenState extends State<LiquidScreen> {
  double _listPadding = 20;
  DrinkData? _selectedDrink;
  ScrollController _scrollController = ScrollController();
  late List<DrinkData> _drinks;
  int _earnedPoints = 0;

  @override
  void initState() {
    DemoData demoData = DemoData();
    _drinks = demoData.drinks;
    _earnedPoints = demoData.earnedPoints;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22222b),
      body: Theme(
        data: ThemeData(primarySwatch: Colors.orange),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: _drinks.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return _buildListItem(index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: _listPadding / 2, horizontal: _listPadding),
      child: DrinkListCard(
        drinkData: _drinks[index],
        onTap: _handleDrinkTapped,
        earnedPoints: _earnedPoints,
        isOpen: _drinks[index] == _selectedDrink,
      ),
    );
  }

  void _handleDrinkTapped(DrinkData data) {
    setState(() {
      if (_selectedDrink == data) {
        _selectedDrink = null;
      }
      else {
        _selectedDrink = data;
      }
    });
  }
}
