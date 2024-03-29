//
//  SNPOperators.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

/// An operator that assigns the priority to an expression.
infix operator ~ { associativity left precedence 135 }

// /////////////////////////////////////////////////////////////////////////////

private func produceAndInstallConstraints <P: SNPConstraintProducing, A: SNPAttributeType where P.ConstantType == A.ConstantType>
  (producer: P, relation: SNPOSLayoutRelation, expression: SNPExpression<A, A.ConstantType>) -> [SNPConstraint] {
    let consts = producer.produceConstraints(relation: relation, expression: expression)
    for const in consts { const.install() }
    return consts
}

private func produceAndInstallConstraints <P: SNPAnonymousConstraintProducing>
  (producer: P, relation: SNPOSLayoutRelation, expression: SNPAnonymousExpression<P.ConstantType>) -> [SNPConstraint] {
    let consts = producer.produceConstraints(relation: relation, expression: expression)
    for const in consts { const.install() }
    return consts
}

// /////////////////////////////////////////////////////////////////////////////

public func == <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: SNPExpression<R, R.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .Equal, rhs)
}

public func == <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: R) -> [SNPConstraint] {
    return lhs == SNPExpression(attribute: rhs)
}

public func == <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: SNPAnonymousExpression<L.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .Equal, rhs)
}

public func == <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: L.ConstantType) -> [SNPConstraint] {
    return lhs == SNPAnonymousExpression(constantValue: rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func >= <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: SNPExpression<R, R.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .GreaterThanOrEqual, rhs)
}

public func >= <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: R) -> [SNPConstraint] {
    return lhs >= SNPExpression(attribute: rhs)
}

public func >= <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: SNPAnonymousExpression<L.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .GreaterThanOrEqual, rhs)
}

public func >= <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: L.ConstantType) -> [SNPConstraint] {
    return lhs >= SNPAnonymousExpression(constantValue: rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func <= <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: SNPExpression<R, R.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .LessThanOrEqual, rhs)
}

public func <= <L: SNPConstraintProducing, R: SNPAttributeType where L.ConstantType == R.ConstantType> (lhs: L, rhs: R) -> [SNPConstraint] {
    return lhs <= SNPExpression(attribute: rhs)
}

public func <= <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: SNPAnonymousExpression<L.ConstantType>) -> [SNPConstraint] {
    return produceAndInstallConstraints(lhs, .LessThanOrEqual, rhs)
}

public func <= <L: SNPAnonymousConstraintProducing> (lhs: L, rhs: L.ConstantType) -> [SNPConstraint] {
    return lhs <= SNPAnonymousExpression(constantValue: rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func * <L: SNPAttributeType> (lhs: L, rhs: Double) -> SNPExpression<L, L.ConstantType> {
    var expr = SNPExpression(attribute: lhs)
    expr.multiplicationValue = rhs
    return expr
}

public func / <L: SNPAttributeType> (lhs: L, rhs: Double) -> SNPExpression<L, L.ConstantType> {
    return lhs * Double(1/rhs)
}

// /////////////////////////////////////////////////////////////////////////////

public func + <L: SNPAttributeType> (lhs: SNPExpression<L, L.ConstantType>, rhs: L.ConstantType) -> SNPExpression<L, L.ConstantType> {
    var expr = lhs
    expr.constantPositive = true
    expr.constantValue = rhs
    return expr
}

public func + <L: SNPAttributeType> (lhs: L, rhs: L.ConstantType) -> SNPExpression<L, L.ConstantType> {
    return SNPExpression(attribute: lhs) + rhs
}

public func - <L: SNPAttributeType> (lhs: SNPExpression<L, L.ConstantType>, rhs: L.ConstantType) -> SNPExpression<L, L.ConstantType> {
    var expr = lhs
    expr.constantPositive = false
    expr.constantValue = rhs
    return expr
}

public func - <L: SNPAttributeType> (lhs: L, rhs: L.ConstantType) -> SNPExpression<L, L.ConstantType> {
    return SNPExpression(attribute: lhs) - rhs
}

// /////////////////////////////////////////////////////////////////////////////

public func ~ <L: SNPAttributeType> (lhs: SNPExpression<L, L.ConstantType>, rhs: SNPOSLayoutPriority) -> SNPExpression<L, L.ConstantType> {
    var expr = lhs
    expr.priority = rhs
    return expr
}

public func ~ <L: SNPAttributeType> (lhs: L, rhs: SNPOSLayoutPriority) -> SNPExpression<L, L.ConstantType> {
    return SNPExpression(attribute: lhs) ~ rhs
}

public func ~ <L> (lhs: L, rhs: SNPOSLayoutPriority) -> SNPAnonymousExpression<L> {
    var expr = SNPAnonymousExpression(constantValue: lhs)
    expr.priority = rhs
    return expr
}
