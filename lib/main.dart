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

    final Widget alive = SizedBox(
      width: cellSize.toDouble(),
      height: cellSize.toDouble(),
      child: ColoredBox(color: Color.fromARGB(255, 51, 255, 51)),
    );
    final Widget dead = SizedBox(
      width: cellSize.toDouble(),
      height: cellSize.toDouble(),
      child: ColoredBox(color: Color.fromARGB(250, 40, 40, 40)),
    );

    return Table(
        border: TableBorder.all(color: Colors.black, width: 0.1),
        defaultColumnWidth: FixedColumnWidth(10),
        children: List.generate(
            lifeYCount,
            (row) => TableRow(
                    children: List.generate(lifeXCount, (col) {
                  Position indexCellPosition = Position(col, row);
                  Position logicalPosition = gridToLogicalPosition(
                      indexCellPosition, midpointX, midpointY);
                  return this.generation.living.contains(logicalPosition)
                      ? TableCell(child: alive)
                      : TableCell(child: dead);
                }).toList())).toList());
  }

  Position gridToLogicalPosition(
      Position positionInGrid, int gridOffsetX, int gridOffsetY) {
    return Position(
        positionInGrid.x - gridOffsetX, positionInGrid.y - gridOffsetY);
  }
}
