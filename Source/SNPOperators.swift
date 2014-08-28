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

public func == <L: SNPAttributeType> (lhs: L, rhs: SNPExpression<L>) -> [SNPConstraint] {
    let consts = lhs.produceConstraints(relation: .Equal, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func == <L: SNPAttributeType> (lhs: L, rhs: L) -> [SNPConstraint] {
    let expr = SNPExpression<L>()
    expr.attribute = rhs
    return lhs == expr
}

// /////////////////////////////////////////////////////////////////////////////

public func >= <L: SNPAttributeType> (lhs: L, rhs: SNPExpression<L>) -> [SNPConstraint] {
    let consts = lhs.produceConstraints(relation: .GreaterThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func >= <L: SNPAttributeType> (lhs: L, rhs: L) -> [SNPConstraint] {
    let expr = SNPExpression<L>()
    expr.attribute = rhs
    return lhs >= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func <= <L: SNPAttributeType> (lhs: L, rhs: SNPExpression<L>) -> [SNPConstraint] {
    let consts = lhs.produceConstraints(relation: .LessThanOrEqual, expression: rhs)
    for const in consts { const.install() }
    return consts
}

public func <= <L: SNPAttributeType> (lhs: L, rhs: L) -> [SNPConstraint] {
    let expr = SNPExpression<L>()
    expr.attribute = rhs
    return lhs <= expr
}

// /////////////////////////////////////////////////////////////////////////////

public func * <L: SNPAttributeType> (lhs: L, rhs: Double) -> SNPExpression<L> {
    let expr = SNPExpression<L>()
    expr.attribute = lhs
    expr.multiplier = rhs
    return expr
}

public func / <L: SNPAttributeType> (lhs: L, rhs: Double) -> SNPExpression<L> {
    return lhs * Double(1/rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func + <L: SNPAttributeType, R where R == L.ConstantType> (lhs: SNPExpression<L>, rhs: R) -> SNPExpression<L> {
    lhs.constantIsPositive = true
    lhs.constantValue = rhs
    return lhs
}

public func + <L: SNPAttributeType, R where R == L.ConstantType> (lhs: L, rhs: R) -> SNPExpression<L> {
    let expr = SNPExpression<L>()
    expr.attribute = lhs
    return expr + rhs
}

public func - <L: SNPAttributeType, R where R == L.ConstantType> (lhs: SNPExpression<L>, rhs: R) -> SNPExpression<L> {
    lhs.constantIsPositive = false
    lhs.constantValue = rhs
    return lhs
}

public func - <L: SNPAttributeType, R where R == L.ConstantType> (lhs: L, rhs: R) -> SNPExpression<L> {
    let expr = SNPExpression<L>()
    expr.attribute = lhs
    return expr - rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~ <L: SNPAttributeType> (lhs: SNPExpression<L>, rhs: UILayoutPriority) -> SNPExpression<L> {
    lhs.priority = rhs
    return lhs
}

public func ~ <L: SNPAttributeType> (lhs: L, rhs: UILayoutPriority) -> SNPExpression<L> {
    let expr = SNPExpression<L>()
    expr.attribute = lhs
    return expr ~ rhs
}
