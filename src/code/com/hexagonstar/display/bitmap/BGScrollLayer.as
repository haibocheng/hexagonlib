/*
 * hexagonlib - Multi-Purpose ActionScript 3 Library.
 *       __    __
 *    __/  \__/  \__    __
 *   /  \__/HEXAGON \__/  \
 *   \__/  \__/  LIBRARY _/
 *            \__/  \__/
 *
 * Licensed under the MIT License
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package com.hexagonstar.display.bitmap
{
	import com.hexagonstar.util.geom.degToRad;
	import com.hexagonstar.util.geom.radToDeg;

	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.Matrix;
	
	
	public class BGScrollLayer
	{
		//-----------------------------------------------------------------------------------------
		// Properties
		//-----------------------------------------------------------------------------------------
		
		public var bitmapData:BitmapData;
		public var matrix:Matrix;
		
		protected var _scrollSpeedH:Number;
		protected var _scrollSpeedV:Number;
		protected var _rotation:Number;
		protected var _intervalRotation:Number;
		protected var _intervalScale:Number;
		protected var _intervalScaleValue:Number;
		protected var _scale:Number;
		
		
		//-----------------------------------------------------------------------------------------
		// Constructor
		//-----------------------------------------------------------------------------------------
		
		/**
		 * Creates a new instance of the class.
		 * 
		 * @param image
		 * @param scrollSpeedH
		 * @param scrollSpeedV
		 * @param rotation
		 * @param intervalRotation
		 * @param scale
		 * @param intervalScale
		 * @param transparent
		 * @param fillColor
		 */
		public function BGScrollLayer(image:IBitmapDrawable, scrollSpeedH:Number = 1.0,
			scrollSpeedV:Number = 1.0, scale:Number = 1.0, intervalScale:Number = 0.0,
			rotation:Number = 0.0, intervalRotation:Number = 0.0, transparent:Boolean = true,
			fillColor:uint = 0x00000000)
		{
			matrix = new Matrix();
			
			this.scrollSpeedH = scrollSpeedH;
			this.scrollSpeedV = scrollSpeedV;
			this.scale = scale;
			this.intervalScale = intervalScale;
			this.rotation = rotation;
			this.intervalRotation = intervalRotation;
			
			var w:int;
			var h:int;
			if (image is BitmapData)
			{
				w = BitmapData(image).width;
				h = BitmapData(image).height;
			}
			else
			{
				w = DisplayObject(image).width;
				h = DisplayObject(image).height;
			}
			
			bitmapData = new BitmapData(w, h, transparent, fillColor);
			bitmapData.draw(image);
		}
		
		
		//-----------------------------------------------------------------------------------------
		// Public Methods
		//-----------------------------------------------------------------------------------------
		
		public function tick():void
		{
			if (_intervalScale != 0)
			{
				matrix.a = matrix.d = _intervalScaleValue;
				_intervalScaleValue += _intervalScale;
			}
			
			matrix.translate(_scrollSpeedH, _scrollSpeedV);
			if (_intervalRotation != 0) matrix.rotate(_intervalRotation);
		}
		
		
		//-----------------------------------------------------------------------------------------
		// Accessors
		//-----------------------------------------------------------------------------------------
		
		public function get scrollSpeedH():Number
		{
			return _scrollSpeedH;
		}
		public function set scrollSpeedH(v:Number):void
		{
			_scrollSpeedH = v;
		}
		
		
		public function get scrollSpeedV():Number
		{
			return _scrollSpeedV;
		}
		public function set scrollSpeedV(v:Number):void
		{
			_scrollSpeedV = v;
		}
		
		
		public function get rotation():Number
		{
			return radToDeg(_rotation);
		}
		public function set rotation(v:Number):void
		{
			_rotation = degToRad(v);
			matrix.rotate(_rotation);
		}
		
		
		public function get intervalRotation():Number
		{
			return radToDeg(_intervalRotation);
		}
		public function set intervalRotation(v:Number):void
		{
			_intervalRotation = degToRad(v);
		}
		
		
		public function get scale():Number
		{
			return _scale;
		}
		public function set scale(v:Number):void
		{
			_scale = matrix.a = matrix.d = v;
		}
		
		
		public function get intervalScale():Number
		{
			return _intervalScale;
		}
		public function set intervalScale(v:Number):void
		{
			_intervalScale = _intervalScaleValue = v;
		}
	}
}
