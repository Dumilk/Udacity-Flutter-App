import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';

final _backgroundColor = Colors.teal[100];

class CategoryScreen extends StatefulWidget
{

  @override
  _CategoryRouteState createState() => _CategoryRouteState();


} 

class _CategoryRouteState extends State<CategoryScreen>
{
  static const _appBarTitleText= "Unit Converter";
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Energy',
    'Time',
    'Digital Storage',
    'Currency'
  ];


  static const _icons = <Icon>[];

  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
];

  final _categories = <Category>[];

  @override
  Widget build(BuildContext context)
  {
    
    final listView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(_categories)
    );

    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        _appBarTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black
          ),
        ),
      elevation: 0.0,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: appBar,
      body: listView,
      );
  }

  void initState() { 

    super.initState();

    for (var i = 0; i < _categoryNames.length; i++) 
    {
      _categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  Widget _buildCategoryWidgets(List<Widget> categories)
  {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => categories[index]
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName)
  {
      return List.generate(10, (int i) {
        i += 1;
        return Unit(
          name: '$categoryName Unit $i',
          conversion: i.toDouble(),
        );
      });
  }
}