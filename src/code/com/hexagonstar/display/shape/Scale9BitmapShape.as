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
package com.hexagonstar.display.shape
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	
	/**
	 * A scale-9 Shape that uses a bitmap fill.
	 */
	public class Scale9BitmapShape extends Shape
	{
		//-----------------------------------------------------------------------------------------
		// Constructor
		//-----------------------------------------------------------------------------------------
		
		/**
		 * Creates a new instance of the class.
		 * 
		 * @param bitmapData BitmapData source.
		 * @param width Draw width.
		 * @param height Draw height.
		 * @param inner Inner rectangle (relative to 0,0).
		 * @param outer Outer rectangle (relative to 0,0).
		 * @param smoothing If <code>false</code>, upscaled bitmap images are rendered by
		 *            using a nearest-neighbor algorithm and look pixelated. If
		 *            <code>true</code>, upscaled bitmap images are rendered by using a
		 *            bilinear algorithm. Rendering by using the nearest neighbor algorithm is
		 *            usually faster.
		 */
		public function Scale9BitmapShape(bitmapData:BitmapData = null, width:Number = 0,
			height:Number = 0, inner:Rectangle = null, outer:Rectangle = null,
			smoothing:Boolean = false)
		{
			if (bitmapData && width > 0 && height > 0)
			{
				draw(bitmapData, width, height, inner, outer, smoothing);
			}
		}
		
		
		//-----------------------------------------------------------------------------------------
		// Public Methods
		//-----------------------------------------------------------------------------------------
		
		/**
		 * @param bitmapData BitmapData source.
		 * @param width Draw width.
		 * @param height Draw height.
		 * @param inner Inner rectangle (relative to 0,0).
		 * @param outer Outer rectangle (relative to 0,0).
		 * @param smoothing If <code>false</code>, upscaled bitmap images are rendered by
		 *            using a nearest-neighbor algorithm and look pixelated. If
		 *            <code>true</code>, upscaled bitmap images are rendered by using a
		 *            bilinear algorithm. Rendering by using the nearest neighbor algorithm is
		 *            usually faster.
		 */
		public function draw(bitmapData:BitmapData, width:Number, height:Number,
			inner:Rectangle, outer:Rectangle, smoothing:Boolean = false):void
		{
			if (!inner) inner = new Rectangle(10, 10, bitmapData.width - 10, bitmapData.height - 10);
			
			var x:int, y:int;
			var ox:Number = 0, oy:Number;
			var dx:Number = 0, dy:Number;
			var w:Number, h:Number, dw:Number, dh:Number;
			var sw:int = bitmapData.width;
			var sh:int = bitmapData.height;
			
			var widths:Array = [inner.left + 1, inner.width - 2, sw - inner.right + 1];
			var heights:Array = [inner.top + 1, inner.height - 2, sh - inner.bottom + 1];
			var rx:Number = width - widths[0] - widths[2];
			var ry:Number = height - heights[0] - heights[2];
			var ol:Number = (outer != null) ? -outer.left : 0;
			var ot:Number = (outer != null) ? -outer.top : 0;

			var m:Matrix = new Matrix();
			
			for (x; x < 3 ; x++)
			{
				w = widths[x];
				dw = x == 1 ? rx : w;
				dy = oy = 0;
				m.a = dw / w;

				for (y = 0; y < 3; y++)
				{
					h = heights[y];
					dh = y == 1 ? ry : h;

					if (dw > 0 && dh > 0)
					{
						m.d = dh / h;
						m.tx = -ox * m.a + dx;
						m.ty = -oy * m.d + dy;
						m.translate(ol, ot);
						graphics.beginBitmapFill(bitmapData, m, false, smoothing);
						graphics.drawRect(dx + ol, dy + ot, dw, dh);
					}

					oy += h;
					dy += dh;
				}

				ox += w;
				dx += dw;
			}

			graphics.endFill();
		}
	}
}
