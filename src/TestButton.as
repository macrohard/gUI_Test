package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.controls.Button;
	import com.macro.gUI.events.TouchEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestButton extends Sprite
	{

		




		private var control:Button;

		private var CP1:Sprite;

		private var CP2:Sprite;




		public function TestButton()
		{
			var s:Sprite = new Sprite();
			s.x = 100;
			s.y = 100;
			addChild(s);
			
			var ui:UISettings = new UISettings(s, 500, 400);




			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.color = 0xffffff;
			ts.multiline = true;
			ts.wordWrap = false;
			ts.size = 18;

			control = new Button("");
			control.autoSize = false;
//			control.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			control.backgroundColor = 0xFF00FFFF;
			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
			control.doubleClickEnabled = true;
//			control.style = ts;
//			control.enabled = false;
			
			control.pivotX = -50;
			control.pivotY = -20;
			
			control.addEventListener(TouchEvent.MOUSE_DOWN, mouseDownHandler);
			control.addEventListener(TouchEvent.MOUSE_UP, mouseUpHandler);
			control.addEventListener(TouchEvent.CLICK, clickHandler);
			control.addEventListener(TouchEvent.DOUBLE_CLICK, doubleClickHandler);


			ui.mainContainer.addChild(control);





			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 150;
			CP1.y = 150;
			stage.addChild(CP1);

			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			stage.addChild(CP2);

			onresize(null);

			addChild(new Stats());
//			stage.addEventListener(Event.ENTER_FRAME, test);
		}
		
//		private function test(e:Event):void
//		{
//			trace(GameUI.uiManager.interactiveManager.mouseControl);
//		}
		
		protected function doubleClickHandler(event:TouchEvent):void
		{
			trace("doubleClick");
		}
		
		protected function mouseUpHandler(event:TouchEvent):void
		{
			trace("mouseUp");
		}
		
		protected function mouseDownHandler(event:TouchEvent):void
		{
			trace("mouseDown");
		}
		
		protected function clickHandler(event:TouchEvent):void
		{
			trace("click");
		}
		
		private function onresize(evt:Event):void
		{
			control.x = Math.min(CP1.x, CP2.x);
			control.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}

	}
}
