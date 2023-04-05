import 'package:dino/dinogame/dinogame.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class Ground extends ParallaxComponent<DinoGame> {
  Ground();
  
  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('dino/ground.png');
    

    position = Vector2(0, -size.y/2 + 20);
    
    parallax = Parallax(
      [
        ParallaxLayer(
          ParallaxImage(image,fill: LayerFill.none),
        )
      ],
      size: Vector2(1, 2),
      
      baseVelocity: Vector2(300,0),

    );
    //add(SpriteComponent(sprite: Sprite(image),size: size));
  }

  void inspect(){
    print(position);
  }
  
}