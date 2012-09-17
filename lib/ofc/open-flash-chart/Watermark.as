/**
 * @author Wildan Maulana, OpenThink labs
 */
package  {
	import flash.display.Sprite;
    import flash.display.Bitmap;
    
	public class Watermark extends Sprite{	
	    private var bg:Bitmap;
  
		[ Embed ( source = "logo.png" ) ] private var bgImageClass:Class;
			
		public function Watermark() {
            bg = new bgImageClass() ;
            bg.x = 10 ;       
            bg.y = 5 ; 
            
            addChild(bg);
		}
	}
}