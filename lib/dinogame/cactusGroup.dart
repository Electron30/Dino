import 'package:dino/dinogame/dinogame.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';



class CactusGroup extends SpriteComponent with HasGameRef {
  CactusGroup();
  var speed = 300;
  
  @override
  Future<void> onLoad() async {

    final image = await Flame.images.load("dinoassets/cacti/cacti_group.png");
    position = Vector2(gameRef.size.x , (gameRef.size.y - size.y) / 2 - 40);
    final first_position = position;
    size = Vector2(60, 60);
    sprite = Sprite(image);
    add(RectangleHitbox());
    
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

    position.x = gameRef.size.x+1600;
    speed = 300;
  }
  void reset(){
    position = Vector2(gameRef.size.x , (gameRef.size.y - size.y) / 2 - 13);
  }
}
