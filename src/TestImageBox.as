package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.containers.BackgroundPanel;
	import com.macro.gUI.controls.ImageBox;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.core.AbstractControl;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestImageBox extends Sprite
	{
		[Embed(source="assets/top.png")]
		private var image:Class;
		
		
		
		private var c:AbstractControl;

		private var d:Sprite;
		private var e:Sprite;

		
		public function TestImageBox()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			
//			var b:ImageBox = new ImageBox(new ShapeExample(), false);
			var b:BackgroundPanel = new BackgroundPanel(new ShapeExample(), false);
			b.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			b.backgroundColor = 0x66FF0000;
//			b.margin = new Rectangle(10, 10);
//			b.setDefaultSize();
//			b.setSource(new ShapeExample());
			
			
			var l:Label = new Label();
			l.backgroundColor = 0xffff0000;
			l.text = "下例使用 StageExample 类在激活舞台或调整舞台大小时调度事件。执行下列步骤可完成此操作：\n" +
				"无论 Flash Player 窗口的大小如何，类的构造函数都会首先将 Flash 应用程序设置为固定大小，\n" +
				"然后使用 activateHandler() 和 resizeHandler() 方法添加两个事件侦听器。\n" +
				"用鼠标左键单击后，便可运行 activateHandler() 方法。\n" +
				"当调整舞台大小时，便可运行 resizeHandler() 方法。";
			
			b.addChild(l);
			
			c = b;
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
import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;

class ShapeExample extends Sprite {
	private var size:uint           = 80;
	private var bgColor:uint       = 0xFFCC00;
	private var borderColor:uint  = 0x666666;
	private var borderSize:uint   = 0;
	private var cornerRadius:uint = 9;
	private var gutter:uint       = 5;
	
	public function ShapeExample() {
		doDrawCircle();
		doDrawRoundRect();
		doDrawRect();
		refreshLayout();
	}
	
	private function refreshLayout():void {
		var ln:uint = numChildren;
		var child:DisplayObject;
		var lastChild:DisplayObject = getChildAt(0);
		lastChild.x = gutter;
		lastChild.y = gutter;
		for (var i:uint = 1; i < ln; i++) {
			child = getChildAt(i);
			child.x = gutter + lastChild.x + lastChild.width;
			child.y = gutter;
			lastChild = child;
		}
	}
	
	private function doDrawCircle():void {
		var child:Shape = new Shape();
		var halfSize:uint = Math.round(size/2);
		child.graphics.beginFill(bgColor);
		child.graphics.lineStyle(borderSize, borderColor);
		child.graphics.drawCircle(halfSize, halfSize, halfSize);
		child.graphics.endFill();
		addChild(child);
	}
	
	private function doDrawRoundRect():void {
		var child:Shape = new Shape();
		child.graphics.beginFill(bgColor);
		child.graphics.lineStyle(borderSize, borderColor);
		child.graphics.drawRoundRect(0, 0, size, size, cornerRadius);
		child.graphics.endFill();
		addChild(child);
	}
	
	private function doDrawRect():void {
		var child:Shape = new Shape();
		child.graphics.beginFill(bgColor);
		child.graphics.lineStyle(borderSize, borderColor);
		child.graphics.drawRect(0, 0, size, size);
		child.graphics.endFill();
		addChild(child);
	}
}
