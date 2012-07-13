package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.containers.Panel;
	import com.macro.gUI.containers.Window;
	import com.macro.gUI.controls.Button;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.events.TouchEvent;
	import com.macro.gUI.events.WindowEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;


	/**
	 * @author Macro
	 *
	 */
	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestWindowXP extends Sprite
	{


		private var c:Window;
		
		private var cc:Window;

		private var d:Sprite;

		private var e:Sprite;
		
		private var ui:UISettings;

		public function TestWindowXP()
		{
			ui = new UISettings(stage);



			c = new Window(400, 400, "测试窗口", Window.BUTTON_VISIBLE_MINIMIZE_CLOSE);
			c.align = LayoutAlign.LEFT | LayoutAlign.MIDDLE;
			c.addEventListener(WindowEvent.CLOSE_BUTTON_CLICK, closeButtonClickHandler);

			var l:Label = new Label();
			l.backgroundColor = 0xffff0000;
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
					"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
					"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
					"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
					"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			l.alpha = 0.5;
			c.addChild(l);
			
			var t:Panel = new Panel(200, 200);
			t.x = t.y = 50;
//			t.visible = false;
			
			l = new Label("当调整舞台大小时，便可运行 resizeHandler() 方法。");
			l.x = l.y = 10;
			t.addChild(l);
			
			c.addChild(t);

			var b:Button = new Button("test");
			b.x = 400;
			b.y = 100;
			b.addEventListener(TouchEvent.MOUSE_DOWN, mouseUpHandler);
			ui.mainContainer.addChild(b);

			cc = new Window(200, 200);
			

//			addChild(new Stats());
		}
		
		protected function closeButtonClickHandler(e:Event):void
		{
			ui.popupManager.removeAll();
		}
		
		protected function mouseUpHandler(e:Event):void
		{
			ui.popupManager.addPopupWindow(c);
//			c.alpha = 0.5;
			ui.popupManager.addPopupWindow(cc);
		}
		
	}
}
