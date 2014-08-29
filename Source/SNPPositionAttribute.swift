//
//  SNPPositionAttribute.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

/// The SNPPositionAttribute structure is used to describe "position" layout
/// attributes, such as x-center and y-center.
public struct SNPPositionAttribute: SNPAttributeType, SNPConstraintProducing, SNPAnonymousConstraintProducing {
    
    /// Creates and initializes an edge attribute.
    ///
    /// :param: view The associated view.
    /// :param: attribute The represented layout attribute.
    init(view: SNPOSView, attribute: SNPOSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// An array of supported attributes.
    private static var supportedAttributes: [SNPOSLayoutAttribute] {
        return [.CenterX, .CenterY]
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// See SNPAttributeType.
    public typealias ConstantType = Double
    
    /// See SNPAttributeType.
    public let view: UIView
    
    /// See SNPAttributeType.
    public let attribute: SNPOSLayoutAttribute
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// See SNPConstraintProducing.
    public func produceConstraints <A where A.ConstantType == ConstantType> (#relation: SNPOSLayoutRelation, expression: SNPExpression<A>) -> [SNPConstraint] {
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
    public func produceConstraints(#relation: SNPOSLayoutRelation, expression: SNPAnonymousExpression<ConstantType>) -> [SNPConstraint] {
        assert(contains(self.dynamicType.supportedAttributes, self.attribute), "Cannot produce constraints: unsupported destination layout attribute.")
        assert(self.view.superview != nil, "Cannot produce constraints: destination view has no superview.")
        return [SNPConstraint(
            destination: (self.view, self.attribute),
            source: (self.view.superview!, ((self.attribute == .CenterX) ? .Left : .Top)),
            relation: relation,
            constant: expression.constantValue,
            multiplier: 1,
            priority: expression.priority
        )]
    }
    
}
