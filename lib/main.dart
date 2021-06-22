import 'package:flutter/material.dart';
import 'package:life/gen.dart';
import 'package:life/theme.dart';

void main() {
  runApp(LifeApp());
}

class LifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fakeGeneration = Generation(number: 0, living: {
      Position(0, 0),
      Position(0, 1),
      Position(0, -1),
      Position(0, 2),
    });
    return MaterialApp(
      title: 'Life',
      theme: lifeTheme,
      home: LifeGrid(generation: fakeGeneration),
    );
  }
}

class LifeGrid extends StatelessWidget {
  final Generation generation;

  LifeGrid({required this.generation});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final int cellSize = 10; // logical pixels
    final int lifeXCount = (screenSize.width / cellSize).ceil();
    final int lifeYCount = (screenSize.height / cellSize).ceil();
    final midpointX = (lifeXCount / 2).ceil();
    final midpointY = (lifeYCount / 2).ceil();

    final Widget alive = DecoratedBox(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 51, 255, 51),
            border: Border.all(color: Colors.black, width: 0.1)));
    final Widget dead = DecoratedBox(
        decoration: BoxDecoration(
            color: Color.fromARGB(250, 40, 40, 40),
            border: Border.all(color: Colors.black, width: 0.1)));

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: lifeXCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          Position indexCellPosition =
              Position((index % lifeXCount), (index / lifeXCount).floor());
          Position logicalPosition =
              gridToLogicalPosition(indexCellPosition, midpointX, midpointY);
          return this.generation.living.contains(logicalPosition)
              ? alive
              : dead;
        });
  }

  Position gridToLogicalPosition(
      Position positionInGrid, int gridOffsetX, int gridOffsetY) {
    return Position(
        positionInGrid.x - gridOffsetX, positionInGrid.y - gridOffsetY);
  }
}
