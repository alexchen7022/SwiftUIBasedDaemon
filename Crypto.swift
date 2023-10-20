//
//  Crypto.swift
//  SwiftUIBasedDaemon
//
//  Created by 涼麵 on 2023/10/20.
//

import Foundation
import CryptoKit

typealias PKey = SecureEnclave.P256.Signing.PrivateKey
struct CryptoService{
    private var privateKey :PKey

    init(privateKey: PKey) throws{
        self.privateKey = privateKey
    }
    
    init() throws{
        self.privateKey = try CryptoService.generatePrivateKey()
    }
    
    static func generatePrivateKey() throws -> PKey{
            let accessControl = SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            [.privateKeyUsage], nil)!
            return try SecureEnclave.P256.Signing.PrivateKey(accessControl: accessControl)
    }
    func getPrivateKey() -> PKey{
        return self.privateKey
    }
    

}
