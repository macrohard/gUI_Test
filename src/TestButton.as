package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.assist.LayoutAlign;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.controls.Button;
	import com.macro.gUI.skin.SkinDef;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.Dictionary;
	
	import net.hires.debug.Stats;


	[SWF(width = "1000", height = "600", frameRate = "60")]
	public class TestButton extends Sprite
	{

		[Embed(source = "assets/Button_defaultImage.png")]
		private var normal:Class;

		[Embed(source = "assets/Button_rolloverImage.png")]
		private var over:Class;

		[Embed(source = "assets/Button_pressedImage.png")]
		private var down:Class;

		[Embed(source = "assets/Button_disabledImage.png")]
		private var disable:Class;




		private var control:Button;

		private var CP1:Sprite;

		private var CP2:Sprite;




		public function TestButton()
		{
			GameUI.init();
			GameUI.skinManager.registerSkin(SkinDef.BUTTON_NORMAL, Bitmap(new normal()).bitmapData,
											new Rectangle(13, 0, 39 - 13, 0), 0x22);
			GameUI.skinManager.registerSkin(SkinDef.BUTTON_OVER, Bitmap(new over()).bitmapData,
											new Rectangle(13, 0, 39 - 13, 0), 0x22);
			GameUI.skinManager.registerSkin(SkinDef.BUTTON_DOWN, Bitmap(new down()).bitmapData,
											new Rectangle(13, 0, 39 - 13, 0), 0x22);
			GameUI.skinManager.registerSkin(SkinDef.BUTTON_DISABLE, Bitmap(new disable()).bitmapData,
											new Rectangle(13, 0, 39 - 13, 0), 0x22);




			var ts:TextStyle = new TextStyle();
			ts.bold = true;
			ts.color = 0xffffff;
			ts.multiline = false;
			ts.wordWrap = false;

			control = new Button("");
			control.autoSize = false;
//			control.align = LayoutAlign.RIGHT | LayoutAlign.MIDDLE;
			control.backgroundColor = 0xFF00FFFF;
			control.text = "test aaa 看直fdafdafdsa dsa fdsa \n第2行内容，multiline为false时，不应看到它";
			control.normalStyle = ts;
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
