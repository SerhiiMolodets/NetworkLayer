//  Created by Serhii Molodets on 24.09.2024.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var token: String? { get }
    var apiKey: String? { get }
}

public extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var token: String? {
        return nil
    }
    
    var apiKey: String? {
        return nil
    }
}
