//
//  SNPViewProxy.swift
//
//  Copyright (c) 2014 Adrian Kashivskyy. All rights reserved.
//
//  Licensed under the MIT License.
//

/// SNPViewProxy is a wrapper around UIView, providing easy and safe access to
/// the layout attributes of a proxied view.
public class SNPViewProxy {
    
    /// The proxied view.
    public let view: SNPOSView
    
    /// Creates and returns an initialized view proxy.
    ///
    /// :param: view The view to be proxied.
    public init(view: SNPOSView) {
        self.view = view
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

public extension SNPOSView {
    
    /// Returns a view proxy of itself.
    public var snp: SNPViewProxy {
        return SNPViewProxy(view: self)
    }
    
}

// /////////////////////////////////////////////////////////////////////////////

public extension SNPViewProxy {

    /// Supported source layout attributes for vertical edges.
    private var supportedVerticalEdgeAttributes: [SNPOSLayoutAttribute] {
        return [.Top, .Bottom, .Baseline, .CenterY, .TopMargin, .BottomMargin]
    }

    /// Supported source layout attributes for horizontal edges.
    private var supportedHorizontalEdgeAttributes: [SNPOSLayoutAttribute] {
        return [.Left, .Right, .Leading, .Trailing, .CenterX, .LeftMargin, .RightMargin, .LeadingMargin, .TrailingMargin]
    }
    
    /// Top edge layout attribute.
    public var top: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Top)
        attr.supportedSourceAttributes = self.supportedVerticalEdgeAttributes
        attr.anonymousAttribute = .Top
        return attr
    }

    /// Bottom edge layout attribute.
    public var bottom: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Bottom)
        attr.supportedSourceAttributes = self.supportedVerticalEdgeAttributes
        attr.anonymousAttribute = .Bottom
        return attr
    }
    
    /// Left edge layout attribute.
    public var left: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Left)
        attr.supportedSourceAttributes = self.supportedHorizontalEdgeAttributes
        attr.anonymousAttribute = .Left
        return attr
    }
    
    /// Right edge layout attribute.
    public var right: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Right)
        attr.supportedSourceAttributes = self.supportedHorizontalEdgeAttributes
        attr.anonymousAttribute = .Right
        return attr
    }
    
    /// Leading edge layout attribute.
    public var leading: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Leading)
        attr.supportedSourceAttributes = self.supportedHorizontalEdgeAttributes
        attr.anonymousAttribute = .Leading
        return attr
    }
    
    /// Trailing edge layout attribute.
    public var trailing: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Trailing)
        attr.supportedSourceAttributes = self.supportedHorizontalEdgeAttributes
        attr.anonymousAttribute = .Trailing
        return attr
    }
    
    /// Baseline layout attribute.
    public var baseline: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Baseline)
        attr.supportedSourceAttributes = self.supportedVerticalEdgeAttributes
        attr.anonymousAttribute = .Baseline
        return attr
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// X-axis center layout attribute.
    public var centerX: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .CenterX)
        attr.supportedSourceAttributes = self.supportedHorizontalEdgeAttributes
        attr.anonymousAttribute = .Left
        return attr
    }
    
    /// Y-axis center layout attribute.
    public var centerY: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .CenterY)
        attr.supportedSourceAttributes = self.supportedVerticalEdgeAttributes
        attr.anonymousAttribute = .Top
        return attr
    }
    
    // /////////////////////////////////////////////////////////////////////////
    
    /// Width layout attibute.
    public var width: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Width)
        attr.supportedSourceAttributes = [.Width, .Height]
        return attr
    }
    
    /// Height layout attibute.
    public var height: SNPStandardAttribute {
        var attr = SNPStandardAttribute(view: self.view, attribute: .Height)
        attr.supportedSourceAttributes = [.Width, .Height]
        return attr
    }

}