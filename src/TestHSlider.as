package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.composite.HSlider;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestHSlider extends Sprite
	{

		[Embed(source = "assets/Slider_block_defaultImage.png")]
		private var normal:Class;

		[Embed(source = "assets/Slider_block_rolloverImage.png")]
		private var over:Class;

		[Embed(source = "assets/Slider_block_pressedImage.png")]
		private var down:Class;

		[Embed(source = "assets/Slider_block_disableImage.png")]
		private var disable:Class;

		[Embed(source = "assets/Slider_horizontal_trackImage.png")]
		private var bg:Class;
		


		private var control:HSlider;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;



		public function TestHSlider()
		{
			GameUI.init();
			GameUI.skinManager.setSkin(SkinDef.SLIDER_BLOCK_NORMAL, Bitmap(new normal()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.setSkin(SkinDef.SLIDER_BLOCK_OVER, Bitmap(new over()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.setSkin(SkinDef.SLIDER_BLOCK_DOWN, Bitmap(new down()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.setSkin(SkinDef.SLIDER_BLOCK_DISABLE, Bitmap(new disable()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.setSkin(SkinDef.SLIDER_HORIZONTAL_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(1, 6, 1));

			
			
			
			control = new HSlider();
			control.autoSize = false;
//			control.minimum = 10;
//			control.stepSize = 2;
//			control.maximum = 99;
			control.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			control.padding = new Margin(20, 15, 20, 15);
//			control.enabled = false;

			
			
			
			
			var u:UIImpl = new UIImpl(stage, control);
			addChild(new Bitmap(u.canvas));
			
			
			
			
			
			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 150;
			CP1.y = 150;
			addChild(CP1);
			
			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			addChild(CP2);
			
			onresize(null);
			
			addChild(new Stats());
		}
		
		private function onresize(evt:Event):void
		{
			control.x = Math.min(CP1.x, CP2.x);
			control.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}
		
	}
}
