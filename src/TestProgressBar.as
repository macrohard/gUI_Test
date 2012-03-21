package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.base.AbstractComposite;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.controls.composite.ProgressBar;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;


	[SWF(width = "1000", height = "600", frameRate = "30")]
	public class TestProgressBar extends Sprite
	{

		[Embed(source = "assets/ProgressBar_horizotalFGImage.png")]
		private var normal:Class;

		[Embed(source = "assets/ProgressBar_horizotalBGImage.png")]
		private var bg:Class;



		private var c:ProgressBar;

		private var s:Sprite;

		private var bd:Dictionary;

		private var m:Shape;

		private var d:Sprite;

		private var e:Sprite;



		public function TestProgressBar()
		{
			GameUI.init();
//			GameUI.skinManager.registerSkin(SkinDef.PROGRESSBAR_INFILL, Bitmap(new normal()).bitmapData,
//											new Rectangle(1, 0, 5));
			GameUI.skinManager.registerSkin(SkinDef.PROGRESSBAR_INFILL, Bitmap(new normal()).bitmapData,
											new Rectangle());
			GameUI.skinManager.registerSkin(SkinDef.PROGRESSBAR_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(10, 1, 4));

			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			var l:ProgressBar = new ProgressBar();
			l.autoSize = false;
//			l.minimum = 10;
//			l.stepSize = 2;
//			l.maximum = 99;
//			l.align = LayoutAlign.CENTER | LayoutAlign.TOP;
			l.backgroundColor = 0xFF00FF00;
//			l.percent = 50;
//			l.enabled = false;
			c = l;

			bd = new Dictionary();
			s = new Sprite();

			var b:Bitmap = new Bitmap(c.bitmapData);
			b.x = c.x;
			b.y = c.y;
			bd[c] = b;
			s.addChild(b);

			for each (var ic:IControl in c.children)
			{
				b = new Bitmap(ic.bitmapData);
				b.x = ic.rect.x;
				b.y = ic.rect.y;
				bd[ic] = b;
				s.addChild(b);
			}

			m = new Shape();
			m.graphics.beginFill(0);
			m.graphics.drawRect(0, 0, c.width, c.height);
			m.graphics.endFill();
			s.mask = m;
			s.addChild(m);

			addChild(s);


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
			c.x = s.x = Math.min(d.x, e.x);
			c.y = s.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));

			m.graphics.clear();
			m.graphics.beginFill(0);
			m.graphics.drawRect(0, 0, c.width, c.height);
			m.graphics.endFill();

			bd[c].bitmapData = c.bitmapData;
			for each (var ic:IControl in c.children)
			{
				var b:Bitmap = bd[ic];
				b.bitmapData = ic.bitmapData;
				b.x = ic.rect.x;
				b.y = ic.rect.y;
			}
		}
	}
}
