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
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestLabel extends Sprite
	{

		private var l:Label;
		
		private var d:Sprite;
		private var e:Sprite;

		public function TestLabel()
		{
			GameUI.init();
			
			var ts:TextStyle = new TextStyle();
//			ts.align = TextFormatAlign.CENTER;
//			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
			ts.color = 0xffffff;
//			ts.leftMargin = 20;
//			ts.displayAsPassword = true;
			
			l = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", false);
			l.normalStyle = ts;
//			l.autoSize = false;
//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.backgroundColor = 0xff999999;
//			l.padding = new Rectangle(10, 10, -10);
			
			
			
			var u:UIImpl = new UIImpl(stage, l);
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
		}
		
		private function onresize(evt:Event):void
		{
			l.x = Math.min(d.x, e.x);
			l.y = Math.min(d.y, e.y);
			l.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
