package
{
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.controls.Label;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestLabel extends Sprite
	{

		private var l:Label;
		
		private var d:Sprite;
		private var e:Sprite;

		public function TestLabel()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			
			var ts:TextStyle = new TextStyle();
//			ts.align = TextFormatAlign.CENTER;
//			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
			ts.color = 0xffffff;
//			ts.leftMargin = 20;
//			ts.displayAsPassword = true;
			
			l = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它\ntst");
//			l = new Label(null);
			l.style = ts;
//			l.autoSize = false;
//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.backgroundColor = 0xff999999;
			l.padding = new Margin(10, 10);
			
			
			
			ui.mainContainer.addChild(l);
			
			
			
			
			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 150;
			d.y = 150;
			addChild(d);
			
			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 450;
			e.y = 250;
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
