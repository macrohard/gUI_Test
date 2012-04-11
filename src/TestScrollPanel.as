package
{
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.containers.ScrollPanel;
	import com.macro.gUI.controls.Label;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;
	
	
	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestScrollPanel extends Sprite
	{
		
		
		
		private var list:ScrollPanel;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;
		
		
		
		
		public function TestScrollPanel()
		{
			new UISettings(stage);
			
			
			
			list = new ScrollPanel();
			
			
			var ts:TextStyle = new TextStyle();
			ts.multiline = true;
			ts.wordWrap = false;
//			ts.color = 0xffffff;
			
			var l:Label = new Label();
			l.style = ts;
			l.backgroundColor = 0xffffff00;
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
//			l.x = -100;
//			l.y = -20;
			list.addChild(l);
			
			
			var b:Label = new Label();
			b.style = ts;
			b.backgroundColor = 0xff00ffff;
			b.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			
			b.x = 200;
			b.y = 50;
			list.addChild(b);
			
			
//			list.swapChildren(l, b);
			
			
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
