package
{
	import com.macro.gUI.GameUI;
	import com.macro.gUI.assist.TextStyle;
	import com.macro.gUI.core.IContainer;
	import com.macro.gUI.core.PopUpManager;
	import com.macro.gUI.renders.RenderMode;
	import com.macro.gUI.skin.SkinDef;
	import com.macro.gUI.skin.SkinManager;
	import com.macro.gUI.skin.StyleDef;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.text.TextFormatAlign;


	public class UISettings
	{

		[Embed(source = "assets/TextInput_defaultImage.png")]
		private var textinput:Class;

		[Embed(source = "assets/TextInput_disableImage.png")]
		private var textinput_disable:Class;

		[Embed(source = "assets/IconButton_disableImage.png")]
		private var textarea:Class;

		[Embed(source = "assets/TitleBar_defaultImage.png")]
		private var titlebar:Class;



		[Embed(source = "assets/Button_defaultImage.png")]
		private var button_normal:Class;

		[Embed(source = "assets/Button_rolloverImage.png")]
		private var button_over:Class;

		[Embed(source = "assets/Button_pressedImage.png")]
		private var button_down:Class;

		[Embed(source = "assets/Button_disabledImage.png")]
		private var button_disable:Class;



		[Embed(source = "assets/ToggleButton_defaultImage.png")]
		private var selected_normal:Class;

		[Embed(source = "assets/ToggleButton_rolloverImage.png")]
		private var selected_over:Class;

		[Embed(source = "assets/ToggleButton_pressedImage.png")]
		private var selected_down:Class;

		[Embed(source = "assets/ToggleButton_disabledImage.png")]
		private var selected_disable:Class;



		[Embed(source = "assets/IconButton_defaultImage.png")]
		private var icon_normal:Class;

		[Embed(source = "assets/IconButton_rolloverImage.png")]
		private var icon_over:Class;

		[Embed(source = "assets/IconButton_pressedImage.png")]
		private var icon_down:Class;

		[Embed(source = "assets/IconButton_disableImage.png")]
		private var icon_disable:Class;




		[Embed(source = "assets/CheckBox_defaultImage.png")]
		private var checkbox:Class;

		[Embed(source = "assets/CheckBox_disabledImage.png")]
		private var checkbox_disable:Class;

		[Embed(source = "assets/CheckBox_selectedImage.png")]
		private var checkbox_selected:Class;

		[Embed(source = "assets/CheckBox_selectedDisableImage.png")]
		private var checkbox_selected_disable:Class;



		[Embed(source = "assets/RadioButton_defaultImage.png")]
		private var radio:Class;

		[Embed(source = "assets/RadioButton_disabledImage.png")]
		private var radio_disable:Class;

		[Embed(source = "assets/RadioButton_selectedImage.png")]
		private var radio_selected:Class;

		[Embed(source = "assets/RadioButton_selectedDisabledImage.png")]
		private var radio_selected_disable:Class;



		[Embed(source = "assets/ProgressBar_horizotalFGImage.png")]
		private var progressbar_filling:Class;

		[Embed(source = "assets/ProgressBar_horizotalBGImage.png")]
		private var progressbar:Class;




		[Embed(source = "assets/Slider_block_defaultImage.png")]
		private var slider_normal:Class;

		[Embed(source = "assets/Slider_block_rolloverImage.png")]
		private var slider_over:Class;

		[Embed(source = "assets/Slider_block_pressedImage.png")]
		private var slider_down:Class;

		[Embed(source = "assets/Slider_block_disableImage.png")]
		private var slider_disable:Class;

		[Embed(source = "assets/Slider_horizontal_trackImage.png")]
		private var slider_hbg:Class;

		[Embed(source = "assets/Slider_vertical_trackImage.png")]
		private var slider_vbg:Class;




		[Embed(source = "assets/ScrollBar_thumbHorizontal_defaultImage.png")]
		private var hblock:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_rolloverImage.png")]
		private var hblock_over:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_pressedImage.png")]
		private var hblock_down:Class;

		[Embed(source = "assets/ScrollBar_thumbHorizontal_disableImage.png")]
		private var hblock_disable:Class;


		[Embed(source = "assets/ScrollBar_arrowLeft_defaultImage.png")]
		private var left_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_rolloverImage.png")]
		private var left_over:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_pressedImage.png")]
		private var left_down:Class;

		[Embed(source = "assets/ScrollBar_arrowLeft_disableImage.png")]
		private var left_disable:Class;


		[Embed(source = "assets/ScrollBar_arrowRight_defaultImage.png")]
		private var right_normal:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_rolloverImage.png")]
		private var right_over:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_pressedImage.png")]
		private var right_down:Class;

		[Embed(source = "assets/ScrollBar_arrowRight_disableImage.png")]
		private var right_disable:Class;


		[Embed(source = "assets/ScrollBar_horizontalBGImage.png")]
		private var hbg:Class;








		[Embed(source = "assets/ScrollBar_thumbVertical_defaultImage.png")]
		private var vblock:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_rolloverImage.png")]
		private var vblock_over:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_pressedImage.png")]
		private var vblock_down:Class;

		[Embed(source = "assets/ScrollBar_thumbVertical_disableImage.png")]
		private var vblock_disable:Class;


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
		private var vbg:Class;




		[Embed(source = "assets/IconButton_disableImage.png")]
		private var list:Class;

		[Embed(source = "assets/List_defaultImage.png")]
		private var list_item:Class;

		[Embed(source = "assets/List_overImage.png")]
		private var list_item_over:Class;

		[Embed(source = "assets/List_selectImage.png")]
		private var list_item_selected:Class;




		[Embed(source = "assets/ComboInput_defaultImage.png")]
		private var combo_input:Class;

		[Embed(source = "assets/ComboInput_disableImage.png")]
		private var combo_input_disable:Class;

		[Embed(source = "assets/ComboButton_defaultImage.png")]
		private var combo_button:Class;

		[Embed(source = "assets/ComboButton_rolloverImage.png")]
		private var combo_button_over:Class;

		[Embed(source = "assets/ComboButton_pressedImage.png")]
		private var combo_button_down:Class;

		[Embed(source = "assets/ComboButton_disabledImage.png")]
		private var combo_button_disable:Class;




		[Embed(source = "assets/screen.png")]
		private var panel:Class;


		[Embed(source = "assets/IconButton_disableImage.png")]
		private var scrollpanel:Class;




		[Embed(source = "assets/xp/bg.png")]
		private var window:Class;


		[Embed(source = "assets/xp/min.png")]
		private var min:Class;

		[Embed(source = "assets/xp/min_over.png")]
		private var min_over:Class;

		[Embed(source = "assets/xp/min_down.png")]
		private var min_down:Class;

		[Embed(source = "assets/xp/min_disable.png")]
		private var min_disable:Class;


		[Embed(source = "assets/xp/max.png")]
		private var max:Class;

		[Embed(source = "assets/xp/max_over.png")]
		private var max_over:Class;

		[Embed(source = "assets/xp/max_down.png")]
		private var max_down:Class;

		[Embed(source = "assets/xp/max_disable.png")]
		private var max_disable:Class;


		[Embed(source = "assets/xp/close.png")]
		private var close:Class;

		[Embed(source = "assets/xp/close_over.png")]
		private var close_over:Class;

		[Embed(source = "assets/xp/close_down.png")]
		private var close_down:Class;




		[Embed(source = "assets/TabPanel.png")]
		private var tabpanel:Class;

		[Embed(source = "assets/Tab.png")]
		private var tab:Class;

		[Embed(source = "assets/Tab_selected.png")]
		private var tabSelected:Class;



		public function UISettings(container:DisplayObjectContainer, width:int = 0, height:int = 0)
		{
			if (container is Stage)
			{
				var stage:Stage = container as Stage;
				width = stage.stageWidth;
				height = stage.stageHeight;

				stage.stageFocusRect = false;
				stage.tabChildren = false;
//				stage.mouseChildren = false;
				stage.scaleMode = StageScaleMode.NO_SCALE;
			}

			GameUI.init(container, width, height, RenderMode.RENDER_MODE_LAYER);

			initSkins(GameUI.skinManager);
			initStyles(GameUI.skinManager);

		}


		public function get popupManager():PopUpManager
		{
			return GameUI.popupManager;
		}

		public function get mainContainer():IContainer
		{
			return GameUI.uiManager.stage;
		}



		private function initSkins(skinManager:SkinManager):void
		{

			skinManager.setSkin(SkinDef.TEXTINPUT_BG, Bitmap(new textinput()).bitmapData, new Rectangle(14, 0, 7, 0), 0x21);
			skinManager.setSkin(SkinDef.TEXTINPUT_BG_DISABLE, Bitmap(new textinput_disable()).bitmapData, new Rectangle(14, 0, 7, 0), 0x21);
			skinManager.setSkin(SkinDef.TEXTAREA_BG, Bitmap(new textarea()).bitmapData, new Rectangle(6, 6, 22, 22));
			skinManager.setSkin(SkinDef.TITLEBAR_BG, Bitmap(new titlebar()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));


			skinManager.setSkin(SkinDef.BUTTON, Bitmap(new button_normal()).bitmapData, new Rectangle(13, 0, 39 - 13, 0), 0x22);
			skinManager.setSkin(SkinDef.BUTTON_OVER, Bitmap(new button_over()).bitmapData, new Rectangle(13, 0, 39 - 13, 0), 0x22);
			skinManager.setSkin(SkinDef.BUTTON_DOWN, Bitmap(new button_down()).bitmapData, new Rectangle(13, 0, 39 - 13, 0), 0x22);
			skinManager.setSkin(SkinDef.BUTTON_DISABLE, Bitmap(new button_disable()).bitmapData, new Rectangle(13, 0, 39 - 13, 0), 0x22);


			skinManager.setSkin(SkinDef.TOGGLEBUTTON_SELECTED, Bitmap(new selected_normal()).bitmapData, new Rectangle(13, 0, 39 - 13, 0));
			skinManager.setSkin(SkinDef.TOGGLEBUTTON_SELECTED_OVER, Bitmap(new selected_over()).bitmapData,
								new Rectangle(13, 0, 39 - 13, 0));
			skinManager.setSkin(SkinDef.TOGGLEBUTTON_SELECTED_DOWN, Bitmap(new selected_down()).bitmapData,
								new Rectangle(13, 0, 39 - 13, 0));
			skinManager.setSkin(SkinDef.TOGGLEBUTTON_SELECTED_DISABLE, Bitmap(new selected_disable()).bitmapData,
								new Rectangle(13, 0, 39 - 13, 0));


			skinManager.setSkin(SkinDef.ICONBUTTON, Bitmap(new icon_normal()).bitmapData, new Rectangle(), 0x22);
			skinManager.setSkin(SkinDef.ICONBUTTON_OVER, Bitmap(new icon_over()).bitmapData, new Rectangle(), 0x22);
			skinManager.setSkin(SkinDef.ICONBUTTON_DOWN, Bitmap(new icon_down()).bitmapData, new Rectangle(), 0x22);
			skinManager.setSkin(SkinDef.ICONBUTTON_DISABLE, Bitmap(new icon_disable()).bitmapData, new Rectangle(), 0x22);


			skinManager.setSkin(SkinDef.CHECKBOX, Bitmap(new checkbox()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.CHECKBOX_DISABLE, Bitmap(new checkbox_disable()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.CHECKBOX_SELECTED, Bitmap(new checkbox_selected()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.CHECKBOX_SELECTED_DISABLE, Bitmap(new checkbox_selected_disable()).bitmapData, new Rectangle());


			skinManager.setSkin(SkinDef.RADIOBUTTON, Bitmap(new radio()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.RADIOBUTTON_DISABLE, Bitmap(new radio_disable()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.RADIOBUTTON_SELECTED, Bitmap(new radio_selected()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.RADIOBUTTON_SELECTED_DISABLE, Bitmap(new radio_selected_disable()).bitmapData, new Rectangle());


			skinManager.setSkin(SkinDef.PROGRESSBAR_FILLING, Bitmap(new progressbar_filling()).bitmapData, new Rectangle());
			skinManager.setSkin(SkinDef.PROGRESSBAR_BG, Bitmap(new progressbar()).bitmapData, new Rectangle(10, 1, 4));


			skinManager.setSkin(SkinDef.SLIDER_BLOCK, Bitmap(new slider_normal()).bitmapData, new Rectangle(8, 7));
			skinManager.setSkin(SkinDef.SLIDER_BLOCK_OVER, Bitmap(new slider_over()).bitmapData, new Rectangle(8, 7));
			skinManager.setSkin(SkinDef.SLIDER_BLOCK_DOWN, Bitmap(new slider_down()).bitmapData, new Rectangle(8, 7));
			skinManager.setSkin(SkinDef.SLIDER_BLOCK_DISABLE, Bitmap(new slider_disable()).bitmapData, new Rectangle(8, 7));
			skinManager.setSkin(SkinDef.SLIDER_HORIZONTAL_BG, Bitmap(new slider_hbg()).bitmapData, new Rectangle(1, 6, 1));
			skinManager.setSkin(SkinDef.SLIDER_VERTICAL_BG, Bitmap(new slider_vbg()).bitmapData, new Rectangle(6, 1, 0, 1));


			skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK, Bitmap(new hblock()).bitmapData, new Rectangle(6, 7, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_OVER, Bitmap(new hblock_over()).bitmapData, new Rectangle(6, 7, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DOWN, Bitmap(new hblock_down()).bitmapData, new Rectangle(6, 7, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BLOCK_DISABLE, Bitmap(new hblock_disable()).bitmapData,
								new Rectangle(6, 7, 14));

			skinManager.setSkin(SkinDef.SCROLLBAR_LEFT, Bitmap(new left_normal()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_OVER, Bitmap(new left_over()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_DOWN, Bitmap(new left_down()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_LEFT_DISABLE, Bitmap(new left_disable()).bitmapData, new Rectangle(0, 7));

			skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT, Bitmap(new right_normal()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_OVER, Bitmap(new right_over()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_DOWN, Bitmap(new right_down()).bitmapData, new Rectangle(0, 7));
			skinManager.setSkin(SkinDef.SCROLLBAR_RIGHT_DISABLE, Bitmap(new right_disable()).bitmapData, new Rectangle(0, 7));

			skinManager.setSkin(SkinDef.SCROLLBAR_HORIZONTAL_BG, Bitmap(new hbg()).bitmapData, new Rectangle(0, 7, 111));


			skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK, Bitmap(new vblock()).bitmapData, new Rectangle(8, 6, 0, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_OVER, Bitmap(new vblock_over()).bitmapData, new Rectangle(8, 6, 0, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DOWN, Bitmap(new vblock_down()).bitmapData, new Rectangle(8, 6, 0, 14));
			skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BLOCK_DISABLE, Bitmap(new vblock_disable()).bitmapData,
								new Rectangle(8, 6, 0, 14));

			skinManager.setSkin(SkinDef.SCROLLBAR_UP, Bitmap(new up_normal()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_UP_OVER, Bitmap(new up_over()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_UP_DOWN, Bitmap(new up_down()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_UP_DISABLE, Bitmap(new up_disable()).bitmapData, new Rectangle(7, 0));

			skinManager.setSkin(SkinDef.SCROLLBAR_DOWN, Bitmap(new down_normal()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_OVER, Bitmap(new down_over()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_DOWN, Bitmap(new down_down()).bitmapData, new Rectangle(7, 0));
			skinManager.setSkin(SkinDef.SCROLLBAR_DOWN_DISABLE, Bitmap(new down_disable()).bitmapData, new Rectangle(7, 0));

			skinManager.setSkin(SkinDef.SCROLLBAR_VERTICAL_BG, Bitmap(new vbg()).bitmapData, new Rectangle(8, 0, 0, 111));


			skinManager.setSkin(SkinDef.LIST_BG, Bitmap(new list()).bitmapData, new Rectangle(3, 3, 28, 28));
			skinManager.setSkin(SkinDef.LIST_ITEM_BG, Bitmap(new list_item()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			skinManager.setSkin(SkinDef.LIST_ITEM_OVER_BG, Bitmap(new list_item_over()).bitmapData, new Rectangle(35, 0, 133 - 35, 0));
			skinManager.setSkin(SkinDef.LIST_ITEM_SELECTED_BG, Bitmap(new list_item_selected()).bitmapData,
								new Rectangle(35, 0, 133 - 35, 0));


			skinManager.setSkin(SkinDef.COMBO_INPUT_BG, Bitmap(new combo_input()).bitmapData, new Rectangle(14, 0, 7, 0), 0x21);
			skinManager.setSkin(SkinDef.COMBO_INPUT_BG_DISABLE, Bitmap(new combo_input_disable()).bitmapData, new Rectangle(14, 0, 7, 0),
								0x21);
			skinManager.setSkin(SkinDef.COMBO_BUTTON, Bitmap(new combo_button()).bitmapData);
			skinManager.setSkin(SkinDef.COMBO_BUTTON_OVER, Bitmap(new combo_button_over()).bitmapData);
			skinManager.setSkin(SkinDef.COMBO_BUTTON_DOWN, Bitmap(new combo_button_down()).bitmapData);
			skinManager.setSkin(SkinDef.COMBO_BUTTON_DISABLE, Bitmap(new combo_button_disable()).bitmapData);


			skinManager.setSkin(SkinDef.PANEL_BG, Bitmap(new panel()).bitmapData, new Rectangle(8, 30, 560, 461));
			skinManager.setSkin(SkinDef.SCROLLPANEL_BG, Bitmap(new scrollpanel()).bitmapData, new Rectangle(6, 6, 22, 22));


			skinManager.setSkin(SkinDef.WINDOW_BG, Bitmap(new window()).bitmapData, new Rectangle(5, 30, 981, 543));

			skinManager.setSkin(SkinDef.WINDOW_MINIMIZE_BUTTON, Bitmap(new min()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MINIMIZE_BUTTON_OVER, Bitmap(new min_over()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MINIMIZE_BUTTON_DOWN, Bitmap(new min_down()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MINIMIZE_BUTTON_DISABLE, Bitmap(new min_disable()).bitmapData);

			skinManager.setSkin(SkinDef.WINDOW_MAXIMIZE_BUTTON, Bitmap(new max()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MAXIMIZE_BUTTON_OVER, Bitmap(new max_over()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MAXIMIZE_BUTTON_DOWN, Bitmap(new max_down()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_MAXIMIZE_BUTTON_DISABLE, Bitmap(new max_disable()).bitmapData);

			skinManager.setSkin(SkinDef.WINDOW_CLOSE_BUTTON, Bitmap(new close()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_CLOSE_BUTTON_OVER, Bitmap(new close_over()).bitmapData);
			skinManager.setSkin(SkinDef.WINDOW_CLOSE_BUTTON_DOWN, Bitmap(new close_down()).bitmapData);


			skinManager.setSkin(SkinDef.TABPANEL_BG, Bitmap(new tabpanel()).bitmapData, new Rectangle(4, 4, 55, 67));
			skinManager.setSkin(SkinDef.TABPANEL_TAB, Bitmap(new tab()).bitmapData, new Rectangle(3, 0, 18));
			skinManager.setSkin(SkinDef.TABPANEL_TAB_SELECTED, Bitmap(new tabSelected()).bitmapData, new Rectangle(3, 0, 18));
		}


		private function initStyles(skinManager:SkinManager):void
		{
			var s:TextStyle;

			//标签文本样式
			s = new TextStyle();
			skinManager.setStyle(StyleDef.LABEL, s);

			//输入文本框样式
			s = new TextStyle();
			s.color = 0xFFFFFF;
			s.maxChars = 50;
			skinManager.setStyle(StyleDef.TEXTINPUT, s);

			//输入文本框禁用样式
			s = new TextStyle();
			s.color = 0x999999;
			skinManager.setStyle(StyleDef.TEXTINPUT_DISABLE, s);

			//文本块样式
			s = new TextStyle();
			s.color = 0xFFFFFF;
			s.multiline = true;
			s.wordWrap = true;
			skinManager.setStyle(StyleDef.TEXTAREA, s);

			//标题条文本样式
			s = new TextStyle();
			s.bold = true;
			s.color = 0xFFFFFF;
			skinManager.setStyle(StyleDef.TITLEBAR, s);

			//列表项文本样式
			s = new TextStyle();
			s.bold = true;
			s.color = 0xFFFFFF;
			skinManager.setStyle(StyleDef.LIST_ITEM, s);

			//列表项选中文本样式
			s = new TextStyle();
			s.bold = true;
			s.color = 0xFF0000;
			skinManager.setStyle(StyleDef.LIST_ITEM_SELECTED, s);

			//组合框输入文本样式
			s = new TextStyle();
			s.color = 0xFFFFFF;
			s.maxChars = 20;
			skinManager.setStyle(StyleDef.COMBO_INPUT, s);

			//组合框输入文本禁用样式
			s = new TextStyle();
			s.color = 0x999999;
			s.maxChars = 20;
			skinManager.setStyle(StyleDef.COMBO_INPUT_DISABLE, s);

			//组合框列表项文本样式
			s = new TextStyle();
			s.bold = true;
			s.color = 0xFFFF00;
			skinManager.setStyle(StyleDef.COMBO_LIST_ITEM, s);

			//组合框列表项选中文本样式
			s = new TextStyle();
			s.bold = true;
			s.color = 0x0000FF;
			skinManager.setStyle(StyleDef.COMBO_LIST_ITEM_SELECTED, s);


			//窗口标题栏文本样式
			s = new TextStyle();
			s.size = 14;
			s.bold = false;
			s.color = 0xFFFFFF;
			skinManager.setStyle(StyleDef.WINDOW_TITLE, s);

			//标签面板标题栏文本样式
			s = new TextStyle();
			s.size = 14;
			s.bold = false;
			skinManager.setStyle(StyleDef.TAPPANEL_TITLE, s);


			//链接按钮普通样式
			s = new TextStyle();
			s.color = 0x0000FF;
			s.underline = true;
			skinManager.setStyle(StyleDef.LINKBUTTON, s);

			//链接按钮悬停样式
			s = new TextStyle();
			s.color = 0x0000FF;
			skinManager.setStyle(StyleDef.LINKBUTTON_OVER, s);

			//链接按钮按下样式
			s = new TextStyle();
			s.color = 0x551A8B;
			skinManager.setStyle(StyleDef.LINKBUTTON_DOWN, s);

			//链接按钮禁用样式
			s = new TextStyle();
			s.color = 0x999999;
			s.underline = true;
			skinManager.setStyle(StyleDef.LINKBUTTON_DISABLE, s);


			//按钮普通样式
			s = new TextStyle();
			s.color = 0xFFFFFF;
			skinManager.setStyle(StyleDef.BUTTON, s);

			//按钮悬停样式
			s = new TextStyle();
			s.color = 0xFFFF00;
			skinManager.setStyle(StyleDef.BUTTON_OVER, s);

			//按钮按下样式
			s = new TextStyle();
			s.color = 0xFFFF00;
			skinManager.setStyle(StyleDef.BUTTON_DOWN, s);

			//按钮禁用样式
			s = new TextStyle();
			s.color = 0x666666;
			skinManager.setStyle(StyleDef.BUTTON_DISABLE, s);


			//图标按钮文本样式
			s = new TextStyle();
			s.color = 0xFFFFFF;
			s.size = 10;
			s.align = TextFormatAlign.RIGHT;
			skinManager.setStyle(StyleDef.ICONBUTTON, s);

			//图标按钮禁用文本样式
			s = new TextStyle();
			s.color = 0x999999;
			s.size = 8;
			s.align = TextFormatAlign.RIGHT;
			skinManager.setStyle(StyleDef.ICONBUTTON_DISABLE, s);


			//切换按钮选中状态普通样式
			s = new TextStyle();
			s.color = 0xFF0000;
			skinManager.setStyle(StyleDef.TOGGLEBUTTON_SELECTED, s);

			//切换按钮选中状态悬停样式
			s = new TextStyle();
			s.color = 0xFF00FF;
			skinManager.setStyle(StyleDef.TOGGLEBUTTON_SELECTED_OVER, s);

			//切换按钮选中状态按下样式
			s = new TextStyle();
			s.color = 0xFF00FF;
			skinManager.setStyle(StyleDef.TOGGLEBUTTON_SELECTED_DOWN, s);

			//切换按钮选中状态禁用样式
			s = new TextStyle();
			s.color = 0x666666;
			skinManager.setStyle(StyleDef.TOGGLEBUTTON_SELECTED_DISABLE, s);
		}
	}
}
