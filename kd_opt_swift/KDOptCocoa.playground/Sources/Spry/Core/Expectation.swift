//
//  EqualTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

public struct Expectation<T> {
    
    private let expression: Expression<T>
    fileprivate var matches: Bool = true
    
    init(expression: Expression<T>) {
        self.expression = expression
    }
    
    @discardableResult
    public func to(_ matcher: Matcher<T>) -> Bool {
        return evaluate(matcher: matcher)
    }
    
    @discardableResult
    public func toNot(_ matcher: Matcher<T>) -> Bool {
        return !evaluate(matcher: matcher)
    }
    
    private func evaluate(matcher: Matcher<T>) -> Bool {
        do {
            let result = try matcher.evaluate(expression)
            return result
        } catch { return false }
    }
    
}
