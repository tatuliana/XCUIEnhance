//
//  XCUIElementExtensions.swift
//  XCUIEnhance
//
//  Created by Natalia Popova on 11/16/24.
//

import Foundation
import XCTest

public extension XCUIElement {
    enum ElementState: String {
        case exists = "exists"
        case hittable = "isHittable"
        case enabled = "isEnabled"
        case selected = "isSelected"
#if !os(macOS)
        case focused = "hasFocus"
#else
#endif
    }
    
    /// Handles waiting for an element to achieve a specific state.
    /// - parameter state: `ElementState`. The desired state of the element, such as `exists`, `hittable`, `enabled`, or `selected`. The default value is `exists`.
    /// - parameter result: `Bool`. The expected result for the element state. The default value is `true`.
    /// - parameter timeout: `TimeInterval`. The maximum duration to wait for the element to achieve the specified state, in seconds. The default value is set to 5.0 seconds.
    /// - parameter isSlowed: `Bool`. When set to `true`, the function waits for the full timeout duration before making an assertion, even if the condition is met earlier. The default value is `false`.
    /// - returns: `Bool`. A boolean value indicating whether the condition was met within the specified timeout.
    /// - warning: If the condition is met at the time the function is called, it does not wait and immediately returns. In this case, the behavior is equivalent to directly checking properties like `exists`, `isHittable`, `isEnabled`, or `isSelected`. However, in rare cases, if the element appears slightly later after the assertion has already occurred, it may result in a false positive.
    /// To mitigate this, set the `isSlowed` parameter to `true` to introduce a deliberate delay, ensuring proper validation.
    func wait(state: ElementState = .exists, result: Bool = true, timeout: TimeInterval = 5.0, isSlowed: Bool = false) -> Bool {
#if !os(macOS)
        if !isSlowed{
            switch state {
            case .exists:
                if (result && exists) || (!result && !exists) {
                    return true
                }
            case .hittable:
                if (result && isHittable) || (!result && !isHittable) {
                    return true
                }
            case .enabled:
                if (result && isEnabled) || (!result && !isEnabled) {
                    return true
                }
            case .selected:
                if (result && isSelected) || (!result && !isSelected) {
                    return true
                }
            case .focused:
                if (result && hasFocus) || (!result && !hasFocus) {
                    return true
                }
            }
        }
#else
        if !isSlowed{
            switch state {
            case .exists:
                if (result && exists) || (!result && !exists) {
                    return true
                }
            case .hittable:
                if (result && isHittable) || (!result && !isHittable) {
                    return true
                }
            case .enabled:
                if (result && isEnabled) || (!result && !isEnabled) {
                    return true
                }
            case .selected:
                if (result && isSelected) || (!result && !isSelected) {
                    return true
                }
            }
        }
#endif
        let predicate = NSPredicate(format: "\(state.rawValue) == \(result ? "true" : "false")")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        return XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed
    }

    /// Taps on the element at a specific offset relative to its bounds, regardless of its state.
    /// - Parameters:
    ///   - dx: A horizontal offset, specified as a normalized value between 0.0 and 1.0,
    ///         where 0.0 represents the left edge of the element and 1.0 represents the right edge.
    ///         The default value is 0.5, which corresponds to the horizontal center of the element.
    ///   - dy: A vertical offset, specified as a normalized value between 0.0 and 1.0,
    ///         where 0.0 represents the top edge of the element and 1.0 represents the bottom edge.
    ///         The default value is 0.5, which corresponds to the vertical center of the element.
    ///
    /// - Usage:
    /// ```swift
    /// element.forceTapWithOffset() // Taps the center of the element
    /// element.forceTapWithOffset(dx: 0.2, dy: 0.8) // Taps near the bottom-left corner of the element
    /// ```
    func forceTapWithOffset(dx: Double = 0.5, dy: Double = 0.5) {
        coordinate(withNormalizedOffset: CGVector(dx: dx, dy: dy)).tap()
    }
    
    /// Returns sibling elements of the given type, if the current element can be identified by an `identifier` or a `label`.
    /// - Parameters:
    ///   - siblingType: The type of sibling elements you want to find.
    ///   - parentType: The type of the parent element containing both the current element and its siblings.
    /// - Returns: A query for sibling elements of the given type, or nil if the parent is not found.
    func siblings(ofType siblingType: XCUIElement.ElementType, inParentOfType parentType: XCUIElement.ElementType) -> XCUIElementQuery? {
        // Search the entire hierarchy for an ancestor of the specified type
        let ancestorQuery = XCUIApplication().descendants(matching: parentType)
        
        // Look for the parent that contains both the current element (self) and its siblings
        for index in 0..<ancestorQuery.count {
            let potentialParent = ancestorQuery.element(boundBy: index)
            
            // Check if the current element (`self`) is a child of this parent
            let parentChildren = potentialParent.children(matching: .any)
            let siblings = potentialParent.children(matching: siblingType)
            for i in 0..<parentChildren.count {
                let child = parentChildren.element(boundBy: i)
                if child.identifier == self.identifier && self.identifier != "" {
                    // Found the parent, return the siblings of the specified type
                    return siblings.matching(NSPredicate(format: "self.identifier != %@.identifier", self))
                } else if child.label == self.label && self.label != "" {
                    return siblings.matching(NSPredicate(format: "self.label != %@.label", self))
                } else {
                    continue
                }
            }
        }
        return nil
    }
}
