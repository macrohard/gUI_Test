package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.composite.HSlider;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestHSlider extends Sprite
	{

		
		


		private var control:HSlider;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;



		public function TestHSlider()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			
			
			control = new HSlider();
			control.autoSize = false;
//			control.minimum = 10;
//			control.stepSize = 2;
//			control.maximum = 99;
			control.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			control.padding = new Margin(20, 15, 20, 15);
//			control.enabled = false;

			
			
			
			
			ui.mainContainer.addChild(control);
			
			
			
			
			
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
