package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.controls.composite.VScrollBar;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.Dictionary;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestVScrollBar extends Sprite
	{

		[Embed(source = "assets/ScrollBar_thumbVertical_defaultImage.png")]
		private var block_normal:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_rolloverImage.png")]
		private var block_over:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_pressedImage.png")]
		private var block_down:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_disableImage.png")]
		private var block_disable:Class;



		[Embed(source = "assets/ScrollBar_arrowUp_defaultImage.png")]
		private var up_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowUp_rolloverImage.png")]
		private var up_over:Class;

		[Embed(source = "assets/ScrollBar_arrowUp_pressedImage.png")]
		private var up_down:Class;

		[Embed(source = "assets/ScrollBar_arrowUp_disableImage.png")]
		private var up_disable:Class;



		[Embed(source = "assets/ScrollBar_arrowDown_defaultImage.png")]
		private var down_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowDown_rolloverImage.png")]
		private var down_over:Class;

		[Embed(source = "assets/ScrollBar_arrowDown_pressedImage.png")]
		private var down_down:Class;

		[Embed(source = "assets/ScrollBar_arrowDown_disableImage.png")]
		private var down_disable:Class;



		[Embed(source = "assets/ScrollBar_verticalBGImage.png")]
		private var bg:Class;



		private var control:VScrollBar;

		private var sprite:Sprite;

		private var map:Dictionary;

		private var spriteMask:Shape;

		private var CP1:Sprite;

		private var CP2:Sprite;



		public function TestVScrollBar()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_NORMAL,
											Bitmap(new block_normal()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_OVER,
											Bitmap(new block_over()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DOWN,
											Bitmap(new block_down()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DISABLE,
											Bitmap(new block_disable()).bitmapData, new Rectangle(8, 6, 0, 14));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_NORMAL, Bitmap(new up_normal()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_OVER, Bitmap(new up_over()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_DOWN, Bitmap(new up_down()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_DISABLE, Bitmap(new up_disable()).bitmapData,
											new Rectangle(7, 0));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_NORMAL, Bitmap(new down_normal()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_OVER, Bitmap(new down_over()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_DOWN, Bitmap(new down_down()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_DISABLE, Bitmap(new down_disable()).bitmapData,
											new Rectangle(7, 0));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(8, 0, 0, 111));


			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new VScrollBar();
//			control.autoSize = false;
			control.minimum = 10;
			control.stepSize = 2;
			control.maximum = 99;
			control.align = LayoutAlign.CENTER | LayoutAlign.TOP;
			control.backgroundColor = 0xFF999999;
			control.margin = new Rectangle(30, 15);
//			control.enabled = false;





			map = new Dictionary();
			sprite = new Sprite();

			var b:Bitmap = new Bitmap(control.bitmapData);
			b.x = control.x;
			b.y = control.y;
			map[control] = b;
			sprite.addChild(b);

			for each (var ic:IControl in control.children)
			{
				b = new Bitmap(ic.bitmapData);
				b.x = ic.rect.x;
				b.y = ic.rect.y;
				map[ic] = b;
				sprite.addChild(b);
			}

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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, onEnerFrame);
		}
		
		protected function onEnerFrame(event:Event):void
		{
			for each (var ic:IControl in control.children)
			{
				var b:Bitmap = map[ic];
				b.bitmapData = ic.bitmapData;
				b.x = ic.rect.x;
				b.y = ic.rect.y;
			}
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			control.keyDown(event);
		}


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
			_mouseObj = control.hitTest(stage.mouseX - control.x, stage.mouseY - control.y);
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

			_mouseObj = control.hitTest(stage.mouseX - control.x, stage.mouseY - control.y);
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
				IDrag(_dragCon).setDragPos(stage.mouseX - _dragCon.rect.x, stage.mouseY - _dragCon.rect.y);
				return;
			}
			
			
			var t:IControl = control.hitTest(stage.mouseX - control.x, stage.mouseY - control.y);
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
