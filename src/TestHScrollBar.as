package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.controls.composite.HScrollBar;
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
	public class TestHScrollBar extends Sprite
	{

		[Embed(source = "assets/ScrollBar_thumbHorizontal_defaultImage.png")]
		private var block_normal:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_rolloverImage.png")]
		private var block_over:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_pressedImage.png")]
		private var block_down:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_disableImage.png")]
		private var block_disable:Class;



		[Embed(source = "assets/ScrollBar_arrowLeft_defaultImage.png")]
		private var left_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_rolloverImage.png")]
		private var left_over:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_pressedImage.png")]
		private var left_down:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_disableImage.png")]
		private var left_disable:Class;



		[Embed(source = "assets/ScrollBar_arrowRight_defaultImage.png")]
		private var right_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_rolloverImage.png")]
		private var right_over:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_pressedImage.png")]
		private var right_down:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_disableImage.png")]
		private var right_disable:Class;



		[Embed(source = "assets/ScrollBar_horizontalBGImage.png")]
		private var bg:Class;



		private var control:HScrollBar;

		private var sprite:Sprite;

		private var map:Dictionary;

		private var spriteMask:Shape;

		private var CP1:Sprite;

		private var CP2:Sprite;



		public function TestHScrollBar()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_NORMAL,
											Bitmap(new block_normal()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_OVER,
											Bitmap(new block_over()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DOWN,
											Bitmap(new block_down()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DISABLE,
											Bitmap(new block_disable()).bitmapData, new Rectangle(6, 7, 14));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_LEFT_NORMAL, Bitmap(new left_normal()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_LEFT_OVER, Bitmap(new left_over()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_LEFT_DOWN, Bitmap(new left_down()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_LEFT_DISABLE, Bitmap(new left_disable()).bitmapData,
											new Rectangle(0, 7));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_RIGHT_NORMAL, Bitmap(new right_normal()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_RIGHT_OVER, Bitmap(new right_over()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_RIGHT_DOWN, Bitmap(new right_down()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_RIGHT_DISABLE, Bitmap(new right_disable()).bitmapData,
											new Rectangle(0, 7));

			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_HORIZONTAL_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(0, 7, 111));


			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new HScrollBar();
			control.autoSize = false;
//			c.minimum = 10;
//			c.stepSize = 2;
//			c.maximum = 99;
//			c.align = LayoutAlign.CENTER | LayoutAlign.TOP;
			control.backgroundColor = 0xFF999999;
//			c.margin = new Rectangle(30, 15);
//			c.enabled = false;





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
