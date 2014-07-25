package code 
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class textUI extends MovieClip
	{
		//VARIABLES
		
		//Public
		public var isClicked:Boolean;
		//Private
		
		public function textUI() //CONSTRUCTOR
		{
			this.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
			//this.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			
			this.gotoAndStop("idle");
		}
		
		public function mouseOverHandler(e:MouseEvent)
		{
			this.gotoAndPlay("over");	
			
		}//End mouseOverHandler
		public function mouseOutHandler(e:MouseEvent)
		{
			this.gotoAndStop("off");
			
		}//End mouseOutHandler
		public function mouseClickHandler(e:MouseEvent)
		{
			this.gotoAndPlay("down");
			isClicked = true;
			
			
		}//End mouseClickHandler

		/*
		public function getClicK()
		{
			return(isClicked);
			
		}//End getClick
		*/
		
		
		
	}

}