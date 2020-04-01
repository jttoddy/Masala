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

@inlinable public func combine<T>(_ f: @escaping (T) -> Void, _ g: @escaping (T) -> Void) -> (T) -> Void {
    return { x in
        f(x)
        g(x)
    }
}

@inlinable public func combine2<A, B>(_ f: @escaping (A, B) -> Void, _ g: @escaping (A, B) -> Void) -> (A, B) -> Void {
    return { x, y in
        f(x, y)
        g(x, y)
    }
}

@inlinable public func combine<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return { x in g(f(x)) }
}

precedencegroup CompositionPrecedence {
    associativity: left
    higherThan: ApplicativePrecedence, AssignmentPrecedence, CastingPrecedence
}

infix operator >>>: CompositionPrecedence

@inlinable public func >>> <T>(_ f: @escaping (T) -> Void, _ g: @escaping (T) -> Void) -> (T) -> Void {
    return combine(f, g)
}

@inlinable public func >>> <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return combine(f, g)
}

infix operator <<<: CompositionPrecedence

@inlinable public func <<< <T>(_ f: @escaping (T) -> Void, _ g: @escaping (T) -> Void) -> (T) -> Void {
    return combine(f, g)
}

@inlinable public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
    return combine(g, f)
}

infix operator <>: CompositionPrecedence

@inlinable public func combine(_ f: @escaping () -> Void, _ g: @escaping () -> Void) -> () -> Void {
    return {
        f()
        g()
    }
}

@inlinable public func <> (_ f: @escaping () -> Void, _ g: @escaping () -> Void) -> () -> Void {
    return combine(f, g)
}
