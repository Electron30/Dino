
import 'package:dino/dinogame/dinogame.dart';
import 'package:dino/dinogame/ground.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';



const int  GRAVITY =1500;


class Dino extends SpriteAnimationComponent with HasGameRef<DinoGame>,CollisionCallbacks {
   Dino();
  final velocity = 150;
  final double jumpHeight = 100;
  bool hasjumped = false;
  bool landed = true;
  
  double speedY =0.0;

  @override 
  Future<void> onLoad() async {
    final DinoGame game;
    final image = await Flame.images.load("dinoassets/dino/dino_finally.png");
    size = Vector2(40, 40);
    position = Vector2(15, (gameRef.size.y - size.y)/2 -50);
    var dinoAnimation = SpriteAnimation.fromFrameData(image,
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1, textureSize: Vector2(66, 71)));
    animation = dinoAnimation;
    add(CircleHitbox());
    gameRef.pauseEngine();
   
  }
  
  @override
  void render(Canvas canvas){
    super.render(canvas);
    
  }
  @override
  void update(double dt){
      super.update(dt);
      speedY += GRAVITY * dt * isGrounded();
      
      position.y += speedY *dt;
      if(isGrounded()==0){
        speedY = 0.0;
        position.y = (gameRef.size.y - size.y)/2 -10;
      }
      
      
  }


  void jump () {
    if(position.y - (gameRef.size.y - size.y)/2 +10 ==0){

      speedY=-600;
    }
    
    
  }
  
  int isGrounded(){
    if(position.y - (gameRef.size.y - size.y)/2 +10>=0.001){
      return 0;
    } 
    else{
      return 1;
    }
  }  

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    print("hit an object");
    gameOver();
  }

  void gameOver() async{

      gameRef.pauseEngine();
      game.overlays.add("GameOver");
      game.gamover();
      
  }


  void reset(){
     position.y = (gameRef.size.y - size.y)/2 -10;
     speedY = 0;
  }
}