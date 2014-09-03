//
//  SNPStandardAttribute.swift
//  Snappy
//
//  Created by Adrian on 29.08.2014.
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//

public struct SNPStandardAttribute: SNPAttributeType, SNPConstraintProducing, SNPAnonymousConstraintProducing {
    
    /// Creates and returns an initialized standard attribute.
    ///
    /// :param: view The associated view.
    /// :param: attribute The represented layout attribute.
    init(view: SNPOSView, attribute: SNPOSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
    
    /// An array of supported source layout attributes.
    public var supportedSourceAttributes: [SNPOSLayoutAttribute] = []
    
    /// The attribute that will be inherited when producing a constraint from
    /// an anonymous expression.
    public var anonymousAttribute: SNPOSLayoutAttribute?
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// See SNPAttributeType.
    public typealias ConstantType = Double
    
    /// See SNPAttributeType.
    public let view: SNPOSView
    
    /// See SNPAttributeType.
    public let attribute: SNPOSLayoutAttribute
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// See SNPConstraintProducing.
    public func produceConstraints <A where A.ConstantType == ConstantType> (#relation: SNPOSLayoutRelation, expression: SNPExpression<A, ConstantType>) -> [SNPConstraint] {
        assert(contains(self.supportedSourceAttributes, expression.attribute.attribute), "Cannot produce constraints: unsupported source attribute.")
        return [SNPConstraint(
            destination: (self.view, self.attribute),
            source: (expression.attribute.view, expression.attribute.attribute),
            relation: relation,
            constant: (expression.constantValue ?? 0) * ((expression.constantPositive ?? true) ? 1 : -1),
            multiplier: expression.multiplicationValue,
            priority: expression.priority
        )]
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    public func produceConstraints(#relation: SNPOSLayoutRelation, expression: SNPAnonymousExpression<ConstantType>) -> [SNPConstraint] {
        var source: SNPConstraint.SourceType = (nil, .NotAnAttribute)
        if let sourceAttribute = self.anonymousAttribute? {
            assert(self.view.superview != nil, "Cannot produce constraints: destination view has no superview.")
            source = (self.view.superview!, sourceAttribute)
        }
        return [SNPConstraint(
            destination: (self.view, self.attribute),
            source: source,
            relation: relation,
            constant: expression.constantValue,
            multiplier: 1,
            priority: expression.priority
        )]
    }
    
}
