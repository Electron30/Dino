import 'package:dino/dinogame/cactusGroup.dart';
import 'package:dino/dinogame/cactusLarge.dart';
import 'package:dino/dinogame/cactusLarge1.dart';
import 'package:dino/dinogame/cactusSmall.dart';
import 'package:dino/dinogame/cactusSmall1.dart';
import 'package:dino/dinogame/cloud.dart';
import 'package:dino/dinogame/dino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dino/dinogame/ground.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
class DinoGame extends FlameGame with TapDetector,HasCollisionDetection{

  DinoGame();
  late final _dino;
  late final _cactusGroup;
  late final _cactusLarge;
  late final _cactusLarge1;
  late final _cactusSmall;
  late final _cactussmall1;
  late final _gameOver;
  late final _ground;
  late final SharedPreferences prefs;
  int score = 0;
  double initscore = 0;
  int highscore = 0;
  TextComponent _scoreText = TextComponent();
   TextComponent _highscoreText = TextComponent();
  
  bool gameOver = false;
  
  @override
  Color backgroundColor() => const Color(0xFFeeeeee);
  Future<void> onLoad() async {
    final style = TextStyle(color: Color.fromARGB(255, 129, 129, 129),fontSize: 22,fontWeight: FontWeight.bold);
    final regular = TextPaint(style: style);
    prefs = await SharedPreferences.getInstance();
    bool gamover = false;
    
    addAll([
      _ground = Ground(),
      _dino = Dino(),
      Cloud(),
      _cactusGroup= CactusGroup(),
      _cactusLarge= CactusLarge(),
      _cactusLarge1= CactusLarge1(),
      _cactusSmall= CactusSmall(),
      _cactussmall1= CactusSmall1(),

    ]);
    score = 0;
    highscore = getInt(prefs.getInt('highscore'));
    _scoreText
        ..text =score.toString()
        ..y = 120
        ..x = size.x -120
        ..textRenderer = regular;

    _highscoreText
      ..text = 'Highscore: $highscore'
      ..y = 120
      ..x = 20
      ..textRenderer = regular;
    add(_scoreText);
    add(_highscoreText);
  }
  


  @override
  void onTap() {
    super.onTap();
    _dino.jump();
    
  }

  @override
  void update(double dt){
    super.update(dt);
    initscore += (60* dt);
    score = (initscore/10).floor().toInt();
    _scoreText.text = 'Score: $score';
  }
  void initializeGame(bool loadHud) {
    // Assume that size.x < 3200

  }

void reset() {
  super.resumeEngine();
  _ground.inspect();
  _cactusGroup.reset();
  _cactusLarge.reset();
  _cactusLarge1.reset();
  _cactusSmall.reset();
  _cactussmall1.reset();
  _dino.reset();
  score = 0;
  initscore = 0;
  
  highscore = getInt(prefs.getInt('highscore'));
  _highscoreText.text = "Highscore: $highscore";
}

void gamover(){
  if(score>highscore){
    prefs.setInt("highscore", score);
    
  }
  
  
}

int getInt(int? num){
  if(num ==null){
    prefs.setInt("highscore", 0);

    return 0;
  }
  else{
    return num;
  }


}
  
}