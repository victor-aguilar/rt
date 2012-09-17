package elements {
	
	import flash.display.Sprite;
	import flash.display.GradientType;
	import string.Utils;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.geom.Matrix; 

	public class Background extends Sprite {
		
		private var colour:Number;
		private var innerColour:Number;
		private var inner_bg_grad:Object;
		private var img_x:Number;
		private var img_y:Number;
		private var innerGradType:String;
		private var innerGradColour1:Number;
		private var innerGradColour2:Number;
		private var innerGradAlpha:Array;
		private var innerGradRatio:Array;		
		private var innerGradAngle:Number;		
		
		public function Background( json:Object )
		{
			if( json.bg_colour != undefined )
				this.colour = Utils.get_colour( json.bg_colour );
			else
				this.colour = 0xf8f8d8;		// <-- default to Ivory
				
			if ( json.inner_bg_colour != undefined )
			{
				this.innerColour = Utils.get_colour( json.inner_bg_colour );
			}
			else
			{
				this.innerColour = this.colour;	
			}
			
			if ( json.inner_bg_grad != undefined )
			{
				this.inner_bg_grad =  json.inner_bg_grad;
				this.innerGradType = this.inner_bg_grad.fillType;
				this.innerGradColour1 = Utils.get_colour( this.inner_bg_grad.colour1);
				this.innerGradColour2 = Utils.get_colour( this.inner_bg_grad.colour2);
				trace("@@@@");
				trace(this.inner_bg_grad.alpha);

				this.innerGradAlpha = this.inner_bg_grad.alpha;
				this.innerGradRatio = this.inner_bg_grad.ratio;
				this.innerGradAngle = this.inner_bg_grad.angle;

			}
trace("@@");

trace(inner_bg_grad);


			if ( json.bg_image != undefined )
				this.load_img( json.bg_image );
			
		}
		
		private function load_img( json:Object ):void {
			
			// added by NetVicious, 05 July, 2007 ++++
				
			if( json.bg_image_x != undefined )
				this.img_x = json.bg_image_x;
					
			if( json.bg_image_y != undefined )
				this.img_y = json.bg_image_y;
					
			//
			// LOAD THE IMAGE
			/*
			var loader:URLLoader;
			loader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, imageLoaded );
			
			var loader:URLRequest = new URLRequest();
			loader.addListener({
				onLoadInit: function(mymc:MovieClip) {
					ref.positionize( mymc, ref.img_x, ref.img_y, new Square(0, 0, Stage.width, Stage.height) );
					delete loader;
				}
			});
				
			loader.loadClip(lv.bg_image, this.img_mc);
		*/
		}
		
		/*
		private function xmlLoaded(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			loader.
		}
	
		// added by NetVicious, 05 July, 2007
		function positionize( mc:MovieClip, myX, myY, s:Square )
		{
			var newX:Number = 0;
			var newY:Number = 0;

			if ( isNaN(myX) ) {
				myX.toLowerCase()
				switch ( myX ) {
					case 'center':
						newX = (s.width / 2) - (mc._width / 2);
						break;
					case 'left':
						newX = s.left;
						break;
					case 'right':
						newX = s.right - mc._width;
						break;
					default:
						newX = 0;
				}
			} else if ( myX < 0 ) {
				newX = s.right - mc._width - myX;
			} else { newX = s.left + myX; }

			if ( isNaN(myY) ) {
				myY.toLowerCase();
				switch ( myY ) {
					case 'middle':
						newY = (s.height / 2) - (mc._height / 2);
						break;
					case 'top':
						newY = s.top;
						break;
					case 'bottom':
						newY = s.bottom - mc._height;
						break;
					default:
						newY = 0;
				}
			} else if ( myY < 0 ) {
				newY = s.bottom - mc._height - myY;
			} else { newY = s.top + myY; }

			mc._x = newX;
			mc._y = newY;
		}
		*/
	
		public function resize(sc:ScreenCoordsBase = null):void
		{
			
			
			if ( (sc == null))
			{
				this.graphics.beginFill( this.colour );
				this.graphics.drawRect( 0, 0, this.stage.stageWidth, this.stage.stageHeight );
			}
			else if (inner_bg_grad != null)
			{
				this.graphics.beginFill( this.colour );
				this.graphics.drawRect( 0, 0, this.stage.stageWidth, this.stage.stageHeight );
				this.graphics.endFill();
				  var ratios:Array = [0x00, 0xFF]
				  var mat : Matrix = new Matrix();
					mat.createGradientBox(sc.width,sc.height,this.innerGradAngle*Math.PI/180);

				
				//this.graphics.beginGradientFill(, this.inner_bg_grad.colours, this.inner_bg_grad.alpha, this.inner_bg_grad.ratio);
				this.graphics.beginGradientFill(this.innerGradType, [this.innerGradColour1, this.innerGradColour2], this.innerGradAlpha, this.innerGradRatio, mat);
				this.graphics.drawRect( sc.left, sc.top, sc.width, sc.height );
				this.graphics.endFill();				
			}
			else
			{
				this.graphics.beginFill( this.colour );
				this.graphics.drawRect( 0, 0, this.stage.stageWidth, this.stage.stageHeight );
				this.graphics.endFill();
				this.graphics.beginFill( this.innerColour );
				this.graphics.drawRect( sc.left, sc.top, sc.width, sc.height );
				this.graphics.endFill();
			}
		}
		
		public function die(): void {
	
			this.graphics.clear();
		}
	}
}