//
//  SNPViewProxy.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

import UIKit

/// SNPViewProxy is a wrapper around UIView, providing easy and safe access to
/// the layout attributes of a proxied view.
public class SNPViewProxy {
    
    /// The proxied view.
    public let view: UIView
    
    /// Creates and returns an initialized view proxy.
    ///
    /// :param: view The view to be proxied.
    public init(view: UIView) {
        self.view = view
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

public extension SNPViewProxy {
    
    /// Top edge layout attribute.
    var top: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Top)
    }
    
    /// Bottom edge layout attribute.
    var bottom: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Bottom)
    }
    
    /// Left edge layout attribute.
    public var left: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Left)
    }
    
    /// Right edge layout attribute.
    public var right: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Right)
    }
    
    /// Leading edge layout attribute.
    public var leading: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Leading)
    }
    
    /// Trailing edge layout attribute.
    public var trailing: SNPEdgeAttribute<Double> {
        return SNPEdgeAttribute<Double>(view: self.view, attribute: .Trailing)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Baseline layout attribute.
    public var baseline: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self.view, attribute: .Baseline)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Width layout attribute.
    public var width: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self.view, attribute: .Width)
    }
    
    /// Height layout attribute.
    public var height: SNPDoubleAttribute<Double> {
        return SNPDoubleAttribute<Double>(view: self.view, attribute: .Height)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// X-coordinate center layout attribute.
    public var centerX: SNPPositionAttribute<Double> {
        return SNPPositionAttribute<Double>(view: self.view, attribute: .CenterX)
    }
    
    /// Y-coordinate center layout attribute.
    public var centerY: SNPPositionAttribute<Double> {
        return SNPPositionAttribute<Double>(view: self.view, attribute: .CenterY)
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Convienience edge insets layout attributes.
    public var edges: SNPInsetsAttribute<UIEdgeInsets> {
        return SNPInsetsAttribute<UIEdgeInsets>(view: self.view, attribute: nil)
    }

    
}

// /////////////////////////////////////////////////////////////////////////////

public extension UIView {
    
    /// Returns a proxy of itself.
    public var snp: SNPViewProxy {
        return SNPViewProxy(view: self)
    }
    
}
