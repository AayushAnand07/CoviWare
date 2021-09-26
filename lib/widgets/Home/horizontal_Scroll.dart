import 'package:flutter/material.dart';

import 'Horizontal_scroll_Tile.dart';

class CategoriesScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              CustomHorizontalTile('Fever', 'assets/images/1.png',
                  Colors.blue.shade400, context),
              CustomHorizontalTile('Dry Cough', 'assets/images/2.png',
                  Colors.green.shade400, context),
              CustomHorizontalTile('Headache', 'assets/images/3.png',
                  Colors.deepOrange.shade400, context),
              CustomHorizontalTile('Chest Pain', 'assets/images/4.png',
                  Colors.brown.shade400, context),
            ],
          ),
        ),
      ),
    );
  }
}
