package
{
	import com.macro.gUI.composite.VSlider;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestVSlider extends Sprite
	{

		private var control:VSlider;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;



		public function TestVSlider()
		{
			new UISettings(stage);
			
			
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new VSlider();
			control.autoSize = false;
			control.minimum = 10;
			control.stepSize = 1;
			control.maximum = 20;
//			control.align = LayoutAlign.CENTER | LayoutAlign.TOP;
//			control.margin = new Rectangle(30, 15);
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
