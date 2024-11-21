![image](https://github.com/user-attachments/assets/1fa9601a-e645-4995-b73b-4345faf124be)

# XCUIEnhance

`XCUIEnhance` is a lightweight Swift library that extends XCTest, offering powerful utilities to simplify and enhance UI testing in iOS, tvOS, and macOS applications. With this library, you can simplify predicate usage, wait for element states, and write element locators quickly and hassle-free.

## Features

- **Flexible** `wait` **function:** Wait for `XCUIElement` to achieve a specific state (`exists`, `hittable`, `enabled`, etc.).
- **Force Tap with Offset:** Tap on an element at a specific offset, regardless of its state.
- **Sibling Locators:** Retrieve sibling elements of a specific type within a parent container.
- **Advanced Query Extensions:** Simplify the creation of queries with predicates for `label`, `value`, `identifier`, and more.

## Installation
### Swift Package Manager
To integrate XCUIEnhance into your project, add it to your `Package.swift` file:
```swift
// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "YourProject",
    dependencies: [
        .package(url: "https://github.com/tatuliana/XCUIEnhance.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: ["XCUIEnhance"]
        ),
    ]
)
```
Or, in Xcode:

1. Go to **File > Add Package Dependencies**.
2. Enter the repository URL: `https://github.com/tatuliana/XCUIEnhance.git` into the search field.
3. Select the `xcuienhance` package.
4. Add the package to your project.
5. Ensure the dependency is correctly linked to the appropriate target:
    - Navigate to **Project Settings → Targets → Your UI Testing Target**.
    - Go to the General tab:
        - Scroll to **Frameworks and Libraries**.
        - Check if the `XCUIEnhance` library is listed here.
        - If not, click the `+` button, search for your library, and add it.
    - In the Build Phases tab:
        - Confirm that the `XCUIEnhance` library is listed under **Link Binary with Libraries** for the UI testing target.
6. Add the `import XCUIEnhance` statement to the file where you want to use the library. For better maintainability, consider adding it to a common superclass or base class if applicable.

## Usage
### 1. Waiting for an Element's State
Wait for an element to achieve a specific state with a customizable timeout.
```swift
let button = XCUIApplication().buttons["Submit"]
let result = button.wait(state: .hittable, timeout: 5.0)

if result {
    print("Button is hittable!")
}
```
### 2. Force Tap with Offset
Force a tap at a specific offset relative to an element's bounds.
```swift
let element = XCUIApplication().buttons["Submit"]
element.forceTapWithOffset(dx: 0.1, dy: 0.9) // Tap near the bottom-left corner
```
### 3. Locating Sibling Elements
Find sibling elements of a specific type in the same parent container.
```swift
if let siblings = element.siblings(ofType: .button, inParentOfType: .other) {
    print("Found sibling buttons: \(siblings.count)")
}
```
### 4. Simplifying Queries
Use the query extensions to locate elements by `label`, `value`, `placeholderValue`, or `identifier`.
**Example: Label Contains**
```swift
let elements = XCUIApplication().staticTexts.label(containing: "Welcome", "Login", type: .or)
```
**Example: Value Matches**
```swift
let elements = XCUIApplication().textFields.value(matching: "Some text", caseSensitive: false)
```
**Example: Identifier Contains**
```swift
let elements = XCUIApplication().buttons.identifier(containing: "Submit")
```
## Documentation

### Extensions for `XCUIElement`
1. `wait(state:result:timeout:isSlowed:)`
- Waits for an element to achieve a specific state (exists, hittable, enabled, selected, etc.).
- Supports customizable timeouts and a slowing option for edge cases.
2. `forceTapWithOffset(dx:dy:)`
- Taps on the element at a specific offset, regardless of its state.
3. `siblings(ofType:inParentOfType:)`
- Retrieves sibling elements within a shared parent container.

### Extensions for `XCUIElementQuery`
1. `label(containing:type:caseSensitive:)`
- Filters elements with labels containing specific text.
2. `label(matching:type:caseSensitive:)`
- Filters elements with labels matching specific text exactly.
3. `value(containing:type:caseSensitive:)`
- Filters elements with values containing specific text.
4. `value(matching:type:caseSensitive:)`
- Filters elements with values matching specific text exactly.
5. `placeholderValue(containing:type:caseSensitive:)`
- Filters elements with placeholder values containing specific text.
6. `placeholderValue(matching:type:caseSensitive:)`
- Filters elements with placeholder values matching specific text exactly.
7. `identifier(containing:type:caseSensitive:)`
- Filters elements with identifiers containing specific text.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License
This project is licensed under the [Apache License 2.0](LICENSE).

You may use, distribute, and modify this code under the terms of the license. A copy of the license is included in this repository.
