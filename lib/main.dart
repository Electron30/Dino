import 'package:dino/dinogame/dinogame.dart';
import 'package:dino/tictactoe/main.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dinogame/overlays/game_over.dart';
import 'dinogame/overlays/main_menu.dart';
import 'package:dino/schulte-table/main.dart';

void main() {
  runApp(const CuatroMainMenu());
}

void runDino() {
  runApp(
    GameWidget<DinoGame>.controlled(
      gameFactory: DinoGame.new,
      overlayBuilderMap: {
        'MainMenu': (_, game) => MainMenu(game: game),
        'GameOver': (_, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['MainMenu'],
    ),
  );
}

void runSchulte() {
  runApp(const schulteGame());
  
}

void runTictactoe(){
  runApp(const TictactoeGame());
}

final ButtonStyle dinoGameButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Color.fromARGB(255, 255, 190, 190),
  fixedSize: const Size(155, 180),
  padding: const EdgeInsets.symmetric(horizontal: 0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
final ButtonStyle schulteGameButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Color.fromARGB(255, 218, 212, 255),
  fixedSize: Size(155, 180),
  padding: EdgeInsets.symmetric(horizontal: 0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
final ButtonStyle tictactoeGameButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Color.fromARGB(255, 90, 184, 255),
  fixedSize: Size(155, 180),
  padding: EdgeInsets.symmetric(horizontal: 0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
final ButtonStyle snakeGameButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Color.fromARGB(255, 164, 255, 216),
  fixedSize: Size(155, 180),
  padding: EdgeInsets.symmetric(horizontal: 0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

class CuatroMainMenu extends StatelessWidget {
  const CuatroMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pexels-lucie-liz-3165335.jpg"),
              fit: BoxFit.cover,
              opacity: 0.3
            ),
          ),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 55),
              SizedBox(
                  width: 320,
                  height: 100,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 227, 255),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow:const  [
                            BoxShadow(
                                color: Color.fromARGB(255, 150, 149, 149),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 1))
                          ]),
                      child: const Center(
                        child: Text(
                          "Cuatro",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 124, 124)),
                          textAlign: TextAlign.center,
                        ),
                      ))),
              SizedBox(height: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => runDino(),
                          style: dinoGameButtonStyle,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                
                                child: DecoratedBox(
                                  
                                  decoration: BoxDecoration(
                                    
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/dino.png")),
                                      borderRadius: BorderRadius.circular(8)),
                                      
                                ),
                              ),
                              SizedBox(height: 10),
                              const Text(
                                "Dino",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 101, 101, 101)),
                              )
                            ],
                          )),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){runSchulte();},
                          style: schulteGameButtonStyle,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/schulte.png")),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 5,
                                          color: Color.fromARGB(
                                              255, 106, 72, 158))),
                                ),
                              ),
                              SizedBox(height: 4),
                              const Text(
                                "Schulte-table",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 102, 162)),
                              )
                            ],
                          )),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => runTictactoe(),
                          style: tictactoeGameButtonStyle,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/tictactoe.png")),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              const Text(
                                "TicTacToe",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 16, 40, 86)),
                              )
                            ],
                          )),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () => runDino(),
                          style: snakeGameButtonStyle,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/snake.png")),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 10),
                              const Text(
                                "Snakeio",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 139, 74)),
                              )
                            ],
                          )),
                    ],
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
