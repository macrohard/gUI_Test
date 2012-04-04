package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.assist.Viewport;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.composite.VScrollBar;
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


	[SWF(width = "1000", height = "600", frameRate = "60", backgroundColor = "0x999999")]
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

		private var CP1:Sprite;

		private var CP2:Sprite;

		
		private var content:Label;


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
			control.padding = new Rectangle(20, 15);
//			control.enabled = false;


			var rect:Rectangle = new Rectangle(150, 200, 200, 100);
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1, 0);
			shape.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			var image:ImageBox = new ImageBox(shape);
			
			var content:Label = new Label("test aaa \n看直fdaf\ndafdsa d\nsa fdsaj\nfdkjf  ka\njdksa\n lkdsa\n djdks\nja klfd\n\njsak jkdsj dja kjfdksj klfdj j;aja;");
			content.backgroundColor = 0xFF666666;
			content.x = 180;
			var st:TextStyle = content.style;
			st.multiline = true;
			content.style = st;
			
			control.viewport = new Viewport(rect, content, new Rectangle(0, 5));
			
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
