import 'package:flutter/material.dart';
import 'package:dino/main.dart';
import '../dinogame.dart';

class MainMenu extends StatelessWidget {
  // Reference to parent game.
  final DinoGame game;
  const MainMenu({super.key, required this.game});
  void returnToMain(){
    runApp(const CuatroMainMenu());
  }
  @override
  Widget build(BuildContext context) {
    const backGroundColor = Color.fromRGBO(200, 200, 200, 1);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);
    const buttonTextColor = Color.fromRGBO(133, 133, 133, 1);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          height: 250,
          width: 300,
          decoration: const BoxDecoration(
            color: backGroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              height: 70,
              width: 70,
              child: Container(
                height: 30.0,
                width: 40.0,
                child: Image.asset(
                  'assets/images/dinoassets/dino/dino_6.png',
                    fit: BoxFit.fitWidth
                  )
                )
              ),
              const SizedBox(
              height: 10,
              width: 230,  
              ),
              SizedBox(
                width: 230,
                height: 50,
                
                child: ElevatedButton(
                  onPressed: () {
                    game.reset();
                    game.resumeEngine();
                    game.overlays.remove('MainMenu');
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: buttonTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
              height: 10,
              width: 240,  
              ),
              SizedBox(
                width: 230,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    game.reset();
                    game.resumeEngine();
                    game.overlays.remove('MainMenu');
                    runApp(MainMenu(game: game));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Main Menu',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: buttonTextColor,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}