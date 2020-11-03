//
//  NetworkManager.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation
import Moya

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    /// Set Moya on verbose mode
    var isMoyaOnVerboseMode: Bool = false
    
    private init() {
        
    }
    
    /// Current Network Operation Mode
    var currentNetworkOperationMode: NetworkOperationMode! {
        if ProjectUtils.isRunningTests() {
            return .stubResponse
        } else {
            return .normal
        }
    }
    
    /// Create and return Moya Plugins
    func createMoyaPlugins() -> [PluginType] {
        var plugins: [PluginType] = []
        plugins.append(createAuthPlugin())
        if isMoyaOnVerboseMode {
            plugins.append(NetworkLoggerPlugin())
        }
        return plugins
    }
    
    func  getCurrentBaseURL() -> URL {
        // Add the URL
        return URL(string: "")!
    }
}

extension NetworkManager {
    
    func createAuthPlugin() -> AccessTokenPlugin {
        return AccessTokenPlugin(tokenClosure: { _ in
            // Get the Token from Session
            return ""
        })
    }
}
