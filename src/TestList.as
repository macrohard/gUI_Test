package
{
    import com.macro.gUI.composite.List;
    import com.macro.gUI.controls.Button;
    import com.macro.gUI.events.TouchEvent;
    
    import flash.display.Sprite;
    import flash.events.Event;
    
    import net.hires.debug.Stats;

    [SWF(width = "1000", height = "600", frameRate = "60")]
    public class TestList extends Sprite
    {

		
        private var list:List;

        private var CP1:Sprite;

        private var CP2:Sprite;


        

        public function TestList()
        {
			var ui:UISettings = new UISettings(stage);

			
			
            list = new List(200);
            list.addItem("first");
            list.addItem("second");
            list.addItem("third", 1);
            list.addItem("fouth");
            list.addItem("fifth");
            list.addItem("sixth");
            list.addItem("seventh");
            list.addItem("eighth");
            list.addItem("ninth");
			
			list.setHeightByLines(5);
			
			ui.mainContainer.addChild(list);
			
			
			var b:Button = new Button("test");
			b.x = 400;
			b.y = 100;
			b.addEventListener(TouchEvent.MOUSE_DOWN, mouseUpHandler);
			ui.mainContainer.addChild(b);
			
			

            CP1 = new CPoint();
            CP1.addEventListener(Event.RESIZE, onmove);
            CP1.x = 250;
            CP1.y = 250;
            addChild(CP1);

            CP2 = new CPoint();
            CP2.addEventListener(Event.RESIZE, onresize);
            addChild(CP2);

            onmove(null);

            addChild(new Stats());
        }

        private function onmove(e:Event):void
        {
			list.x = CP1.x;
			list.y = CP1.y;
			
            CP2.x = CP1.x + list.width;
            CP2.y = CP1.y + list.height;
        }

        private function onresize(e:Event):void
        {
            list.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
        }
		
		protected function mouseUpHandler(e:TouchEvent):void
		{
			list.selectedIndex = -1;
		}

    }
}
