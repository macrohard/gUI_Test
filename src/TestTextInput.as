package
{
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.controls.TextInput;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestTextInput extends Sprite
	{

		private var l:TextInput;

		private var d:Sprite;

		private var e:Sprite;




		public function TestTextInput()
		{
//			stage.stageFocusRect = false;
//			stage.tabChildren = false;
//			
//			var s:Sprite = new Sprite();
//			s.x = 100;
//			s.y = 100;
//			addChild(s);
			
			var ui:UISettings = new UISettings(stage, 900, 500);
			
			l = new TextInput();
//			l.normalStyle = ts;
//			l.autoSize = false;
//			var ts:TextStyle = l.style;
//			ts.color = 0xFFFFFF;
//			ts.font = "Microsoft YaHei";
//			ts.size = 24;
//			ts.bold = true;
//			ts.leftMargin = 15;
//			ts.rightMargin = 15;
//			ts.blockIndent = 10;
//			ts.indent = 20;
//			l.style = ts;

//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
//			l.backgroundColor = 0xFF666666;
//			l.padding = new Rectangle(15);
//			l.enabled = false;
//			l.editable = false;

			
			var t:TextInput = new TextInput();
			t.x = 50;
			t.y = 100;
			t.tabIndex = 1;

			ui.mainContainer.addChild(l);
			ui.mainContainer.addChild(t);


			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 50;
			d.y = 50;
			addChild(d);

			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 650;
			e.y = 450;
			addChild(e);

			onresize(null);

		}
		
		private function keyDownHandler(e:KeyboardEvent):void
		{
			trace("aaa");
		}
		
		private function keyUpHandler(e:KeyboardEvent):void
		{
			trace("bbb");
		}

		private function onresize(evt:Event):void
		{
			l.x = Math.min(d.x, e.x);
			l.y = Math.min(d.y, e.y);
			l.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
