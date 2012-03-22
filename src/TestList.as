package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.base.IComposite;
	import com.macro.gUI.base.IContainer;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.controls.Canvas;
	import com.macro.gUI.controls.Cell;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.controls.composite.List;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestList extends Sprite
	{
		[Embed(source="assets/IconButton_disableImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/TitleBar_defaultImage.png")]
		private var cell:Class;
		
		[Embed(source="assets/TitleBar_selectImage.png")]
		private var cellSelected:Class;
		
		private var control:List;

		private var CP1:Sprite;
		private var CP2:Sprite;
		
		private var map:Dictionary;
		private var sprite:Sprite;
		private var spriteMask:Shape;
		

		public function TestList()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.LIST_BG, Bitmap(new normal()).bitmapData, new Rectangle(6, 6, 22, 22));
			GameUI.skinManager.registerSkin(SkinDef.CELL_BG, Bitmap(new cell()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			GameUI.skinManager.registerSkin(SkinDef.CELL_SELECTED_BG, Bitmap(new cellSelected()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			
			control = new List();
			control.addItem("first");
			control.addItem("second");
			control.addItem("third", 1);
			control.addItem("fouth");
			control.addItem("fifth");
			control.addItem("sixth");
			control.addItem("seventh");
			control.addItem("eighth");
			control.addItem("ninth");
			
			
			map = new Dictionary();
			sprite = new Sprite();
			
			var b:Bitmap = new Bitmap(control.bitmapData);
			b.x = control.x;
			b.y = control.y;
			map[control] = b;
			sprite.addChild(b);
			
			for each (var ic:IControl in control.children)
			{
				b = new Bitmap(ic.bitmapData);
				b.x = ic.rect.x;
				b.y = ic.rect.y;
				map[ic] = b;
				sprite.addChild(b);
				
				if (ic is IContainer)
				{
					var container:IContainer = ic as IContainer;
					for each (ic in container.children)
					{
						b = new Bitmap(ic.bitmapData);
						b.x = ic.rect.x;
						b.y = ic.rect.y;
						map[ic] = b;
						sprite.addChild(b);
					}
				}
			}
			
			spriteMask = new Shape();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(0, 0, control.width, control.height);
			spriteMask.graphics.endFill();
			sprite.mask = spriteMask;
			sprite.addChild(spriteMask);
			
			addChild(sprite);
			
			
			
			
			
			CP1 = new CPoint();
			CP1.addEventListener(Event.RESIZE, onresize);
			CP1.x = 50;
			CP1.y = 50;
			addChild(CP1);
			
			CP2 = new CPoint();
			CP2.addEventListener(Event.RESIZE, onresize);
			CP2.x = 950;
			CP2.y = 550;
			addChild(CP2);
			
			onresize(null);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnerFrame);
		}
		
		protected function onEnerFrame(event:Event):void
		{
			for (var obj:Object in map)
			{
				var ic:IControl = obj as IControl;
				var b:Bitmap = map[ic];
				b.bitmapData = ic.bitmapData;
				b.x = ic.rect.x;
				b.y = ic.rect.y;
			}
		}
		
		private function onresize(evt:Event):void
		{
			control.x = sprite.x = Math.min(CP1.x, CP2.x);
			control.y = sprite.y = Math.min(CP1.y, CP2.y);
			control.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
			
			spriteMask.graphics.clear();
			spriteMask.graphics.beginFill(0);
			spriteMask.graphics.drawRect(0, 0, control.width, control.height);
			spriteMask.graphics.endFill();
		}
	}
}
