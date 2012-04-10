package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.Margin;
	import com.macro.gUI.assist.Viewport;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.composite.HScrollBar;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.controls.ImageBox;
	import com.macro.gUI.controls.Label;
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
	
	import net.hires.debug.Stats;


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

		private var CP1:Sprite;

		private var CP2:Sprite;
		
		

		public function TestHScrollBar()
		{
			GameUI.init();
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_NORMAL,
											Bitmap(new block_normal()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_OVER,
											Bitmap(new block_over()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DOWN,
											Bitmap(new block_down()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DISABLE,
											Bitmap(new block_disable()).bitmapData, new Rectangle(6, 7, 14));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_NORMAL, Bitmap(new left_normal()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_OVER, Bitmap(new left_over()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_DOWN, Bitmap(new left_down()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_DISABLE, Bitmap(new left_disable()).bitmapData,
											new Rectangle(0, 7));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_NORMAL, Bitmap(new right_normal()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_OVER, Bitmap(new right_over()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_DOWN, Bitmap(new right_down()).bitmapData,
											new Rectangle(0, 7));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_DISABLE, Bitmap(new right_disable()).bitmapData,
											new Rectangle(0, 7));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BG, Bitmap(new bg()).bitmapData,
											new Rectangle(0, 7, 111));


			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new HScrollBar();
//			control.autoSize = false;
//			c.minimum = 10;
//			c.stepSize = 2;
//			c.maximum = 99;
//			c.align = LayoutAlign.CENTER | LayoutAlign.TOP;
//			c.margin = new Rectangle(30, 15);
//			c.enabled = false;


			
			var rect:Rectangle = new Rectangle(150, 200, 200, 200);
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1, 0);
			shape.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			var image:ImageBox = new ImageBox(shape);
			
			var content:Label = new Label("test aaa 看直fdafdafdsa dsa fdsajfdkjf  kajdksa lkdsa djdksja klfdjsak jkdsj dja kjfdksj klfdj j;aja;");
			content.backgroundColor = 0xFF666666;
			content.y = 300;
			
			control.viewport = new Viewport(rect, content, new Margin(5, 5, 5, 5));
			
			var container:Container = new Container(stage.stageWidth, stage.stageHeight);
			container.addChild(image);
			container.addChild(control);
			container.addChild(content);



			var u:UIImpl = new UIImpl(stage, container);
			addChild(new Bitmap(u.canvas));




			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 150;
			CP1.y = 150;
			addChild(CP1);

			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			addChild(CP2);

			onresize(null);

			addChild(new Stats());
		}
		
		private function onresize(evt:Event):void
		{
			control.x = Math.min(CP1.x, CP2.x);
			control.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}

	}
}
