@_exported import XCTest
@_exported @testable import SwepPerfectSupport

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(SwepPerfectSupportTests.allTests),
  ]
}
#endif