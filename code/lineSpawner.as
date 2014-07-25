package code 
{
	/**
	 * ...
	 * @author Griffen Fargo
	 */
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.Point;
	import flash.display.Stage;
	import flash.utils.Timer;
	
	import code.circleSpawner;
	
	
	public class lineSpawner extends MovieClip
	{
			//Public
		public var lineThickness:Number = 1;
		public var lineSizeFallout:Number = .15;
		public var lineEnlargeMax:Number = 4.5;
		public var lineEnlargeMin:Number = 1;
		public var lineAlpha:Number = 0;
		
			//Private
		private var oldLinePoint:Point; //Line Start
		private var newLinePoint:Point; //Line End
		private var lineIsEnlarge:Boolean = false;
			//MovieClips
		private var lineArray:Array = new Array(); //Stores all Line MC's
		private var line:MovieClip = new MovieClip();  //Empty MC for Line Graphics to be Drawn
		
		private var colorID:Number = 000000;
	
		
		
		public function lineSpawner(i:Point, e:Point, lineMax:Number, lineMin:Number, lineIncrement:Number) 
		{
			//trace("Line Spawner");
									
			newLinePoint = i;//parent.globalToLocal(i);
			oldLinePoint = e;// this.globalToLocal(e); 
			//
			lineEnlargeMax = lineMax;
			lineEnlargeMin = lineMin;
			lineSizeFallout = lineIncrement;
			
			newLinePoint.offset(e.x, e.y);

			spawnLine();
		}
		
	//////////////////////////////////////////////////
		
		public function spawnLine()
		{
			this.addChild(line);
			createNewColor();
			
			line.addEventListener(Event.ENTER_FRAME, updateLines);
		}
		public function clearLine()
		{
			line.graphics.clear();
		}//End clearLine
		
		public function updateLines(e:Event):void
		{
			clearLine();
			
			line.graphics.lineStyle(lineThickness, lineColorThemeArray[lineCurrentTheme][newColorID], lineAlpha, true );
			line.graphics.moveTo( 0, 0 );
			line.graphics.lineTo( newLinePoint.x , newLinePoint.y );
			
			if (lineIsEnlarge) {
				increaseLineSize();
			}
			if (!lineIsEnlarge) {
				reduceLineSize();
			}
			
		}//End createLines

		public function reduceLineSize()
		{
			lineThickness -= lineSizeFallout;
			
			lineAlpha = ((lineThickness * 10) / 100);

			if (lineThickness < lineEnlargeMin) {
				lineIsEnlarge = true;
			}
		}
		public function increaseLineSize()
		{
			lineThickness += lineSizeFallout;
			
			lineAlpha = ((lineThickness *10) / 100);

			if (lineThickness > lineEnlargeMax) {
				lineIsEnlarge = false;
			}
			
		}
		
		public function getLineIndex() {
			return(this.parent.getChildIndex(this));
		}//End getLineIndex
		
		public function getArrayLength() {
			return (lineColorThemeArray[lineCurrentTheme].length);
		}//End getArrayLength
		
		

	}

}