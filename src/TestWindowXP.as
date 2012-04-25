package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.containers.Window;
	import com.macro.gUI.controls.Button;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.events.ButtonEvent;
	import com.macro.gUI.events.WindowEvent;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import net.hires.debug.Stats;


	/**
	 * @author Macro
	 *
	 */
	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestWindowXP extends Sprite
	{


		private var c:Window;

		private var d:Sprite;

		private var e:Sprite;
		
		private var ui:UISettings;

		public function TestWindowXP()
		{
			ui = new UISettings(stage);



			c = new Window("测试窗口", Window.BUTTON_VISIBLE_MINIMIZE_CLOSE);
			c.align = LayoutAlign.LEFT | LayoutAlign.MIDDLE;
			c.addEventListener(WindowEvent.CLOSE_BUTTON_CLICK, closeButtonClickHandler);

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
			b.addEventListener(ButtonEvent.MOUSE_DOWN, mouseUpHandler);
			ui.mainContainer.addChild(b);

			
			

//			addChild(new Stats());
		}
		
		protected function closeButtonClickHandler(e:Event):void
		{
			ui.popupManager.removePopupWindow(c);
		}
		
		protected function mouseUpHandler(e:Event):void
		{
			ui.popupManager.addPopupWindow(c, true, true);
		}
		
	}
}
