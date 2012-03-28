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
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestTextInput extends Sprite
	{
		[Embed(source="assets/TextInput_defaultImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/TextInput_disableImage.png")]
		private var disable:Class;
		
		private var c:AbstractControl;

		private var b:Bitmap;

		private var d:Sprite;

		private var e:Sprite;

		public function TestTextInput()
		{
			stage.color = 0x666666;
			
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.TEXTINPUT_NORMAL, Bitmap(new normal()).bitmapData, new Rectangle(14, 0, 7, 0), 0x21);
			GameUI.skinManager.registerSkin(SkinDef.TEXTINPUT_DISABLE, Bitmap(new disable()).bitmapData, new Rectangle(14, 0, 7, 0), 0x21);
			
			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = true;
			ts.color = 0xffffff;
//			ts.align = TextFormatAlign.RIGHT;
//			ts.displayAsPassword = true;
			ts.maxChars = 50;

			var l:TextInput = new TextInput("必须使用英文字体名称，才能正确支持中文！直接使用中文字体名称是不行的", ts);
			l.autoSize = false;
//			var ts:TextStyle = l.normalStyle;
//			ts.color = 0xFFFFFF;
//			ts.font = "Microsoft YaHei";
//			ts.size = 18;
//			ts.bold = true;
//			ts.displayAsPassword = true;
//			ts.leftMargin = 15;
//			ts.rightMargin = 15;
//			ts.blockIndent = 10;
//			ts.indent = 20;
//			l.normalStyle = ts;
			
//			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.backgroundColor = 0xFF666666;
			l.padding = new Rectangle(15);
//			l.enabled = false;
//			l.editable = false;
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

			stage.addEventListener(MouseEvent.CLICK, onmouseclick);
		}

		private function onresize(evt:Event):void
		{
			c.x = b.x = Math.min(d.x, e.x);
			c.y = b.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
			b.bitmapData = c.bitmapData;
		}

		protected function onmouseclick(event:MouseEvent):void
		{
			var b:TextInput = TextInput(c);
			if (b.rect.contains(stage.mouseX, stage.mouseY) && b.hitTest(stage.mouseX - b.x, stage.mouseY - b.y))
				startEdit();
			else
				endEdit();
		}

		private var textField:TextField;

		private function endEdit():void
		{
			if (textField)
			{
				IEdit(c).endEdit();
				textField.removeEventListener(KeyboardEvent.KEY_DOWN, onkeydown);
				removeChild(textField);
				stage.focus = null;
				textField = null;
				onresize(null);
			}
		}

		private function startEdit():void
		{
			if (!textField)
			{
				textField = IEdit(c).beginEdit();
				if (textField)
				{
					textField.addEventListener(KeyboardEvent.KEY_DOWN, onkeydown);
					addChild(textField);
					var index:int = textField.getCharIndexAtPoint(stage.mouseX - textField.x, stage.mouseY - textField.y);
					textField.setSelection(index, index);
					stage.focus = textField;
				}
			}
		}

		private function onkeydown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.ESCAPE)
				endEdit();
		}
	}
}
