//
//  SNPEdgeAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// The SNPEdgeAttribute structure is used to describe "edge" layout attributes,
/// such as top, bottom, left and right.
public struct SNPEdgeAttribute: SNPAttributeType, SNPConstraintProducing, SNPAnonymousConstraintProducing {
    
    /// Creates and initializes an edge attribute.
    ///
    /// :param: view The associated view.
    /// :param: attribute The represented layout attribute.
    init(view: UIView, attribute: NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// An array of supported attributes.
    private static var supportedAttributes: [NSLayoutAttribute] {
        return [.Top, .Bottom, .Left, .Right, .Leading, .Trailing]
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// See SNPAttributeType.
    public typealias ConstantType = Double
    
    /// See SNPAttributeType.
    public let view: UIView
    
    /// See SNPAttributeType.
    public let attribute: NSLayoutAttribute

    // /////////////////////////////////////////////////////////////////////////

    /// See SNPConstraintProducing.
    public func produceConstraints <A where A.ConstantType == ConstantType> (#relation: NSLayoutRelation, expression: SNPExpression<A>) -> [SNPConstraint] {
        assert(contains(self.dynamicType.supportedAttributes, self.attribute), "Cannot produce constraints: unsupported destination layout attribute.")
        assert(contains(self.dynamicType.supportedAttributes, expression.attribute.attribute), "Cannot produce constraints: unsupported source layout attribute.")
        return [SNPConstraint(
            destination: (self.view, self.attribute),
            source: (expression.attribute.view, expression.attribute.attribute),
            relation: relation,
            constant: (expression.constantValue ?? 0) * ((expression.constantPositive ?? true) ? 1 : -1),
            multiplier: expression.multiplicationValue,
            priority: expression.priority
        )]
    }
    
    /// See SNPAnonymousConstraintProducing.
    public func produceConstraints(#relation: NSLayoutRelation, expression: SNPAnonymousExpression<ConstantType>) -> [SNPConstraint] {
        assert(contains(self.dynamicType.supportedAttributes, self.attribute), "Cannot produce constraints: unsupported destination layout attribute.")
        assert(self.view.superview != nil, "Cannot produce constraints: destination view has no superview.")
        return [SNPConstraint(
            destination: (self.view, self.attribute),
            source: (self.view.superview!, self.attribute),
            relation: relation,
            constant: expression.constantValue,
            multiplier: 1,
            priority: expression.priority
        )]
    }
    
}
