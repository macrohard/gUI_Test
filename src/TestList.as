package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.AbstractControl;
	import com.macro.gUI.base.IComposite;
	import com.macro.gUI.base.IContainer;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.composite.List;
	import com.macro.gUI.controls.Canvas;
	import com.macro.gUI.controls.Cell;
	import com.macro.gUI.controls.Label;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import net.hires.debug.Stats;

	[SWF(width="1000", height="600", frameRate="60")]
	public class TestList extends Sprite
	{
		[Embed(source = "assets/ScrollBar_thumbVertical_defaultImage.png")]
		private var block_normal:Class;
		
		[Embed(source = "assets/ScrollBar_thumbVertical_rolloverImage.png")]
		private var block_over:Class;
		
		[Embed(source = "assets/ScrollBar_thumbVertical_pressedImage.png")]
		private var block_down:Class;
		
		[Embed(source = "assets/ScrollBar_thumbVertical_disableImage.png")]
		private var block_disable:Class;
		
		
		
		[Embed(source = "assets/ScrollBar_arrowUp_defaultImage.png")]
		private var up_normal:Class;
		
		[Embed(source = "assets/ScrollBar_arrowUp_rolloverImage.png")]
		private var up_over:Class;
		
		[Embed(source = "assets/ScrollBar_arrowUp_pressedImage.png")]
		private var up_down:Class;
		
		[Embed(source = "assets/ScrollBar_arrowUp_disableImage.png")]
		private var up_disable:Class;
		
		
		
		[Embed(source = "assets/ScrollBar_arrowDown_defaultImage.png")]
		private var down_normal:Class;
		
		[Embed(source = "assets/ScrollBar_arrowDown_rolloverImage.png")]
		private var down_over:Class;
		
		[Embed(source = "assets/ScrollBar_arrowDown_pressedImage.png")]
		private var down_down:Class;
		
		[Embed(source = "assets/ScrollBar_arrowDown_disableImage.png")]
		private var down_disable:Class;
		
		
		
		[Embed(source = "assets/ScrollBar_verticalBGImage.png")]
		private var bg:Class;
		
		
		
		[Embed(source="assets/IconButton_disableImage.png")]
		private var normal:Class;
		
		[Embed(source="assets/TitleBar_defaultImage.png")]
		private var cell:Class;
		
		[Embed(source="assets/TitleBar_selectImage.png")]
		private var cellSelected:Class;
		
		private var list:List;

		private var CP1:Sprite;
		private var CP2:Sprite;
		
		
		private var canvas:BitmapData;

		public function TestList()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_NORMAL,
				Bitmap(new block_normal()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_OVER,
				Bitmap(new block_over()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DOWN,
				Bitmap(new block_down()).bitmapData, new Rectangle(8, 6, 0, 14));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DISABLE,
				Bitmap(new block_disable()).bitmapData, new Rectangle(8, 6, 0, 14));
			
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_NORMAL, Bitmap(new up_normal()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_OVER, Bitmap(new up_over()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_DOWN, Bitmap(new up_down()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_UP_DISABLE, Bitmap(new up_disable()).bitmapData,
				new Rectangle(7, 0));
			
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_NORMAL, Bitmap(new down_normal()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_OVER, Bitmap(new down_over()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_DOWN, Bitmap(new down_down()).bitmapData,
				new Rectangle(7, 0));
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_DOWN_DISABLE, Bitmap(new down_disable()).bitmapData,
				new Rectangle(7, 0));
			
			GameUI.skinManager.registerSkin(SkinDef.SCROLLBAR_VERTICAL_BG, Bitmap(new bg()).bitmapData,
				new Rectangle(8, 0, 0, 111));
			
			
			GameUI.skinManager.registerSkin(SkinDef.LIST_BG, Bitmap(new normal()).bitmapData, new Rectangle(6, 6, 22, 22));
			GameUI.skinManager.registerSkin(SkinDef.CELL_BG, Bitmap(new cell()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			GameUI.skinManager.registerSkin(SkinDef.CELL_SELECTED_BG, Bitmap(new cellSelected()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			
			
			canvas = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0);
			addChild(new Bitmap(canvas));
			
			
			
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
			
//			onEnterFrame(null);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addChild(new Stats());
		}
		
		private function onresize(evt:Event):void
		{
			list.x = Math.min(CP1.x, CP2.x);
			list.y = Math.min(CP1.y, CP2.y);
			list.resize(Math.abs(CP2.x - CP1.x), Math.abs(CP2.y - CP1.y));
		}
		
		private function onEnterFrame(event:Event):void
		{
			canvas.lock();
			canvas.fillRect(canvas.rect, 0xff333333);
			
			drawControl(list, canvas.rect);
			
			canvas.unlock();
		}
		
		
		private function drawControl(control:IControl, stageRect:Rectangle):void
		{
			var controlRect:Rectangle = control.rect;
			var p:Point = control.globalCoord();
			controlRect.x = p.x;
			controlRect.y = p.y;
			
			stageRect = stageRect.intersection(controlRect);
			 
			var drawR:Rectangle = stageRect.clone();
			drawR.offset(-p.x, -p.y);
			
			if (control.bitmapData != null)
			{
				canvas.copyPixels(control.bitmapData, drawR, stageRect.topLeft, null, null, true);
			}
			
			var container:IContainer;
			if (control is IContainer)
			{
				container = control as IContainer;
				
				var m:Rectangle = container.margin;
				stageRect.left += m.left;
				stageRect.top += m.top;
				stageRect.right -= m.right;
				stageRect.bottom -= m.bottom; 
				
				for each (var ic:IControl in container.children)
				{
					if (ic is IComposite)
					{
						drawControl((ic as IComposite).container, stageRect);
					}
					else
					{
						drawControl(ic, stageRect);
					}
				}
				
				if (container.bitmapDataCover != null)
				{
					canvas.copyPixels(container.bitmapDataCover, drawR, stageRect.topLeft, null, null, true);
				}
			}
			else if (control is IComposite)
			{
				drawControl((control as IComposite).container, stageRect);
			}
		}
		
	}
}
