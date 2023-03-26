

import 'package:dino/dinogame.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';



class Cloud extends SpriteComponent with HasGameRef {
  Cloud();
  var speed = 100;
  
  @override
  Future<void> onLoad() async {

    final image = await Flame.images.load("cloud.png");
    position = Vector2(0, (gameRef.size.y - size.y)/2 -200);
    final first_position = position;
    size = Vector2(100, 40);
    sprite = Sprite(image);

  }

  void update(dt) {
    

    if (position.x < -100) {

      speed = 0;
      respawn();
    }
    else{
      position.x -= speed * dt;
      
    }
  }




  void respawn(){

    position.x = gameRef.size.x;
    speed = 100;
  }
}
