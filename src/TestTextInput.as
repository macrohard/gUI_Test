package
{
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.controls.TextInput;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestTextInput extends Sprite
	{

		private var l:TextInput;

		private var d:Sprite;

		private var e:Sprite;




		public function TestTextInput()
		{
			new UISettings(stage);
			
			

			l = new TextInput();
//			l.normalStyle = ts;
//			l.autoSize = false;
			var ts:TextStyle = l.style;
			ts.color = 0xFFFFFF;
			ts.font = "Microsoft YaHei";
			ts.size = 24;
			ts.bold = true;
//			ts.leftMargin = 15;
//			ts.rightMargin = 15;
//			ts.blockIndent = 10;
//			ts.indent = 20;
			l.style = ts;

//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
//			l.backgroundColor = 0xFF666666;
//			l.padding = new Rectangle(15);
//			l.enabled = false;
//			l.editable = false;




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

		}

		private function onresize(evt:Event):void
		{
			l.x = Math.min(d.x, e.x);
			l.y = Math.min(d.y, e.y);
			l.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
