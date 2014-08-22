//
//  SNPOperators.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//
//  The basic operator syntax for Snappy looks like this:
//  attr ==|>=|<= attr|literal [*|/ multiplier] [+|- constant] [~ priority]
//

import UIKit

/// An operator that assigns the priority to an expression.
infix operator ~ { associativity left precedence 135 }

// /////////////////////////////////////////////////////////////////////////////

public func ==<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .Equal, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func ==<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs == expr
}

public func ==<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs == expr
}

// /////////////////////////////////////////////////////////////////////////////

public func >=<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .GreaterThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func >=<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs >= expr
}

public func >=<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs >= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func <=<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .LessThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func <=<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs <= expr
}

public func <=<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs <= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func *<T>(lhs: SNPAttribute<T>, rhs: Double) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    expr.multiplier = rhs
    return expr
}

public func /<T>(lhs: SNPAttribute<T>, rhs: Double) -> SNPExpression<T> {
    return lhs * Double(1/rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func +<T>(lhs: SNPExpression<T>, rhs: T) -> SNPExpression<T> {
    lhs.constantIsPositive = true
    lhs.constantValue = rhs
    return lhs
}

public func +<T>(lhs: SNPAttribute<T>, rhs: T) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr + rhs
}

public func -<T>(lhs: SNPExpression<T>, rhs: T) -> SNPExpression<T> {
    lhs.constantIsPositive = false
    lhs.constantValue = rhs
    return lhs
}

public func -<T>(lhs: SNPAttribute<T>, rhs: T) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr - rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~<T>(lhs: SNPExpression<T>, rhs: UILayoutPriority) -> SNPExpression<T> {
    lhs.priority = rhs
    return lhs
}

public func ~<T>(lhs: SNPAttribute<T>, rhs: UILayoutPriority) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~ rhs
}

public func ~<T>(lhs: T, rhs: UILayoutPriority) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.constantValue = lhs
    return expr ~ rhs
}
