import 'package:flutter/material.dart';

import '../dinogame.dart';

class GameOver extends StatelessWidget {
  // Reference to parent game.
  final DinoGame game;
  const GameOver({super.key, required this.game});

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
          height: 200,
          width: 225,
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
              height: 30,
              width: 180,
              child: Container(
                height: 30.0,
                width: 40.0,
                child: Image.asset(
                  'assets/images/dino_gameover.png',
                    fit: BoxFit.fitWidth
                  )
                )
              ),
              const SizedBox(
              height: 10,
              width: 180,  
              ),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    game.reset();
                    game.overlays.remove('GameOver');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Play Again',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: buttonTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
              height: 10,
              width: 180,  
              ),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    game.reset();
                    game.overlays.remove('GameOver');
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