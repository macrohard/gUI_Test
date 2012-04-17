package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.containers.Window;
	import com.macro.gUI.controls.Button;
	import com.macro.gUI.controls.Label;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;
	
	/**
	 * @author Macro
	 *
	 */
	[SWF(width="1000", height="600", frameRate="60")]
	public class TestWindowXP extends Sprite
	{
		
		
		private var c:Window;
		
		private var d:Sprite;
		private var e:Sprite;
		
		public function TestWindowXP()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			
			c = new Window("测试窗口", Window.BUTTON_VISIBLE_MINIMIZE_CLOSE);
			c.align = LayoutAlign.LEFT | LayoutAlign.MIDDLE;
			
			var l:Label = new Label();
			l.backgroundColor = 0xffff0000;
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			
			c.addChild(l);

			
			var b:Button = new Button("test");
			b.x = 400;
			b.y = 100;
			ui.mainContainer.addChild(b);
			
			ui.uiManager.addPopupWindow(c, true);
			
			
			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 150;
			d.y = 150;
			addChild(d);
			
			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 950;
			e.y = 550;
			addChild(e);
			
			onresize(null);
			
			addChild(new Stats());
			
		}
		
		private function onresize(evt:Event):void
		{
			c.x = Math.min(d.x, e.x);
			c.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
