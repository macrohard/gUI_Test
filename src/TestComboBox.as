package
{
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.composite.ComboBox;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;
	
	
	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestComboBox extends Sprite
	{
		
		
		
		
		
		private var control:ComboBox;
		
		private var CP1:Sprite;
		
		private var CP2:Sprite;
		
		
		
		public function TestComboBox()
		{
			var ui:UISettings = new UISettings(stage);
			
			
			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new ComboBox("测试一下看看效果如何");
			control.autoSize = false;
			control.align = LayoutAlign.LEFT | LayoutAlign.BOTTOM;
			//			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
			//			control.selected = true;
			//			control.enabled = false;
			control.backgroundColor = 0x33333333;
			
//			control.editable = false;
//			control.enabled = false;
			control.addItem("first");
			control.addItem("second");
			control.addItem("third", 1);
			control.addItem("fouth");
			control.addItem("fifth");
			control.addItem("sixth");
			control.addItem("seventh");
			control.addItem("eighth");
			control.addItem("ninth");
			
			control.pivotX = 20;
			control.pivotY = 10;
			
			ui.mainContainer.addChild(control);
			
			
			
			
			
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
