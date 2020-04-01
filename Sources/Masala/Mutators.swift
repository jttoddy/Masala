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

@inlinable public func map<A, B>(_ mapping: @escaping (A) -> B) -> ([A]) -> [B] {
    return { $0.map(mapping) }
}

@inlinable public func mapSuccess<A, B, C>(_ f: @escaping (A) -> B) -> (Result<A, C>) -> Result<B, C> {
    return { result in
        switch result {
        case .success(let x):
            return .success(x |> f)
        case .failure(let err):
            return .failure(err)
        }
    }
}

@inlinable public func mapFailure<A, B, C>(_ f: @escaping (B) -> C) -> (Result<A, B>) -> Result<A, C> {
    return { result in
        switch result {
        case .success(let ok):
            return .success(ok)
        case .failure(let err):
            return .failure(err |> f)
        }
    }
}

infix operator >=>: ApplicativePrecedence

@inlinable public func >=> <A, B>(_ input: [A], _ mapping: @escaping (A) -> B) -> [B] {
    return map(mapping)(input)
}

public func supply<T>(_ originalFunction: @escaping (T) -> Void) -> (T) -> (() -> Void) {
    return { arg in
        { originalFunction(arg) }
    }
}

/// Calls a function that would normally return void but instead returns its calling argument
/// Useful for function chaining
/// - Parameter originalFunction: The function to return the initial argument for
public func refund<T>(_ originalFunction: @escaping (T) -> Void) -> (T) -> T {
    return { arg in
        originalFunction(arg)
        return arg
    }
}
