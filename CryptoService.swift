//
//  CryptoService.swift
//  SwiftUIBasedDaemon
//
//  Created by 涼麵 on 2023/10/20.
//

import Foundation
import CryptoKit

struct CryptoService{
    private var privateKey :SecureEnclave.P256.Signing.PrivateKey

    init(privateKey: SecureEnclave.P256.Signing.PrivateKey) throws{
        self.privateKey = privateKey
    }
    
    static func generatePrivateKey() throws -> SecureEnclave.P256.Signing.PrivateKey{
            let accessControl = SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            [.privateKeyUsage], nil)!
            return try SecureEnclave.P256.Signing.PrivateKey(accessControl: accessControl)
    }
    
    func getPrivateKey() -> SecureEnclave.P256.Signing.PrivateKey{
        return self.privateKey
    }
    

}
protocol GenericPasswordConvertible: CustomStringConvertible {
    /// Creates a key from a raw representation.
    init<D>(rawRepresentation data: D) throws where D: ContiguousBytes
    
    /// A raw representation of the key.
    var rawRepresentation: Data { get }
}

extension SecureEnclave.P256.Signing.PrivateKey: GenericPasswordConvertible {
    public var description: String {
        return "SecureEnclave.P256.Signing.PrivateKey.GenericPasswordConvertible"
    }
    
    init<D>(rawRepresentation data: D) throws where D: ContiguousBytes {
        try self.init(dataRepresentation: data.withUnsafeBytes{Data($0)})
    }
   
    var rawRepresentation: Data {
        return dataRepresentation  // Contiguous bytes repackaged as a Data instance.
    }
}


