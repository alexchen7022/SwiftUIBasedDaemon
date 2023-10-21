//
//  CryptoService.swift
//  SwiftUIBasedDaemon
//
//  Created by 涼麵 on 2023/10/20.
//

import Foundation
import CryptoKit

public typealias PKey = SecureEnclave.P256.Signing.PrivateKey
public struct CryptoService{
    public  var privateKey :PKey

    public init(privateKey: PKey) throws{
        self.privateKey = privateKey
    }
    
    public static func generatePrivateKey() throws -> PKey{
            let accessControl = SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            [.privateKeyUsage], nil)!
            return try PKey(accessControl: accessControl)
    }
    
    public func getPrivateKey() -> PKey{
        return self.privateKey
    }
    

}
public protocol GenericPasswordConvertible: CustomStringConvertible {
    /// Creates a key from a raw representation.
    init(rawRepresentation data: ContiguousBytes) throws
    
    /// A raw representation of the key.
    var rawRepresentation: Data { get }
}

extension SecureEnclave.P256.Signing.PrivateKey: GenericPasswordConvertible {
    public init(rawRepresentation data: ContiguousBytes) throws {
        try self.init(dataRepresentation: data.withUnsafeBytes{Data($0)})
    }
    
    public var description: String {
        return "SecureEnclave.P256.Signing.PrivateKey.GenericPasswordConvertible"
    }
   
    public var rawRepresentation: Data {
        return dataRepresentation  // Contiguous bytes repackaged as a Data instance.
    }
}


