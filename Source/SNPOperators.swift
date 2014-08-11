//
//  SNPOperators.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// An operator which creates a constraint that is equal to the expression.
infix operator ~== { associativity left precedence 100 assignment }

/// An operator which creates a constraint that is greater than or equal to the
/// expression.
infix operator ~>= { associativity left precedence 100 assignment }

/// An operator which creates a constraint that is less than or equal to the
/// expression.
infix operator ~<= { associativity left precedence 100 assignment }

/// An operator that assigns a priority to an expression.
infix operator ~! { associativity left precedence 110 }

/// An operator that assigns a positive constant factor to an expression.
infix operator ~+ { associativity left precedence 120 }

/// An operator that assigns a negative constant factor to an expression.
infix operator ~- { associativity left precedence 120 }

/// An operator that assigns a multiplication factor to an expression.
infix operator ~* { associativity left precedence 120 }

/// An operator that assigns an inverse multiplication factor to an expression.
infix operator ~/ { associativity left precedence 120 }

// /////////////////////////////////////////////////////////////////////////////

public func ~==<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .Equal, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func ~==<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs ~== expr
}

public func ~==<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs ~== expr
}

// /////////////////////////////////////////////////////////////////////////////

public func ~>=<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .GreaterThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func ~>=<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs ~>= expr
}

public func ~>=<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs ~>= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func ~<=<T>(lhs: SNPAttribute<T>, rhs: SNPExpression<T>) -> [SNPConstraint] {
    let consts = lhs.createConstraints(relation: .LessThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func ~<=<T>(lhs: SNPAttribute<T>, rhs: SNPAttribute<T>) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.attribute = rhs
    return lhs ~<= expr
}

public func ~<=<T>(lhs: SNPAttribute<T>, rhs: T) -> [SNPConstraint] {
    let expr = SNPExpression<T>()
    expr.constantValue = rhs
    return lhs ~<= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func ~+<T>(lhs: SNPExpression<T>, rhs: T) -> SNPExpression<T> {
    lhs.constantIsPositive = true
    lhs.constantValue = rhs
    return lhs
}

public func ~+<T>(lhs: SNPAttribute<T>, rhs: T) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~+ rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~-<T>(lhs: SNPExpression<T>, rhs: T) -> SNPExpression<T> {
    lhs.constantIsPositive = false
    lhs.constantValue = rhs
    return lhs
}

public func ~-<T>(lhs: SNPAttribute<T>, rhs: T) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~- rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~*<T>(lhs: SNPExpression<T>, rhs: Double) -> SNPExpression<T> {
    lhs.multiplier = rhs
    return lhs
}

public func ~*<T>(lhs: SNPAttribute<T>, rhs: Double) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~* rhs
}

public func ~*<T>(lhs: T, rhs: Double) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.constantValue = lhs
    return expr ~* rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~/<T>(lhs: SNPExpression<T>, rhs: Double) -> SNPExpression<T> {
    lhs.multiplier = 1/rhs
    return lhs
}

public func ~/<T>(lhs: SNPAttribute<T>, rhs: Double) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~/ rhs
}

public func ~/<T>(lhs: T, rhs: Double) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.constantValue = lhs
    return expr ~/ rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~!<T>(lhs: SNPExpression<T>, rhs: UILayoutPriority) -> SNPExpression<T> {
    lhs.priority = rhs
    return lhs
}

public func ~!<T>(lhs: SNPAttribute<T>, rhs: UILayoutPriority) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.attribute = lhs
    return expr ~! rhs
}

public func ~!<T>(lhs: T, rhs: UILayoutPriority) -> SNPExpression<T> {
    let expr = SNPExpression<T>()
    expr.constantValue = lhs
    return expr ~! rhs
}
