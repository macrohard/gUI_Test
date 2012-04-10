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



		private var list:TextArea;

		private var CP1:Sprite;

		private var CP2:Sprite;




		public function TestTextArea()
		{
			new UISettings();
			


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
