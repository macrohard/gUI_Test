package
{
    import com.macro.gUI.composite.List;
    
    import flash.display.Bitmap;
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
			new UISettings(stage);

			
			
            list = new List();
            list.addItem("first");
            list.addItem("second");
            list.addItem("third", 1);
            list.addItem("fouth");
            list.addItem("fifth");
            list.addItem("sixth");
            list.addItem("seventh");
            list.addItem("eighth");
            list.addItem("ninth");
			
			
			
			var u:UIImpl = new UIImpl(stage, list);
			addChild(new Bitmap(u.canvas));
			
			
			

            CP1 = new CPoint();
            CP1.addEventListener(Event.RESIZE, onmove);
            CP1.x = 150;
            CP1.y = 150;
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

    }
}
