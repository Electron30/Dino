import 'package:dino/dinogame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'overlays/game_over.dart';
import 'overlays/main_menu.dart';

void main() {

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
  



