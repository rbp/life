class Generation {
  final int number;
  final Set<Position> living;

  Generation({required this.number, required this.living});
}

class Position {
  final int x;
  final int y;

  Position(this.x, this.y);

  bool operator ==(other) =>
      other is Position && this.x == other.x && this.y == other.y;

  @override
  int get hashCode => '${this.x}|${this.y}'.hashCode;

  @override
  String toString() {
    return 'Position(${this.x}, ${this.y})';
  }
}
