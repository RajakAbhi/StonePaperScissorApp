
// ignore_for_file: file_names, camel_case_types
import 'dart:math';

class Game {
  static int score = 0;
static  List<String> choices={"Rock","Paper","Scissors"}.toList();
 static  String? randomchoice() {
  // ignore: unnecessary_new
  Random random =  new Random(); 
  int robotChoiceIndex = random.nextInt(3);
  return choices[robotChoiceIndex];
}
}  
class choice { 
  String?type ="";
  static var gameRule ={  
    "Rock": {
      "Rock": "It's a draw",
      "Paper": "You lose",
      "Scissors": "You win",
    },
    "Paper": {
      "Rock": "You win",
      "Paper": "It's a draw",
      "Scissors": "You lose",
    },
    "Scissors": {
      "Rock": "You lose",
      "Paper": "You win",
      "Scissors": "It's a draw",
    },
  };
  choice(this.type);
}