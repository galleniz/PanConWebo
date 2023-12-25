package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var gameData = {
		width: 640,
		height: 480,
		fps: 60
	}

	public function new()
	{
		super();
		addChild(new FlxGame(gameData.width, gameData.height, states.PlayState, gameData.fps, gameData.fps));
	}
}
