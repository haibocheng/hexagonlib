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
package com.hexagonstar.util.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.display.PixelSnapping;
	
	
	/**
	 * Bakes a display object into a bitmap.
	 * 
	 * @param obj The DisplayObject or BitmapData to bake.
	 * @param transparent
	 * @param fillColor
	 * @param smoothing
	 * @param pixelSnapping
	 * @return A Bitmap with the baked 
	 */
	public function bakeToBitmap(obj:IBitmapDrawable, transparent:Boolean = true,
		fillColor:uint = 0x00000000, smoothing:Boolean = false,
		pixelSnapping:String = PixelSnapping.AUTO):Bitmap
	{
		var bd:BitmapData;
		if (obj is BitmapData)
		{
			bd = new BitmapData(BitmapData(obj).width, BitmapData(obj).height, transparent, fillColor);
		}
		else
		{
			bd = new BitmapData(DisplayObject(obj).width, DisplayObject(obj).height, transparent, fillColor);
		}
		
		bd.draw(obj, null, null, null, null, smoothing);
		return new Bitmap(bd, pixelSnapping, smoothing);
	}
}
