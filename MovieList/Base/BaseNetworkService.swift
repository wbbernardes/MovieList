//
//  BaseNetworkService.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation
import Moya

class BaseNetworkService<T: TargetType> {
    
    internal var provider: MoyaProvider<T>
    
    init(operationMode: NetworkOperationMode = NetworkManager.shared.currentNetworkOperationMode) {
        switch operationMode {
        case .normal:
            provider = MoyaProvider<T>(plugins: NetworkManager.shared.createMoyaPlugins())
        case .stubResponse:
            provider = MoyaProvider<T>(stubClosure: {(_: T) -> Moya.StubBehavior in return .immediate}, plugins: [])
        case .stubWithDelay(delay: let delay):
            provider = MoyaProvider<T>(stubClosure: {(_: T) -> Moya.StubBehavior in return .delayed(seconds: delay)}, plugins: [])
        case .stubWithError(statusCode: let statusCode, data: let data):
            provider = MoyaProvider<T>(endpointClosure: StubResponseManager<T>.createEndpointClosure(statusCode: statusCode, data: data), stubClosure: {(_: T) -> Moya.StubBehavior in return .immediate}, plugins: [])
        }
    }
}
