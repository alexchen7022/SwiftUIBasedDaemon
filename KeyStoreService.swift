//
//  KeyStore.swift
//  SwiftUIBasedDaemon
//
//  Created by 涼麵 on 2023/10/20.
//

import Foundation
import CryptoKit

struct KeyStoreService{
    
    func remove(key: String) {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key]
        
        SecItemDelete(query as CFDictionary)
    }
//    func storeKey(account:String, key:SecureEnclave.P256.Signing.PrivateKey)-> OSStatus {
//        remove(key: account)
//        let query = [kSecClass: kSecClassGenericPassword,
//                     kSecAttrAccount: account,
//                     kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
//                     kSecUseDataProtectionKeychain: true,
//                     kSecValueData: key.rawRepresentation] as [String: Any]
//
//        // Add the key data.
//        let status = SecItemAdd(query as CFDictionary, nil)
//        return status
//    }
//    func retrieveKey(account:String)-> SecureEnclave.P256.Signing.PrivateKey? {
//        // Seek a generic password with the given account.
//        let query = [kSecClass: kSecClassGenericPassword,
//                     kSecAttrAccount: account,
//                     kSecUseDataProtectionKeychain: true,
//                     kSecReturnData: true] as [String: Any]
//
//
//        // Find and cast the result as data.
//        var item: CFTypeRef?
//        let status = SecItemCopyMatching(query as CFDictionary, &item)
//        guard status == errSecSuccess else {
//            return nil
//        }
//        guard let data = item as? Data else {
//            return nil
//        }
//        return try? SecureEnclave.P256.Signing.PrivateKey(rawRepresentation: data)  // Convert back to a key.
//    }
}
