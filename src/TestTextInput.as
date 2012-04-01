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
			GameUI.skinManager.registerSkin(SkinDef.TEXTINPUT_NORMAL, Bitmap(new normal()).bitmapData,
											new Rectangle(14, 0, 7, 0), 0x21);
			GameUI.skinManager.registerSkin(SkinDef.TEXTINPUT_DISABLE, Bitmap(new disable()).bitmapData,
											new Rectangle(14, 0, 7, 0), 0x21);

			l = new TextInput();
//			l.normalStyle = ts;
//			l.autoSize = false;
			var ts:TextStyle = l.normalStyle;
			ts.color = 0xFFFFFF;
			ts.font = "Microsoft YaHei";
			ts.size = 24;
			ts.bold = true;
//			ts.leftMargin = 15;
//			ts.rightMargin = 15;
//			ts.blockIndent = 10;
//			ts.indent = 20;
			l.normalStyle = ts;

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

			stage.addEventListener(MouseEvent.CLICK, onmouseclick);
		}

		private function onresize(evt:Event):void
		{
			l.x = Math.min(d.x, e.x);
			l.y = Math.min(d.y, e.y);
			l.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}





		protected function onmouseclick(event:MouseEvent):void
		{
			if (l.hitTest(stage.mouseX, stage.mouseY))
				startEdit();
			else
				endEdit();
		}

		
		// TODO 将输入框的创建过程移入UIImpl
		private var _editBox:TextField;

		private function endEdit():void
		{
			var ti:TextInput = l;
			if (_editBox != null)
			{
				ti.text = _editBox.text;
				
				_editBox.removeEventListener(Event.CHANGE, onTextChangeHandler);
				_editBox.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
				removeChild(_editBox);
				_editBox = null;
				stage.focus = null;
			}
		}

		private function startEdit():void
		{
			var ti:TextInput = l;
			if (_editBox == null)
			{
				var ts:TextStyle = ti.normalStyle;
				
				_editBox = new TextField();
				_editBox.autoSize = TextFieldAutoSize.LEFT;
				_editBox.displayAsPassword = ti.displayAsPassword;
				_editBox.maxChars = ts.maxChars;
				_editBox.filters = ts.filters;
				_editBox.defaultTextFormat = ts;
				if (ti.text != null)
				{
					_editBox.text = ti.text;
				}
				if (ti.editable)
				{
					_editBox.type = TextFieldType.INPUT;
				}
				relocateEditBox();
				
				_editBox.addEventListener(Event.CHANGE, onTextChangeHandler);
				_editBox.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
				addChild(_editBox);
				ti.beginEdit();

				_editBox.setSelection(0, _editBox.text.length);
				stage.focus = _editBox;
			}
		}
		
		protected function onTextChangeHandler(event:Event):void
		{
			relocateEditBox();
		}
		
		protected function onKeyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.ESCAPE)
				endEdit();
		}
		
		/**
		 * 重新定位编辑框
		 *
		 */
		private function relocateEditBox():void
		{
			var ti:TextInput = l;
			var ts:TextStyle = ti.normalStyle;
			var padding:Rectangle = ti.padding;
			
			var txtW:int = _editBox.textWidth + 4 + ts.leftMargin + ts.rightMargin + ts.indent + ts.blockIndent;
			var txtH:int = _editBox.textHeight + 4;
			
			var w:int = padding ? ti.width - padding.left - padding.right : ti.width;
			var h:int = padding ? ti.height - padding.top - padding.bottom : ti.height;
			
			if (txtW > w)
			{
				_editBox.autoSize = TextFieldAutoSize.NONE;
				_editBox.multiline = ts.multiline;
				_editBox.wordWrap = ts.wordWrap;
				txtW = w;
				_editBox.width = txtW + 2;
				txtH = _editBox.textHeight + 4;
			}
			else
			{
				_editBox.autoSize = TextFieldAutoSize.LEFT;
			}
			
			var p:Point = ti.globalCoord();
			
			var ox:int = p.x + (padding ? padding.left : 0);
			if ((ti.align & LayoutAlign.CENTER) == LayoutAlign.CENTER)
			{
				ox += (w - txtW) >> 1;
			}
			else if ((ti.align & LayoutAlign.RIGHT) == LayoutAlign.RIGHT)
			{
				ox += w - txtW;
			}
			
			var oy:int = p.y + (padding ? padding.top : 0);
			if ((ti.align & LayoutAlign.MIDDLE) == LayoutAlign.MIDDLE)
			{
				oy += (h - txtH) >> 1;
			}
			else if ((ti.align & LayoutAlign.BOTTOM) == LayoutAlign.BOTTOM)
			{
				oy += h - txtH;
			}
			
			_editBox.x = ox;
			_editBox.y = oy;
		}
	}
}
