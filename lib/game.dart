
import 'dart:math';

class Game {
  static const maxRandom = 100;
  int? _answer;
  var plus=0;
  Game() {
    var r = Random();
    _answer = r.nextInt(maxRandom) + 1;
  }

  int DoGuess(int num) {
    if (num > _answer!) {
      return 1;
    } else if (num < _answer!) {
      return -1;
    } else {
      return 0;
    }
  }

  int DoCount(int count) {
    if (count > _answer!) {
      plus++;
      return plus;
    } else if (count < _answer!) {
      plus++;
      return plus;
    } else {
      plus++;
      return plus;
    }
  }


}
