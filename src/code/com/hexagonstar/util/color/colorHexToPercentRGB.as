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
package com.hexagonstar.util.color
{
	import com.hexagonstar.types.RGB;
	
	
	/**
	 * Converts a hexadecimal color value of the format 0x000000 to an RGB object which
	 * contains the three color channel values as percentual values ranging from 0.0 to 1.0.
	 * 
	 * @see com.hexagonstar.types.RGB
	 * 
	 * @param color A hexadecimal color value, e.g. 0xFF2266.
	 * @return An RGB object containng three values ranging from 0.0 to 1.0.
	 */
	public function colorHexToPercentRGB(color:uint):RGB
	{
		var rgb:RGB = new RGB();
		rgb.r = Number((color >> 16) / 255);
		rgb.g = Number((color >> 8 & 0xFF) / 255);
		rgb.b = Number((color & 0xFF) / 255);
		return rgb;
	}
}
