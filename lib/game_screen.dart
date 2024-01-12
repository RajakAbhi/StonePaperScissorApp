// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rock_paper_scissor/Game.dart';
import 'package:flutter_rock_paper_scissor/Gamebutton.dart';
import 'package:flutter_rock_paper_scissor/HomeScreen.dart';
class gameScreen extends StatefulWidget {
   gameScreen( this.gamechoice,{Key? key, required String choice}):super(key: key);
  choice gamechoice;
  @override
  State<gameScreen> createState() => _gameScreenState();   
}
class _gameScreenState extends State<gameScreen> {
  String? randomchoice( ) {
    // ignore: unnecessary_new
    Random random = new Random();
    int robotChoiceIndex=random.nextInt(3); 
    return Game.choices[robotChoiceIndex];
  }
  @override
  Widget build(BuildContext context) {

   String? robotChoice = randomchoice()!;
   String? robotChoicePath;
    switch(robotChoice) {
     case "Rock":
     robotChoicePath = "assets/3313783-middle.png";
     break;
     case "Paper":
     robotChoicePath = "assets/3313779-middle.png";
     break;
     case "Scissors":
     robotChoicePath = "assets/3313815-middle.png";
     break;
     default: 
    }
    String? playerChoice;
    switch(widget.gamechoice.type) {
     case "Rock":
     playerChoice= "assets/3313783-middle.png";
     break;
     case "Paper":
     playerChoice = "assets/3313779-middle.png";
     break;
     case "Scissors":
     playerChoice = "assets/3313815-middle.png";
     break;
     default: 
    }

    if(choice.gameRule[widget.gamechoice.type]![robotChoice]=="You win") {
      setState(() {
       Game.score++;  
            });
    }
    double btnwidth = MediaQuery.of(context).size.width/2-40;
    return  Scaffold(
      backgroundColor: const Color(0xff060a47),
      appBar: AppBar(
        title:  const Text("My Game"),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("SCORE",style: TextStyle(
                    color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold
                  ),),
                   Text("${Game.score}",style: const TextStyle(
                    color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              ),

              // ignore: sized_box_for_whitespace
              
                Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(tag: "${widget.gamechoice.type}", 
                      child: Gamebutton(() {}, playerChoice!, btnwidth-20),),
                      const Text("VS",style:  TextStyle(
                        color: Colors.white,fontSize: 26),),
                        AnimatedOpacity(opacity: 1, duration: const Duration(seconds: 2),
                        child:Gamebutton( () {},robotChoicePath!   ,btnwidth-20),
                        )
                    ],
                  )
                ), 
              ),
              // ignore: sized_box_for_whitespace
              Text("${choice.gameRule[widget.gamechoice.type]![robotChoice]}",
              style: const TextStyle(color:Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,),),
              // ignore: sized_box_for_whitespace      
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context)=>HomeScreen(),));
                  },
                  padding: const EdgeInsets.all(16),
                  shape: const StadiumBorder(side: BorderSide(color: Colors.white,width: 5.0)),
                  child: const Text("Play Again",style: TextStyle(
                    color: Colors.white,fontSize: 24,
                  ),),),
              ),
              const SizedBox(height: 20,),
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: (){},
                  shape: const StadiumBorder(side: BorderSide(color: Colors.white,width: 5.0)),
                  child: const Text("RULES",style: TextStyle(
                    color: Colors.white,fontSize: 24,
                  ),),),
              ),
          ],
          
        ),
      ),
    );
  }
}