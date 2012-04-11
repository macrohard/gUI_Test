package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.assist.Viewport;
	import com.macro.gUI.composite.VScrollBar;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.controls.ImageBox;
	import com.macro.gUI.controls.Label;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60", backgroundColor = "0x999999")]
	public class TestVScrollBar extends Sprite
	{

		private var control:VScrollBar;

		private var CP1:Sprite;

		private var CP2:Sprite;

		
		private var content:Label;


		public function TestVScrollBar()
		{
			new UISettings(stage);
			
			

			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new VScrollBar();
//			control.autoSize = false;
			control.minimum = 10;
			control.stepSize = 2;
			control.maximum = 99;
			control.align = LayoutAlign.CENTER | LayoutAlign.TOP;
			control.padding = new Margin(20, 15, 20, 15);
//			control.enabled = false;


			var rect:Rectangle = new Rectangle(150, 200, 200, 100);
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1, 0);
			shape.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			var image:ImageBox = new ImageBox(shape);
			
			var content:Label = new Label("test aaa \n看直fdaf\ndafdsa d\nsa fdsaj\nfdkjf  ka\njdksa\n lkdsa\n djdks\nja klfd\n\njsak jkdsj dja kjfdksj klfdj j;aja;");
			content.backgroundColor = 0xFF666666;
			content.x = 180;
			var st:TextStyle = content.style;
			st.multiline = true;
			content.style = st;
			
			control.viewport = new Viewport(rect, content, new Margin(0, 5, 0, 5));
			
			var container:Container = new Container(stage.stageWidth, stage.stageHeight);
			container.addChild(image);
			container.addChild(control);
			container.addChild(content);



			var u:UIImpl = new UIImpl(stage, container);
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
