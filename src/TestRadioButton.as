package
{
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.composite.RadioButton;
	import com.macro.gUI.containers.Container;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestRadioButton extends Sprite
	{




		private var control:RadioButton;

		private var CP1:Sprite;

		private var CP2:Sprite;




		public function TestRadioButton()
		{
			new UISettings(stage);



			var c:Container = new Container();
			c.resize(stage.stageWidth, stage.stageHeight);

			//var l:Label = new Label("test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它", ts);
			control = new RadioButton("测试一下看看效果如何");
//			control.autoSize = false;
			control.radioGroup = 1;
//			control.align = LayoutAlign.CENTER | LayoutAlign.MIDDLE;
			var ts:TextStyle = new TextStyle();
			ts.size = 18;
			ts.bold = true;
			ts.font = "Microsoft YaHei";
			ts.color = 0xffffffff;
			control.setLabelStyle(ts);
//			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
//			control.selected = true;
//			control.enabled = false;

			c.addChild(control);


			var r:RadioButton = new RadioButton("kkkkk");
			r.radioGroup = 1;
			r.setLabelStyle(ts);
			r.x = 50;
			r.y = 300;
			c.addChild(r);



			var u:UIImpl = new UIImpl(stage, c);
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
