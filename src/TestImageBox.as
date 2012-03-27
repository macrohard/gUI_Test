package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.controls.ImageBox;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestImageBox extends Sprite
	{
		[Embed(source="assets/top.png")]
		private var image:Class;
		
		[Embed(source="assets/IconButton_defaultImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/sprite_100001.swf")]
		private var movie:Class;
		
		private var c:ImageBox;

		private var b:Bitmap;
		
		private var d:Sprite;
		private var e:Sprite;

		public function TestImageBox()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.IMAGEBOX_BORDER, Bitmap(new normal()).bitmapData, new Rectangle(6, 6, 22, 22));
			
//			var s:Sprite = new ShapeExample();
//			addChild(s);
//			trace(s.getRect(null));
//			trace(s.getBounds(null));
//			return;
			
			var l:ImageBox = new ImageBox(new movie(), false);
			l.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			l.backgroundColor = 0x66FF0000;
//			l.margin = new Rectangle(10, 10);
//			l.setDefaultSize();
//			l.setSource(new ShapeExample());
			c = l;
			
			b = new Bitmap(c.bitmapData);
			addChild(b);
			
			d = new CPoint();
			d.addEventListener(Event.RESIZE, onresize);
			d.x = 50;
			d.y = 50;
			addChild(d);
			
			e = new CPoint();
			e.addEventListener(Event.RESIZE, onresize);
			e.x = 950;
			e.y = 550;
			addChild(e);
			
			onresize(null);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
			addChild(new Stats());
		}
		
		private function onresize(evt:Event):void
		{
			b.x = Math.min(d.x, e.x);
			b.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
		
		private function onEnterFrameHandler(e:Event):void
		{
			b.bitmapData = c.bitmapData;
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
