package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.base.AbstractContainer;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.containers.Panel;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.sampler.getSampleCount;
	import flash.sampler.startSampling;
	import flash.utils.getTimer;
	
	import net.hires.debug.Stats;
	
	/**
	 * @author Macro
	 *
	 */
	[SWF(width="1000", height="600", frameRate="60")]
	public class TestPanel extends Sprite
	{
		
		
		
		private var c:AbstractContainer;
		
		private var d:Sprite;
		private var e:Sprite;
		
		public function TestPanel()
		{
			new UISettings();
			
			
			
//			c = new Container();
			c = new Panel();
//			c.backgroundColor = 0x66ff0000;
//			c.align = LayoutAlign.CENTER | LayoutAlign.BOTTOM;
			var l:Label = new Label();
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			l.backgroundColor = 0xffffff00;
			c.addChild(l);

			
			var u:UIImpl = new UIImpl(stage, c);
			addChild(new Bitmap(u.canvas));
			
			
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
