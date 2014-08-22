//
//  SNPOperatorsSpec.swift
//  Snappy
//
//  Created by Adrian on 22.08.2014.
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//

import UIKit
import Nimble
import Quick
import Snappy

final class SNPOperatorsSpec: QuickSpec { override func spec() {
    
    describe("addition operator") {
        
        it("should add a positive constant factor to an expression") {
            let lhs: SNPExpression = SNPExpression<Double>()
            let rhs: Double = 5
            let expr: SNPExpression = lhs + rhs
            expect(expr.constantIsPositive!).to(beTruthy())
            expect(expr.constantValue!).to(equal(rhs))
        }
        
        it("should add a positive constant factor to an attribute") {
            let lhs: SNPAttribute = SNPAttribute<Double>(view: nil, attribute: nil)
            let rhs: Double = 5
            let expr: SNPExpression = lhs + rhs
            expect(expr.constantIsPositive!).to(beTruthy())
            expect(expr.constantValue!).to(equal(rhs))
        }
        
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    describe("subtraction operator") {
        
        it("should add a negative constant factor to an expression") {
            let lhs: SNPExpression = SNPExpression<Double>()
            let rhs: Double = 5
            let expr: SNPExpression = lhs - rhs
            expect(expr.constantIsPositive!).to(beFalsy())
            expect(expr.constantValue!).to(equal(rhs))
        }
        
        it("should add a negative constant factor to an attribute") {
            let lhs: SNPAttribute = SNPAttribute<Double>(view: nil, attribute: nil)
            let rhs: Double = 5
            let expr: SNPExpression = lhs - rhs
            expect(expr.constantIsPositive!).to(beFalsy())
            expect(expr.constantValue!).to(equal(rhs))
        }
        
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    describe("multiplication operator") {
        
        it("should add a multiplication factor to an attribute") {
            let lhs: SNPAttribute = SNPAttribute<Double>(view: nil, attribute: nil)
            let rhs: Double = 2
            let expr: SNPExpression = lhs * rhs
            expect(expr.multiplier).to(equal(rhs))
        }
        
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    describe("division operator") {
        
        it("should add an inverted multiplication factor to an attribute") {
            let lhs: SNPAttribute = SNPAttribute<Double>(view: nil, attribute: nil)
            let rhs: Double = 2
            let expr = lhs / rhs
            expect(expr.multiplier).to(equal(1/rhs))
        }
        
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    describe("priority operator") {
        
        it("should add a layout priority to an expression") {
            let lhs: SNPExpression = SNPExpression<Double>()
            let rhs: UILayoutPriority = 750
            let expr = lhs ~ rhs
            expect(expr.priority).to(equal(rhs))
        }
        
        it("should add a layout priority to an attribute") {
            let lhs: SNPAttribute = SNPAttribute<Double>(view: nil, attribute: nil)
            let rhs: UILayoutPriority = 750
            let expr = lhs ~ rhs
            expect(expr.priority).to(equal(rhs))
        }
        
    }
    
}}
