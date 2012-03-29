package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.controls.ToggleButton;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.Dictionary;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestToggleButton extends Sprite
	{
		[Embed(source="assets/Button_defaultImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/Button_rolloverImage.png")]
		private var over:Class;
		
		[Embed(source="assets/Button_pressedImage.png")]
		private var down:Class;
		
		[Embed(source="assets/Button_disabledImage.png")]
		private var disable:Class;
		
		[Embed(source="assets/ToggleButton_defaultImage.png")]
		private var selected_normal:Class;
		
		[Embed(source="assets/ToggleButton_rolloverImage.png")]
		private var selected_over:Class;
		
		[Embed(source="assets/ToggleButton_pressedImage.png")]
		private var selected_down:Class;
		
		[Embed(source="assets/ToggleButton_disabledImage.png")]
		private var selected_disable:Class;
		
		
		
		
		private var control:ToggleButton;
		
		private var sprite:Sprite;
		
		private var map:Dictionary;
		
		private var spriteMask:Shape;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;
		
		
		

		public function TestToggleButton()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_NORMAL, Bitmap(new normal()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_OVER, Bitmap(new over()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_DOWN, Bitmap(new down()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_DISABLE, Bitmap(new disable()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_SELECTED, Bitmap(new selected_normal()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_SELECTED_OVER, Bitmap(new selected_over()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_SELECTED_DOWN, Bitmap(new selected_down()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			GameUI.skinManager.registerSkin(SkinDef.TOGGLEBUTTON_SELECTED_DISABLE, Bitmap(new selected_disable()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			
			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = false;

			
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new ToggleButton();
//			control.autoSize = false;
//			control.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			control.backgroundColor = 0xFF666666;
			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
//			control.selected = true;
//			control.enabled = false;

			
			
			map = new Dictionary();
			sprite = new Sprite();
			
			var b:Bitmap = new Bitmap(control.bitmapData);
			b.x = control.x;
			b.y = control.y;
			map[control] = b;
			sprite.addChild(b);
			
			//			for each (var ic:IControl in control.children)
			//			{
			//				b = new Bitmap(ic.bitmapData);
			//				b.x = ic.rect.x;
			//				b.y = ic.rect.y;
			//				map[ic] = b;
			//				sprite.addChild(b);
			//			}
			
			spriteMask = new Shape();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(0, 0, control.width, control.height);
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
			//			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, onEnerFrame);
		}
		
		protected function onEnerFrame(event:Event):void
		{
			map[control].bitmapData = control.bitmapData;
			//			for each (var ic:IControl in control.children)
			//			{
			//				var b:Bitmap = map[ic];
			//				b.bitmapData = ic.bitmapData;
			//				b.x = ic.rect.x;
			//				b.y = ic.rect.y;
			//			}
		}
		
		//		protected function onKeyDown(event:KeyboardEvent):void
		//		{
		//			control.keyDown(event);
		//		}
		
		
		private function onresize(evt:Event):void
		{
			control.x = sprite.x = Math.min(CP1.x, CP2.x);
			control.y = sprite.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
			map[control].bitmapData = control.bitmapData;
			
			spriteMask.graphics.clear();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(0, 0, control.width, control.height);
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
				if (_mouseCon is IFocus && IFocus(_mouseCon).enabled)
				{
					if (_mouseCon is IButton)
					{
						IButton(_mouseCon).mouseDown();
					}
					if (_mouseCon is IDrag && IDrag(_mouseCon).dragMode != DragMode.NONE)
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
				if (_mouseCon is IFocus && IFocus(_mouseCon).enabled)
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
				IDrag(_dragCon).setDragPos(stage.mouseX, stage.mouseY);
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
				if (_mouseCon is IFocus && IFocus(_mouseCon).enabled)
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
