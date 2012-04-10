package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.base.AbstractComposite;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.composite.ProgressBar;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "30")]
	public class TestProgressBar extends Sprite
	{

		



		private var c:ProgressBar;

		private var d:Sprite;

		private var e:Sprite;



		public function TestProgressBar()
		{
			new UISettings();
			
			
			
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			c = new ProgressBar();
			c.autoSize = false;
//			c.minimum = 10;
//			c.stepSize = 2;
//			c.maximum = 99;
//			c.align = LayoutAlign.CENTER | LayoutAlign.TOP;
//			c.percent = 50;
//			c.enabled = false;

			

			
			var u:UIImpl = new UIImpl(stage, c);
			addChild(new Bitmap(u.canvas));
			
			


			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 150;
			d.y = 150;
			addChild(d);

			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 950;
			e.y = 550;
			addChild(e);

			onresize(null);

			addChild(new Stats());
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			c.percent++;
			if (c.percent >= 100)
			{
				c.percent = 0;
			}
		}

		private function onresize(evt:Event):void
		{
			c.x = Math.min(d.x, e.x);
			c.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
