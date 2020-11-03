//
//  ProjectUtils.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation

class ProjectUtils {
    
    /// Check if is running Unit tests
    class func isRunningUnitTests() -> Bool {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            return true
        } else {
            return false
        }
    }
    
    /// Check if is running UI tests
    class func isRunningUITests() -> Bool {
        if CommandLine.arguments.contains("--uitesting") {
            return true
        } else {
            return false
        }
    }
    
    /// Check if is running Unit or UI Tests
    class func isRunningTests() -> Bool {
        return isRunningUITests() || isRunningUnitTests()
    }
}
