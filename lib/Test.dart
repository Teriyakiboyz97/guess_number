// ignore_for_file: avoid_print
import 'dart:io';

import 'dart:math';


void main() {
  var r = Random();
  var answer = r.nextInt(100);
  var count = 0;
  print("╔═════════════════════════════════════════ ");
  print("║                GUESS THE NUMBER    ");
  for (int i = 0;;) {
    print("║─────────────────────────────────────────");
  stdout.write('║ Guess number between 1 and 100:');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess != null) {
      if (guess == answer) {
        count++;
        print("║ ➜ $guess is correct ❤" + ", Total guesses: $count");
        break;
      }
      else if (guess != answer) {
        if (guess < answer) {
          print("║ ➜ $guess is TOO LOW! ▼");
        }
        else if (guess > answer) {
          print("║ ➜ $guess is TOO HIGH! ▲");
        }
        count++;
      }
    }
  }
  print("║─────────────────────────────────────────");
  print("║                 THE END             ");
  print("╚═════════════════════════════════════════");
}
