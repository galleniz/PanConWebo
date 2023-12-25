package;

import flixel.FlxG;
import flixel.system.FlxAssets;
import flixel.system.FlxBasePreloader;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

class AppPreloader extends FlxBasePreloader
{
	var _buffer:Sprite;

	public var text:TextField;

	override public function new(MinDisplayTime:Float = #if !debug 6 #else 1 #end, ?AllowedURLs:Array<String>):Void
	{
		super(MinDisplayTime, AllowedURLs);
	}

	override function create():Void
	{
		_buffer = new Sprite();
		_buffer.scaleX = _buffer.scaleY = 2;
		addChild(_buffer);

		text = new TextField();
		text.defaultTextFormat = new TextFormat("assets/fonts/logga.otf", 6, 0xFFFFFF);
		text.embedFonts = true;
		text.selectable = false;
		text.multiline = false;
		text.x = 2;
		text.y = (Main.gameData.height / 2) - (text.height / 2);

		text.width = Main.gameData.width;
		text.x = (Main.gameData.width / 4) - text.width / 4;

		_buffer.addChild(text);
	}

	override function destroy():Void
	{
		if (_buffer != null)
		{
			removeChild(_buffer);
		}
		_buffer = null;

		text = null;
		super.destroy();
	}

	override public function update(Percent:Float):Void
	{
		trace(Percent);
		text.width = Main.gameData.width;

		text.text = '${FlxG.VERSION} | ${info.Version.VERSION_ENGINE} | Loading ${Std.int(Percent * 100)}%';
	}
}
