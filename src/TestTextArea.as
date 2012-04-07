package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.composite.List;
	import com.macro.gUI.composite.TextArea;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestTextArea extends Sprite
	{

		[Embed(source = "assets/ScrollBar_thumbVertical_defaultImage.png")]
		private var vblock_normal:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_rolloverImage.png")]
		private var vblock_over:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_pressedImage.png")]
		private var vblock_down:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_disableImage.png")]
		private var vblock_disable:Class;



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
		private var vbg:Class;





		[Embed(source = "assets/ScrollBar_thumbHorizontal_defaultImage.png")]
		private var hblock_normal:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_rolloverImage.png")]
		private var hblock_over:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_pressedImage.png")]
		private var hblock_down:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_disableImage.png")]
		private var hblock_disable:Class;




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
		private var hbg:Class;






		[Embed(source = "assets/IconButton_disableImage.png")]
		private var normal:Class;




		private var list:TextArea;

		private var CP1:Sprite;

		private var CP2:Sprite;




		public function TestTextArea()
		{
			GameUI.init();
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_NORMAL,
											Bitmap(new vblock_normal()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_OVER, Bitmap(new vblock_over()).bitmapData,
											new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DOWN, Bitmap(new vblock_down()).bitmapData,
											new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DISABLE,
											Bitmap(new vblock_disable()).bitmapData, new Rectangle(8, 6, 0, 14));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_UP_NORMAL, Bitmap(new up_normal()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_UP_OVER, Bitmap(new up_over()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_UP_DOWN, Bitmap(new up_down()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_UP_DISABLE, Bitmap(new up_disable()).bitmapData,
											new Rectangle(7, 0));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_NORMAL, Bitmap(new down_normal()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_OVER, Bitmap(new down_over()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_DOWN, Bitmap(new down_down()).bitmapData,
											new Rectangle(7, 0));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_DISABLE, Bitmap(new down_disable()).bitmapData,
											new Rectangle(7, 0));

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BG, Bitmap(new vbg()).bitmapData,
											new Rectangle(8, 0, 0, 111));


			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_NORMAL,
											Bitmap(new hblock_normal()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_OVER,
											Bitmap(new hblock_over()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DOWN,
											Bitmap(new hblock_down()).bitmapData, new Rectangle(6, 7, 14));
			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DISABLE,
											Bitmap(new hblock_disable()).bitmapData, new Rectangle(6, 7, 14));

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

			GameUI.skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BG, Bitmap(new hbg()).bitmapData,
											new Rectangle(0, 7, 111));



			GameUI.skinManager.setSkin(SkinDef.TEXTAREA_BG, Bitmap(new normal()).bitmapData,
											new Rectangle(6, 6, 22, 22));




			list = new TextArea();
			list.wordWrap = false;
			list.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";



			var u:UIImpl = new UIImpl(stage, list);
			addChild(new Bitmap(u.canvas));




			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onmove);
			CP1.x = 150;
			CP1.y = 150;
			addChild(CP1);

			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			addChild(CP2);

			onmove(null);

			addChild(new Stats());
		}

		private function onmove(e:Event):void
		{
			list.x = CP1.x;
			list.y = CP1.y;

			CP2.x = CP1.x + list.width;
			CP2.y = CP1.y + list.height;
		}
 
		private function onresize(e:Event):void
		{
			list.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}

	}
}
