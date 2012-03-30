package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.composite.HSlider;
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
	public class TestHSlider extends Sprite
	{

		[Embed(source = "assets/Slider_block_defaultImage.png")]
		private var normal:Class;

		[Embed(source = "assets/Slider_block_rolloverImage.png")]
		private var over:Class;

		[Embed(source = "assets/Slider_block_pressedImage.png")]
		private var down:Class;

		[Embed(source = "assets/Slider_block_disableImage.png")]
		private var disable:Class;

		[Embed(source = "assets/Slider_horizontal_trackImage.png")]
		private var bg:Class;
		


		private var control:HSlider;
		
		private var sprite:Sprite;
		
		private var map:Dictionary;
		
		private var spriteMask:Shape;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;



		public function TestHSlider()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.SLIDER_BLOCK_NORMAL, Bitmap(new normal()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.registerSkin(SkinDef.SLIDER_BLOCK_OVER, Bitmap(new over()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.registerSkin(SkinDef.SLIDER_BLOCK_DOWN, Bitmap(new down()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.registerSkin(SkinDef.SLIDER_BLOCK_DISABLE, Bitmap(new disable()).bitmapData,
											new Rectangle(8, 7));
			GameUI.skinManager.registerSkin(SkinDef.SLIDER_HORIZONTAL_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(1, 6, 1));

			
			
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new HSlider();
//			control.autoSize = false;
//			control.minimum = 10;
//			control.stepSize = 2;
//			control.maximum = 99;
//			control.align = LayoutAlign.CENTER | LayoutAlign.TOP;
			control.padding = new Rectangle(20, 15);
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
