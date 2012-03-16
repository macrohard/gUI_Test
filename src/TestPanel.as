package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.base.AbstractContainer;
	import com.macro.gUI.containers.Container;
	import com.macro.gUI.containers.Panel;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.sampler.getSampleCount;
	import flash.sampler.startSampling;
	
	import net.hires.debug.Stats;
	
	/**
	 * @author Macro
	 *
	 */
	[SWF(width="1000", height="600", frameRate="60")]
	public class TestPanel extends Sprite
	{
		
		[Embed(source="assets/screen.png")]
		private var screen:Class;
		
		[Embed(source="assets/top.png")]
		private var top:Class;
		
		private var c:AbstractContainer;
		private var b:Bitmap;
		private var t:Bitmap;
		
		private var d:Sprite;
		private var e:Sprite;
		
		public function TestPanel()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.PANEL_BG, Bitmap(new screen()).bitmapData, new Rectangle(8, 30, 560, 461));
			GameUI.skinManager.registerSkin(SkinDef.PANEL_COVER, Bitmap(new top()).bitmapData, new Rectangle(40, 40, 320, 320));
			
//			c = new Container();
			c = new Panel();
//			c.backgroundColor = 0x66ff0000;
//			c.align = LayoutAlign.CENTER | LayoutAlign.BOTTOM;
			b = new Bitmap(c.bitmapData);
			t = new Bitmap(c.bitmapDataCover);
			addChild(b);
			addChild(t);
			
			
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
			
			addChild(new Stats());
			this.addEventListener(Event.ENTER_FRAME, onenterframe);
			
		}
		
		private function onenterframe(evt:Event):void
		{
			e.x++;
			e.y++;
			if (e.x > 1200)
				e.x = 950;
			if (e.y > 800)
				e.y = 550;
			onresize(null);
		}
		
		private function onresize(evt:Event):void
		{
			t.x = b.x = Math.min(d.x, e.x);
			t.y = b.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
			b.bitmapData = c.bitmapData;
			t.bitmapData = c.bitmapDataCover;
		}
	}
}
