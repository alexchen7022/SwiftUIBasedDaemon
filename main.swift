//
//  Main.swift
//  SwiftUIBasedDaemon
//
//  Created by 涼麵 on 2023/10/20.
//

import Foundation

print("hello")
let generatedKey = try CryptoService.generatePrivateKey()
let service = try CryptoService(privateKey: generatedKey)
let privateKey = service.getPrivateKey()

print(privateKey.rawRepresentation)
