package;

import flash.events.MouseEvent;
import openfl.display.StageDisplayState;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Lib;
import openfl.events.Event;
import openfl.ui.Mouse;
import MotionBlur;

/**
 * This is a Butterfly Simulator, it uses MotionBlur auto tracking effect
 * @author Mathieu Guinin
 */
class Main extends Sprite 
{
	public function new() 
	{
		super();
		//add the background
		addChild(new Bitmap(Assets.getBitmapData("img/summer-flowers.jpg")));
		
		// Assets:
		var papillon = new Sprite();
		var bitmap = new Bitmap();
		var frames = new Array<BitmapData>();
		
		bitmap.x = -125;
		bitmap.y = -155;
		papillon.addChild(bitmap);
		
		// Load the butterfly frames
		for (i in 0...10) {
			frames.push(Assets.getBitmapData("img/_papillon_" + i + ".png"));
		}
		
		addChild(papillon);
		
		// flapping make the butterfly oscillate
		var vx:Float = 0, vy:Float = -7, dx:Float = 0, dy:Float = 0;
		
		// butterfly position update at each frame
		papillon.addEventListener(Event.ENTER_FRAME, function (e:Event) {
			
			// butterfly turns its body in the direction of the horizontal movement
			if (papillon.x > mouseX + 3)
				papillon.scaleX = -1;
			if (papillon.x < mouseX - 3)
				papillon.scaleX = 1;
				
			// butterfly adjusts its air flow to go up or down
			papillon.rotation = papillon.scaleX * (- mouseY - dy + papillon.y);
			
			dx += vx;
			dy += vy;
			// Mouse position + flapping oscillations
			papillon.x = mouseX + dx;
			papillon.y = mouseY + dy;
		});
		
		// Add the motion blur effect
		var blur = new MotionBlur(papillon, MotionBlurQuality.HIGH);
		// source_lumiere (means light source), set greater than 1 for bright light like fire
		//blur.source_lumiere(1);
		
		Mouse.hide();
		
		var i = 1; // current frame
		var direction = 1; // animation goes forward and backward
		addEventListener(Event.ENTER_FRAME, function(e:Event) {
			if (i == 9)
				direction = -1;
			if (i == 0)
				direction = 1;
			i += direction;
			vy += 2*direction; // flapping direction affecte vertical speed
			bitmap.bitmapData = frames[i];
		});
		
		addEventListener(MouseEvent.CLICK, function ToggleFullSreen(e:MouseEvent) {
			if (Lib.current.stage.displayState == StageDisplayState.FULL_SCREEN)
				Lib.current.stage.displayState = StageDisplayState.NORMAL;
			else
				Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN;
		});
	}

}
