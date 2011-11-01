package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.controls.Slice;
	import com.macro.gUI.controls.TitleBar;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.utils.getTimer;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestTitleBar extends Sprite
	{
		[Embed(source="assets/TitleBar_defaultImage.png")]
		private var normal:Class;
		
		private var c:AbstractControl;

		private var b:Bitmap;
		
		private var d:Sprite;
		private var e:Sprite;

		public function TestTitleBar()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.TITLE_BG, Bitmap(new normal()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			
			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
//			ts.displayAsPassword = true;
			
			var l:TitleBar = new TitleBar("测试一下看看效果如何");
//			var l:Label = new Label("");
			l.autoSize = false;
//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.backgroundColor = 0xFFFF0000;
//			l.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
			l.margin = new Rectangle(10, 10);
//			var l:Slice = new Slice(100, 100, GameUI.skinManager.getSkin(SkinDef.TITLE_BG));
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
