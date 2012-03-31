package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.controls.LinkButton;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.Dictionary;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestLinkButton extends Sprite
	{
		
		
		private var control:LinkButton;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;
		
		
		

		public function TestLinkButton()
		{
			GameUI.init();

			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.multiline = true;
			ts.wordWrap = false;

			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new LinkButton("");
			control.autoSize = false;
//			control.align = LayoutAlign.LEFT | LayoutAlign.MIDDLE;
			control.backgroundColor = 0xFFFFFFFF;
			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
//			control.overStyle = ts;
//			control.enabled = false;

			
			
			
			var u:UIImpl = new UIImpl(stage, control);
			addChild(new Bitmap(u.canvas));
			
			
			
			
			
			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 150;
			CP1.y = 150;
			addChild(CP1);
			
			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			addChild(CP2);
			
			onresize(null);
			
			addChild(new Stats());
		}
		
		private function onresize(evt:Event):void
		{
			control.x = Math.min(CP1.x, CP2.x);
			control.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}
	}
}
