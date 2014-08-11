//
//  SNPView+Attributes.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

public extension UIView {
    
    /// Top edge layout attribute.
    public var snp_top: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Top)
    }
    
    /// Bottom edge layout attribute.
    public var snp_bottom: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Bottom)
    }
    
    /// Left edge layout attribute.
    public var snp_left: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Left)
    }
    
    /// Right edge layout attribute.
    public var snp_right: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Right)
    }
    
    /// Leading edge layout attribute.
    public var snp_leading: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Leading)
    }
    
    /// Trailing edge layout attribute.
    public var snp_trailing: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self, attribute: .Trailing)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Baseline layout attribute.
    public var snp_baseline: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self, attribute: .Baseline)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Width layout attribute.
    public var snp_width: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self, attribute: .Width)
    }
    
    /// Height layout attribute.
    public var snp_height: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self, attribute: .Height)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// X-coordinate center layout attribute.
    public var snp_centerX: SNPPositionAttribute<Double> {
        return SNPPositionAttribute<Double>(view: self, attribute: .CenterX)
    }
    
    /// Y-coordinate center layout attribute.
    public var snp_centerY: SNPPositionAttribute<Double> {
        return SNPPositionAttribute<Double>(view: self, attribute: .CenterY)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Convienience edge insets layout attributes.
    public var snp_edges: SNPInsetsAttribute<UIEdgeInsets> {
        return SNPInsetsAttribute<UIEdgeInsets>(view: self, attribute: nil)
    }
    
}
