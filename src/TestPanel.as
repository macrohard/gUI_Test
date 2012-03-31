package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.base.AbstractContainer;
	import com.macro.gUI.base.AbstractControl;
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
	import flash.utils.getTimer;
	
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
		
		private var c:AbstractContainer;
		
		private var d:Sprite;
		private var e:Sprite;
		
		public function TestPanel()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.PANEL_BG, Bitmap(new screen()).bitmapData, new Rectangle(8, 30, 560, 461));
			
//			c = new Container();
			c = new Panel();
//			c.backgroundColor = 0x66ff0000;
//			c.align = LayoutAlign.CENTER | LayoutAlign.BOTTOM;
			

			
			var u:UIImpl = new UIImpl(stage, c);
			addChild(new Bitmap(u.canvas));
			
			
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
			
		}
		
		private function onresize(evt:Event):void
		{
			c.x = Math.min(d.x, e.x);
			c.y = Math.min(d.y, e.y);
			c.resize(Math.abs(e.x - d.x), Math.abs(e.y - d.y));
		}
	}
}
