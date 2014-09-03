//
//  SNPAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

/// The SNPAttributeType protocol provides a common interface for types that
/// represent a layout attribute of a view.
public protocol SNPAttributeType {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantType
    
    /// A view associated with an attribute.
    var view: SNPOSView { get }
    
    /// A foundation layout attribute. This property can be nil only when using
    /// with custom attributes, otherwise a fatal error may occur.
    var attribute: SNPOSLayoutAttribute { get }
    
}

/// The SNPConstraintProducing protocol provides a common interface for types
/// that are capable of producing constraints from standard expressions.
public protocol SNPConstraintProducing {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantType
    
    /// Produces the layout constraints using the given expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints <A where A.ConstantType == ConstantType> (#relation: SNPOSLayoutRelation, expression: SNPExpression<A, ConstantType>) -> [SNPConstraint]
    
}

/// The SNPConstraintProducing protocol provides a common interface for types
/// that are capable of producing constraints from anonymous expressions.
public protocol SNPAnonymousConstraintProducing {
    
    /// The supported type of a constant factor in the expression.
    typealias ConstantType
    
    /// Produces the layout constraints using the given anonymous expression.
    ///
    /// :param: relation The relation between two sides of an equation.
    /// :param: expression The expression to be used to construct a constraint.
    ///
    /// :returns: An array of installable layout constraints.
    func produceConstraints(#relation: SNPOSLayoutRelation, expression: SNPAnonymousExpression<ConstantType>) -> [SNPConstraint]
    
}
