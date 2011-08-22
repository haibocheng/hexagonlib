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
	import com.hexagonstar.util.number.random;
	import com.hexagonstar.util.number.randomFloat;

	import flash.display.BitmapData;
	import flash.display.IBitmapDrawable;
	import flash.geom.Matrix;
	
	
	public class StampBitmap extends BitmapData
	{
		//-----------------------------------------------------------------------------------------
		// Constructor
		//-----------------------------------------------------------------------------------------
		
		/**
		 * Creates a new instance of the class.
		 * 
		 * @param width
		 * @param height
		 * @param stamps
		 * @param stampCount
		 * @param minScale
		 * @param maxScale
		 * @param transparent
		 * @param fillColor
		 */
		public function StampBitmap(width:int, height:int, stamps:Array, stampCount:int,
			minScale:Number = 0.5, maxScale:Number = 1.5, transparent:Boolean = true,
			fillColor:uint = 0x00000000)
		{
			super(width, height, transparent, fillColor);
			if (!stamps || stampCount < 1) return;
			createStamps(stamps, stampCount, minScale, maxScale);
		}
		
		
		//-----------------------------------------------------------------------------------------
		// Private Methods
		//-----------------------------------------------------------------------------------------
		
		protected function createStamps(stamps:Array, stampCount:int, minScale:Number, maxScale:Number):void
		{
			var m:Matrix = new Matrix();
			var l:uint = stamps.length - 1;
			var stamp:*;
			var sw:int;
			var sh:int;
			var scale:Number;
			
			for (var i:uint = 0; i < stampCount; i++)
			{
				/* Get random stamp image. */
				stamp = stamps[random(0, l)];
				if (!(stamp is IBitmapDrawable)) continue;
				
				sw = stamp["width"];
				sh = stamp["height"];
				scale = randomFloat(minScale, maxScale);
				
				m.identity();
				m.scale(scale, scale);
				m.translate(random(0, width - (sw * scale)), random(0, height - (sh * scale)));
				draw(stamp, m);
			}
		}
	}
}
