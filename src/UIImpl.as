package
{
	import com.macro.gUI.assist.DragMode;
	import com.macro.gUI.base.IComposite;
	import com.macro.gUI.base.IContainer;
	import com.macro.gUI.base.IControl;
	import com.macro.gUI.base.feature.IButton;
	import com.macro.gUI.base.feature.IDrag;
	import com.macro.gUI.base.feature.IFocus;
	import com.macro.gUI.base.feature.IKeyboard;
	
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;

	public class UIImpl
	{
		private var stage:Stage;
		
		private var root:IControl;
		
		public var canvas:BitmapData;
		
		public function UIImpl(stage:Stage, root:IControl)
		{
			this.stage = stage;
			this.root = root;
			
			canvas = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		protected function onEnterFrame(e:Event):void
		{
			canvas.lock();
			canvas.fillRect(canvas.rect, 0xff333333);
			
			drawControl(root, canvas.rect);
			
			canvas.unlock();
		}
		
		
		/**
		 * 合并渲染
		 * @param control
		 * @param stageRect
		 *
		 */
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
				
			}
			else if (control is IComposite)
			{
				drawControl((control as IComposite).container, stageRect);
			}
		}
		
		
		
		
		
		//================================================================
		
		/**
		 * 鼠标点击的外层控件，基本控件或复合控件
		 */
		private var _mouseControl:IControl;
		
		/**
		 * 鼠标点击的实际目标控件，如复合控件内的控件
		 */
		private var _mouseTarget:IControl;
		
		/**
		 * 拖拽的外层控件
		 */
		private var _dragControl:IDrag;
		
		/**
		 * 拖拽的目标控件
		 */
		private var _dragTarget:IControl;
		
		/**
		 * 拖拽模式
		 */
		private var _dragMode:int;
		
		/**
		 * 拖拽替身
		 */
		private var _dragAvatar:BitmapData;
		
		/**
		 * 焦点控件
		 */
		private var _focusControl:IControl;
		
		protected function onMouseDown(e:MouseEvent):void
		{
			findTargetControl(root);
			
			if (_mouseControl is IFocus)
			{
				_focusControl = _mouseControl;
			}
			else
			{
				_focusControl = null;
			}
			
			if (_mouseTarget != null && _mouseControl.enabled)
			{
				if (_mouseControl is IButton)
				{
					(_mouseControl as IButton).mouseDown();
				}
				
				if (_mouseControl is IDrag)
				{
					_dragControl = _mouseControl as IDrag;
					_dragTarget = _mouseTarget;
					_dragMode = _dragControl.getDragMode();
					
					if (_dragMode == DragMode.NONE)
					{
						_dragControl = null;
						_dragTarget = null;
					}
					else if (_dragMode == DragMode.AVATAR)
					{
						_dragAvatar = _dragControl.getDragImage();
						if (_dragAvatar == null)
						{
							_dragControl = null;
							_dragTarget = null;
						}
					}
					
					if (_dragControl != null)
					{
						Mouse.cursor = MouseCursor.BUTTON;
					}
				}
			}
		}
		
		protected function onMouseUp(e:MouseEvent):void
		{
			if (_dragControl == null)
			{
				if (_mouseControl != null && _mouseControl.enabled)
				{
					if (_mouseControl is IButton)
					{
						(_mouseControl as IButton).mouseUp();
					}
				}
			}
			else
			{
				findTargetControl(root);
				
				if (_dragControl == _mouseControl)
				{
					if (_dragControl is IButton)
					{
						(_dragControl as IButton).mouseUp();
					}
				}
				else
				{
					Mouse.cursor = MouseCursor.AUTO;
					if (_dragControl is IButton)
					{
						(_dragControl as IButton).mouseOut();
					}
				}
				
				_dragControl = null;
				_dragTarget = null;
				_dragAvatar = null;
			}
		}
		
		protected function onMouseMove(e:MouseEvent):void
		{
			if (_dragControl == null)
			{
				var tempC:IControl = _mouseControl;
				var tempT:IControl = _mouseTarget;
				findTargetControl(root);
				
				if (tempT == _mouseTarget)
				{
					return;
				}
				
				if (tempC is IButton)
				{
					(tempC as IButton).mouseOut();
					Mouse.cursor = MouseCursor.AUTO;
				}
				
				if (_mouseControl != null && _mouseControl.enabled)
				{
					if (_mouseControl is IButton)
					{
						(_mouseControl as IButton).mouseOver();
						
						if (_mouseTarget is IButton)
						{
							Mouse.cursor = MouseCursor.BUTTON;
						}
					}
				}
				
			}
			else
			{
				if (_dragMode == DragMode.DIRECT)
				{
					_dragControl.setDragCoord(stage.mouseX, stage.mouseY);
				}
				else
				{
					// TODO 实现拖拽替身
				}
			}
		}
		
		/**
		 * 遍历查找鼠标所在的控件
		 * @param control
		 * @return
		 *
		 */
		protected function findTargetControl(control:IControl):Boolean
		{
			var target:IControl = control.hitTest(stage.mouseX, stage.mouseY);
			if (target != null)
			{
				if (control is IContainer)
				{
					var container:IContainer = control as IContainer;
					for (var i:int = container.numChildren - 1; i >= 0; i--)
					{
						if (findTargetControl(container.getChildAt(i)))
						{
							return true;
						}
					}
				}
				
				_mouseTarget = target;
				_mouseControl = control;
				return true;
			}
			else
			{
				_mouseTarget = null;
				_mouseControl = null;
				return false;
			}
			
		}
		
		
		
		protected function onKeyDown(e:KeyboardEvent):void
		{
			if (_focusControl is IKeyboard)
			{
				(_focusControl as IKeyboard).keyDown(e);
			}
		}
		
		
		protected function onKeyUp(e:KeyboardEvent):void
		{
			if (_focusControl is IKeyboard)
			{
				(_focusControl as IKeyboard).keyUp(e);
			}
		}
	}
}