package spin
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.utils.getTimer;
	public class Spinner extends Sprite
	{
		public var speed:Number;
		public var trail:Number;
		private static var dropShadowFilter:DropShadowFilter = new DropShadowFilter(2, 90, 0x000000, 1, 2, 2, 1, 2, false, false, false);
		private var _lineCount:int;
		private var _length:Number;
		private var _thickness:Number;
		private var _radius:Number;
		private var _roundness:Number;
		private var _color:uint;
		private var _shadow:Boolean;
		private var lines:Array;
		private var prevTime:int;
		private var lightPosition:Number;
		public function Spinner(lineCount:uint = 12, length:Number = 7, thickness:Number = 5, radius:Number = 10, roundness:Number = 1, color:uint = 0x000000, speed:Number = 1, trail:Number = 1, shadow:Boolean = false)
		{
			this._length = length;
			this._thickness = thickness;
			this._radius = radius;
			this._roundness = roundness;
			this._color = color;
			this._shadow = shadow;
			this.lineCount = lineCount;
			this.speed = speed;
			this.trail = trail;
			this.lightPosition = 0;
			animate(null);
		}
		public function set lineCount(value:int):void
		{
			this._lineCount = value;
			removeChildren();
			lines = [];
			for(var i:int=0; i<value; ++i)
			{
				lines.push(addChild(new Line));
				Line(lines[i]).rotation = 360/value*i;
			}
			update();
		}
		public function get lineCount():int
		{
			return this._lineCount;
		}
		public function set length(value:Number):void
		{
			this._length = value;
			update();
		}
		public function get length():Number
		{
			return this._length;
		}
		public function set thickness(value:Number):void
		{
			this._thickness = value;
			update();
		}
		public function get thickness():Number
		{
			return this._thickness;
		}
		public function set radius(value:Number):void
		{
			this._radius = value;
			update();
		}
		public function get radius():Number
		{
			return this._radius;
		}
		public function set roundness(value:Number):void
		{
			this._roundness = value;
			update();
		}
		public function get roundness():Number
		{
			return this._roundness;
		}
		public function set color(value:uint):void
		{
			this._color = value;
			update();
		}
		public function get color():uint
		{
			return this._color;
		}
		public function set shadow(value:Boolean):void
		{
			this._shadow = value;
			update();
		}
		public function get shadow():Boolean
		{
			return this._shadow;
		}
		public function spin():void
		{
			prevTime = getTimer();
			addEventListener(Event.ENTER_FRAME, animate);
		}
		public function pause():void
		{
			removeEventListener(Event.ENTER_FRAME, animate);
		}
		private function animate(e:Event):void
		{
			var currentTime:int = getTimer();
			for(var i:int=1; i<_lineCount; ++i)
				Line(lines[int(i+lightPosition*_lineCount)%_lineCount]).alpha = trail==0?0.3:Math.max(i/_lineCount-1+trail, 0)/trail*0.7+0.3;
			Line(lines[int(lightPosition*_lineCount)%_lineCount]).alpha = 1;
			lightPosition = (lightPosition+(currentTime-prevTime)*speed*0.001)%1;
			prevTime = currentTime;
			update();
		}
		private function update():void
		{
			var line:Line;
			var lineCount:int = this.lines.length;
			for(var i:int=0; i<lineCount; ++i)
			{
				line = lines[i];
				line.length = _length;
				line.thickness = _thickness;
				line.radius = _radius;
				line.roundness = _roundness;
				line.color = _color;
				line.filters = _shadow?[dropShadowFilter]:null;
				line.update();
			}
		}
	}
}
import flash.display.Shape;
internal class Line extends Shape
{
	public var length:Number;
	public var thickness:Number;
	public var radius:Number;
	public var roundness:Number;
	public var color:uint;
	public function Line()
	{
	}
	public function update():void
	{
		var ellipseRadius:Number = roundness*thickness;
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRoundRect(radius, -thickness*0.5, length+thickness, Math.max(ellipseRadius, thickness), ellipseRadius, ellipseRadius);
	}
}