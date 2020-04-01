//
//  Copyright 2019-2020 Jesse Todisco. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

public extension Array {

    /// Copies the existing array, and adds the elements of a sequence to the end of the copy.
    ///
    /// Use this method to append the elements of a sequence to the end of this
    /// array in a functional manner. This example appends the elements of a `Range<Int>` instance
    /// to an array of integers.
    ///
    /// - Parameter newElements: The elements to append to the array.
    ///
    /// - Complexity: O(*m*) on average, where *m* is the length of
    ///   `newElements`, over many calls to `append(contentsOf:)` on the same
    ///   array.
    func appending(_ newElement: Element) -> Self {
        var newArray = self
        newArray.append(newElement)
        return newArray
    }
}
