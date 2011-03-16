/* * hexagonlib - Multi-Purpose ActionScript 3 Library. *       __    __ *    __/  \__/  \__    __ *   /  \__/HEXAGON \__/  \ *   \__/  \__/  LIBRARY _/ *            \__/  \__/ * * Licensed under the MIT License *  * Permission is hereby granted, free of charge, to any person obtaining a copy of * this software and associated documentation files (the "Software"), to deal in * the Software without restriction, including without limitation the rights to * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of * the Software, and to permit persons to whom the Software is furnished to do so, * subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in all * copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */package com.hexagonstar.data.structures{	import com.hexagonstar.exception.UnsupportedOperationException;		/**	 * The ProtectedIterator is used to iterate over any data structure without being	 * able to remove its elements. This class acts as a wrapper for any class that	 * implements the Iterator interface and wants to be protected.	 */	public class ProtectedIterator implements IIterator	{		//-----------------------------------------------------------------------------------------		// Properties		//-----------------------------------------------------------------------------------------				/**		 * Holds the iterator this protected iterator delegates to.		 * @private		 */		private var _iterator:IIterator;						//-----------------------------------------------------------------------------------------		// Constructor		//-----------------------------------------------------------------------------------------				/**		 * Constructs a new ProtectedIterator instance.<p>This iterator forwards all		 * functionality to the wrapped specified iterator, except the removal of the		 * current element.</p>		 * 		 * @param iterator The iterator to protect.		 */		public function ProtectedIterator(iterator:IIterator)		{			_iterator = iterator;		}						/**		 * This method always throws an UnsupportedOperationException because this method is		 * not supported by this iterator and has the duty to not let the removal of		 * elements happen.		 * 		 * @return null.		 * @throws com.hexagonstar.exception.UnsupportedOperationException		 */		public function remove():*		{			throw new UnsupportedOperationException("[ProtectedIterator] The protected Iterator "				+ _iterator + " does not allow the removal of elements.");			return null;		}						/**		 * Resets the iterator to its default index. After this operation returns the		 * iterated elements start from the beginning again as if the iterator has been		 * started for the first time.		 */		 public function reset():void		 {		 	_iterator.reset();		 }		 		 		 //-----------------------------------------------------------------------------------------		 // Getters & Setters		 //-----------------------------------------------------------------------------------------				/**		 * Returns whether there are more elements to iterate over. For any special		 * functionality that may be performed, refer to the wrapped iterator that has been		 * specified on construction. This method simply delegates to the wrapped iterator.		 * 		 * @return true if there is a next element to iterate over, otherwise false.		 */		public function get hasNext():Boolean		{			return _iterator.hasNext;		}						/**		 * Returns the next element. For any special functionality that may be performed		 * refer to the wrapped iterator that has been specified on construction. This		 * method simply delegates to the wrapped iterator.		 * 		 * @return the next iterated element.		 */		public function get next():*		{			return _iterator.next;		}	}}