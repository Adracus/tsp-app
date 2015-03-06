library tsp_app.model.color;

class Color {
  static const BLACK = const Color._(0, 0, 0);
  static const WHITE = const Color._(255, 255, 255);
  static const RED = const Color._(255, 0, 0);
  static const GREEN = const Color._(0, 255, 0);
  static const BLUE = const Color._(0, 0, 255);
  
  final int r;
  final int g;
  final int b;
  final num a;
  
  const Color._(this.r, this.g, this.b, [this.a = 1]);
  
  Color(int r, int g, int b, [num a])
      : r = r >= 0 && r < 256 ? r : throw new RangeError.range(r, 0, 256),
        g = g >= 0 && g < 256 ? g : throw new RangeError.range(g, 0, 256),
        b = b >= 0 && b < 256 ? b : throw new RangeError.range(b, 0, 256),
        a = a >= 0 && a <= 1 ? a :
          throw new RangeError("a should be 0 <= a <= 1");
}