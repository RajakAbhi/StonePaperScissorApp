// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rock_paper_scissor/Game.dart';
import 'package:flutter_rock_paper_scissor/Gamebutton.dart';
import 'package:flutter_rock_paper_scissor/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double btnwidth = MediaQuery.of(context).size.width/2-40;
    return  Scaffold(
      backgroundColor: const Color(0xff060a47),
      appBar: AppBar(
        title:  const Text("My Game"),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
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
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width/2 - btnwidth/2-20,
                        child: Hero(
                          tag: "Rock",
                        child: Gamebutton(() {
                          // ignore: avoid_print
                          print("You choosed rock");
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>gameScreen(choice("Rock"), choice: ''),),);
                        }, "assets/rock.png", btnwidth),),),
                        Positioned(
                        top: btnwidth,
                        left: MediaQuery.of(context).size.width/2 - btnwidth-40,
                        child: Hero(
                          tag: "Paper",
                          child: Gamebutton(() {
                            // ignore: avoid_print
                            print("You choosed paper");
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>gameScreen(choice("Paper"), choice: '',),));
                          }, "assets/paper.png", btnwidth),
                        ),),
                        Positioned(
                          top: btnwidth,
                          right: MediaQuery.of(context).size.width/2-btnwidth-40,
                          child: Hero(
                            tag: "Scissors",
                            child: Gamebutton(() {
                              // ignore: avoid_print
                              print("You choosed scissors");
                               Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>gameScreen(choice("Scissors"), choice: '',),));
                            }, "assets/scissors.png", btnwidth),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  padding: const EdgeInsets.all(24.0),
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
