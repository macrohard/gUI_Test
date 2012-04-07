package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.base.feature.IEdit;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.controls.TextInput;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	
	import mx.controls.Text;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestTextInput extends Sprite
	{

		[Embed(source = "assets/TextInput_defaultImage.png")]
		private var normal:Class;

		[Embed(source = "assets/TextInput_disableImage.png")]
		private var disable:Class;



		private var l:TextInput;

		private var d:Sprite;

		private var e:Sprite;




		public function TestTextInput()
		{
			GameUI.init();
			GameUI.skinManager.setSkin(SkinDef.TEXTINPUT_NORMAL, Bitmap(new normal()).bitmapData,
											new Rectangle(14, 0, 7, 0), 0x21);
			GameUI.skinManager.setSkin(SkinDef.TEXTINPUT_DISABLE, Bitmap(new disable()).bitmapData,
											new Rectangle(14, 0, 7, 0), 0x21);

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
