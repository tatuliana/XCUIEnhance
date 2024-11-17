//
//  XCUIElementQueryExtensions.swift
//  XCUIEnhance
//
//  Created by Natalia Popova on 11/16/24.
//

import XCTest

extension XCUIElementQuery {    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the label contains the text passed as an argument
    /// - parameter texts: String. The text that the label contains
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.label(containing: "1")
    /// BaseScreen.app.staticTexts.label(containing: "1", "2")
    /// BaseScreen.app.staticTexts.label(containing: "1", "2", "3", caseSensitive: false)
    ///  ````
    func label(containing texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "label CONTAINS\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the label matches the text passed as an argument
    /// - parameter texts: String. The text that the label matches
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.label(matching: "1")
    /// BaseScreen.app.staticTexts.label(matching: "1", "2")
    /// BaseScreen.app.staticTexts.label(matching: "1", "2", "3", caseSensitive: false)
    ///  ````
    func label(matching texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "label MATCHES\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the value contains the text passed as an argument
    /// - parameter texts: String. The text that the value contains
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.value(containing: "1")
    /// BaseScreen.app.staticTexts.value(containing: "1", "2")
    /// BaseScreen.app.staticTexts.value(containing: "1", "2", "3", caseSensitive: false)
    ///  ````
    func value(containing texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "value CONTAINS\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the value matches the text passed as an argument
    /// - parameter texts: String. The text that the value matches
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.value(matching: "1")
    /// BaseScreen.app.staticTexts.value(matching: "1", "2")
    /// BaseScreen.app.staticTexts.value(matching: "1", "2", "3", caseSensitive: false)
    ///  ````
    func value(matching texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "value MATCHES\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
        
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the value contains the text passed as an argument
    /// - parameter texts: String. The text that the value contains
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.placeholderValue(containing: "1")
    /// BaseScreen.app.staticTexts.placeholderValue(containing: "1", "2")
    /// BaseScreen.app.staticTexts.placeholderValue(containing: "1", "2", "3", caseSensitive: false)
    ///  ````
    func placeholderValue(containing texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "placeholderValue CONTAINS\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the value matches the text passed as an argument
    /// - parameter texts: String. The text that the value matches
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.placeholderValue(matching: "1")
    /// BaseScreen.app.staticTexts.placeholderValue(matching: "1", "2")
    /// BaseScreen.app.staticTexts.placeholderValue(matching: "1", "2", "3", caseSensitive: false)
    ///  ````
    func placeholderValue(matching texts: String..., type: NSCompoundPredicate.LogicalType = .and, caseSensitive: Bool = true) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "placeholderValue MATCHES\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
    
    /// Extension to get an XCUIElementQuery from XCUIElementQuery where the identifier contains the text passed as an argument
    /// - parameter texts: String. The text that the identifier contains
    /// - parameter type: NSCompoundPredicate. LogicalType. An enum to choose the logical type out of AND, OR, NOT. Set to *AND* by default
    /// - parameter caseSensitive: Bool. Set to *true* by default
    /// - returns: XCUIElementQuery
    /// - _Examples:_
    /// ````
    /// BaseScreen.app.staticTexts.identifier(containing: "1")
    /// BaseScreen.app.staticTexts.identifier(containing: "1", "2")
    /// BaseScreen.app.staticTexts.identifier(containing: "1", "2", "3", caseSensitive: false)
    ///  ````
    func identifier(containing texts: String...,
        type: NSCompoundPredicate.LogicalType = .and,
        caseSensitive: Bool = true
    ) -> XCUIElementQuery {
        let caseMode = caseSensitive ? "" : "[c]"
        let subPredicates = texts.map { NSPredicate(format: "identifier CONTAINS\(caseMode)%@", $0) }
        let predicate = NSCompoundPredicate(type: type, subpredicates: subPredicates)
        return matching(predicate)
    }
}
