package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.controls.Cell;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestCell extends Sprite
	{
		[Embed(source="assets/TitleBar_defaultImage.png")]
		private var normal:Class;
		
		private var c:Cell;

		private var d:Sprite;
		private var e:Sprite;

		public function TestCell()
		{
			GameUI.init();
			GameUI.skinManager.setSkin(SkinDef.CELL_BG, Bitmap(new normal()).bitmapData, new Rectangle(35, 0, 133 - 35, 0), 0x22);
			
			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
//			ts.displayAsPassword = true;
			
			c = new Cell("测试一下看看效果如何");
//			var c:Label = new Label("");
			c.autoSize = false;
//			c.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			c.backgroundColor = 0xFFFF0000;
//			c.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
			c.padding = new Margin(20, 20, 20, 20);
			
			

			
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
		}
		
		private function onresize(evt:Event):void
		{
			c.x = Math.min(d.x, e.x);
			c.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
