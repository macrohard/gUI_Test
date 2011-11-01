package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class CPoint extends Sprite
	{
		public function CPoint()
		{
			graphics.beginFill(0);
			graphics.drawCircle(0, 0, 10);
			graphics.endFill();
			
			this.useHandCursor = true;
			this.buttonMode = true;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onmousedown);
			this.addEventListener(MouseEvent.MOUSE_UP, onmouseup);
		}
		
		private function onmousedown(e:MouseEvent):void
		{
			this.startDrag();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onmousemove);
			e.stopPropagation();
		}
		
		private function onmouseup(e:MouseEvent):void
		{
			this.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onmousemove);
			e.stopPropagation();
		}
		
		private function onmousemove(e:MouseEvent):void
		{
			dispatchEvent(new Event(Event.RESIZE));
		}
	}
}