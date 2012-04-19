package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.containers.Window;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;
	
	/**
	 * @author Macro
	 *
	 */
	[SWF(width="1000", height="600", frameRate="60")]
	public class TestWindowChrome extends Sprite
	{
		
		[Embed(source="assets/chrome/bg.png")]
		private var bg:Class;
		
		
		[Embed(source="assets/chrome/min.png")]
		private var min:Class;
		
		[Embed(source="assets/chrome/min_over.png")]
		private var min_over:Class;
		
		[Embed(source="assets/chrome/min_down.png")]
		private var min_down:Class;
		
		[Embed(source="assets/chrome/min_disable.png")]
		private var min_disable:Class;
		
		
		[Embed(source="assets/chrome/max.png")]
		private var max:Class;
		
		[Embed(source="assets/chrome/max_over.png")]
		private var max_over:Class;
		
		[Embed(source="assets/chrome/max_down.png")]
		private var max_down:Class;
		
		[Embed(source="assets/chrome/max_disable.png")]
		private var max_disable:Class;
		
		
		[Embed(source="assets/chrome/close.png")]
		private var close:Class;
		
		[Embed(source="assets/chrome/close_over.png")]
		private var close_over:Class;
		
		[Embed(source="assets/chrome/close_down.png")]
		private var close_down:Class;
		
		
		
		private var c:Window;
		
		private var d:Sprite;
		private var e:Sprite;
		
		public function TestWindowChrome()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			GameUI.skinManager.setSkin(SkinDef.WINDOW_BG, Bitmap(new bg()).bitmapData, new Rectangle(5, 77, 825, 501));
			
			GameUI.skinManager.setSkin(SkinDef.MINIMIZE_BUTTON, Bitmap(new min()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MINIMIZE_BUTTON_OVER, Bitmap(new min_over()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MINIMIZE_BUTTON_DOWN, Bitmap(new min_down()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MINIMIZE_BUTTON_DISABLE, Bitmap(new min_disable()).bitmapData);
			
			GameUI.skinManager.setSkin(SkinDef.MAXIMIZE_BUTTON, Bitmap(new max()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MAXIMIZE_BUTTON_OVER, Bitmap(new max_over()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MAXIMIZE_BUTTON_DOWN, Bitmap(new max_down()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.MAXIMIZE_BUTTON_DISABLE, Bitmap(new max_disable()).bitmapData);
			
			GameUI.skinManager.setSkin(SkinDef.CLOSE_BUTTON, Bitmap(new close()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.CLOSE_BUTTON_OVER, Bitmap(new close_over()).bitmapData);
			GameUI.skinManager.setSkin(SkinDef.CLOSE_BUTTON_DOWN, Bitmap(new close_down()).bitmapData);
			
			
			c = new Window("测试窗口", Window.BUTTON_VISIBLE_MAXIMIZ_CLOSE, Window.BUTTON_LAYOUT_CHROME);
			c.align = LayoutAlign.LEFT | LayoutAlign.MIDDLE;
			
			var l:Label = new Label();
			l.backgroundColor = 0xffff0000;
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			
			c.addChild(l);
			
			
			ui.mainContainer.addChild(c);
			
			
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
