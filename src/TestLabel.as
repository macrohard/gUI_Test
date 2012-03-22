package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.controls.Label;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getTimer;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestLabel extends Sprite
	{
		private var c:AbstractControl;

		private var b:Bitmap;
		
		private var d:Sprite;
		private var e:Sprite;

		public function TestLabel()
		{
			GameUI.init();
			
			var ts:TextStyle = new TextStyle();
//			ts.align = TextFormatAlign.CENTER;
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
			ts.color = 0xffffff;
//			ts.leftMargin = 20;
//			ts.displayAsPassword = true;
			
			var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
//			var l:Label = new Label("");
//			l.autoSize = false;
//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.margin = new Rectangle(10, 10, -10);
			c = l;
			
			b = new Bitmap(c.bitmapData);
			addChild(b);
			
			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 50;
			d.y = 50;
			addChild(d);
			
			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 950;
			e.y = 550;
			addChild(e);
			
			onresize(null);
		}
		
		private function onresize(evt:Event):void
		{
//			trace(c.width, c.height);
			b.x = Math.min(d.x, e.x);
			b.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
			b.bitmapData = c.bitmapData;
		}
	}
}
