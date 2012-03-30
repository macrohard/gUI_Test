package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.composite.RadioButton;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.Dictionary;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestRadioButton extends Sprite
	{
		[Embed(source="assets/RadioButton_defaultImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/RadioButton_disabledImage.png")]
		private var disable:Class;
		
		[Embed(source="assets/RadioButton_selectedImage.png")]
		private var selected_normal:Class;
		
		[Embed(source="assets/RadioButton_selectedDisabledImage.png")]
		private var selected_disable:Class;
		
		
		private var control:RadioButton;
		
		private var sprite:Sprite;
		
		private var map:Dictionary;
		
		private var spriteMask:Shape;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;
		
		
		

		public function TestRadioButton()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.RADIOBUTTON_NORMAL, Bitmap(new normal()).bitmapData, new Rectangle());
			GameUI.skinManager.registerSkin(SkinDef.RADIOBUTTON_DISABLE, Bitmap(new disable()).bitmapData, new Rectangle());
			GameUI.skinManager.registerSkin(SkinDef.RADIOBUTTON_SELECTED, Bitmap(new selected_normal()).bitmapData, new Rectangle());
			GameUI.skinManager.registerSkin(SkinDef.RADIOBUTTON_SELECTED_DISABLE, Bitmap(new selected_disable()).bitmapData, new Rectangle());
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new RadioButton("测试一下看看效果如何");
			control.autoSize = false;
			control.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			var ts:TextStyle = control.labelStyle;
			ts.size = 18;
			ts.bold = true;
			ts.font = "Microsoft YaHei";
			control.labelStyle = ts;
//			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
//			control.selected = true;
//			control.enabled = false;

			
			
			
			map = new Dictionary();
			sprite = new Sprite();
			
			var b:Bitmap;
			
			for each (var ic:IControl in control.container.children)
			{
				b = new Bitmap(ic.bitmapData);
				map[ic] = b;
				sprite.addChild(b);
			}
			
			spriteMask = new Shape();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(control.x, control.y, control.width, control.height);
			spriteMask.graphics.endFill();
			sprite.mask = spriteMask;
			sprite.addChild(spriteMask);
			
			addChild(sprite);
			
			
			
			
			
			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 50;
			CP1.y = 50;
			addChild(CP1);
			
			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			addChild(CP2);
			
			onresize(null);
			
			
			
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, onEnerFrame);
		}
		
		protected function onEnerFrame(event:Event):void
		{
			for each (var ic:IControl in control.container.children)
			{
				var b:Bitmap = map[ic];
				b.bitmapData = ic.bitmapData;
				var p:Point = ic.globalCoord();
				b.x = p.x;
				b.y = p.y;
			}
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			control.keyDown(event);
		}
		
		
		private function onresize(evt:Event):void
		{
			control.x = Math.min(CP1.x, CP2.x);
			control.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
			
			spriteMask.graphics.clear();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(control.x, control.y, control.width, control.height);
			spriteMask.graphics.endFill();
			
		}
		
		
		
		
		
		private var _mouseCon:IControl;
		
		private var _mouseObj:IControl;
		
		private var _dragCon:IControl;
		
		protected function onMouseDown(event:MouseEvent):void
		{
			_mouseObj = control.hitTest(stage.mouseX, stage.mouseY);
			if (_mouseObj)
			{
				_mouseCon = control;
				if (_mouseCon is IFocus && _mouseCon.enabled)
				{
					if (_mouseCon is IButton)
					{
						IButton(_mouseCon).mouseDown();
					}
					if (_mouseCon is IDrag && IDrag(_mouseCon).getDragMode() != DragMode.NONE)
						_dragCon = control;
				}
			}
			else
			{
				_mouseCon = null;
				control.enabled = !control.enabled;
			}
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			if (_dragCon)
			{
				_dragCon = null;
				onMouseMove(null);
				return;
			}
			
			_mouseObj = control.hitTest(stage.mouseX, stage.mouseY);
			if (_mouseObj)
			{
				_mouseCon = control;
				if (_mouseCon is IFocus && _mouseCon.enabled)
				{
					if (_mouseCon is IButton)
					{
						IButton(_mouseCon).mouseUp();
					}
				}
			}
			else
				_mouseCon = null;
			
		}
		
		protected function onMouseMove(e:MouseEvent):void
		{
			if (_dragCon)
			{
				IDrag(_dragCon).setDragCoord(stage.mouseX, stage.mouseY);
				return;
			}
			
			
			var t:IControl = control.hitTest(stage.mouseX, stage.mouseY);
			if (t == _mouseObj)
				return;
			
			if (_mouseCon is IButton)
			{
				Mouse.cursor = MouseCursor.AUTO;
				IButton(_mouseCon).mouseOut();
			}
			
			
			_mouseObj = t;
			if (_mouseObj)
			{
				_mouseCon = control;
				if (_mouseCon is IFocus && _mouseCon.enabled)
				{
					if (_mouseCon is IButton)
					{
						if (_mouseObj is IButton)
							Mouse.cursor = MouseCursor.BUTTON;
						IButton(_mouseCon).mouseOver();
					}
				}
			}
			else
				_mouseCon = null;
		}
	}
}
