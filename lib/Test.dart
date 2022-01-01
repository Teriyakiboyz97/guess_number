// ignore_for_file: avoid_print
import 'dart:io';

import 'dart:math';

import 'package:guess_number/game.dart';

void main() {
  var r = Random();
  var answer = r.nextInt(100);
  var count = 0;
  var game = Game();
  print("╔═════════════════════════════════════════ ");
  print("║                GUESS THE NUMBER    ");


  for (int i = 0;;) {
    stdout.write('║ Enter a Maximum Number To Random:');
    var input = stdin.readLineSync();
    if (count == 1) {
      stdout.write('play again (Y/N):');
      var ans = stdin.readLineSync();
      String Y = 'Y';
      String y = 'y';
      String N = 'N';
      String n = 'n';
      if (ans == Y || ans == y) {
        count--;
        continue;
      }
      else if(ans == N || ans == n){
        break;
    }
    }
      for (int i = 0;;) {
        print("║─────────────────────────────────────────");
        stdout.write('║ Guess number between 1 and 100:');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);
        if (guess != null) {
          var result = game.DoGuess(guess);
          var Counting = game.DoCount(guess);
          if (result == 0) {
            print("║ ➜ $guess is correct ❤" + ", Total guesses: $Counting");
            count++;
            break;
          } else if (guess != 0) {
            if (result == -1) {
              print("║ ➜ $guess is TOO LOW! ▼");
            } else if (result == 1) {
              print("║ ➜ $guess is TOO HIGH! ▲");
            }
          }
        }
      }
      print("║─────────────────────────────────────────");
      print("║                 THE END             ");
      print("╚═════════════════════════════════════════");
    }
  }
