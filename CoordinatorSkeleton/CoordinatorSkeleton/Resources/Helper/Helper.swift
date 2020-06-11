//
//  Helper.swift
//  RecipeApp
//
//  Created by Ilkay Hamit on 11/06/2020.
//  Copyright © 2020 Ilkay Hamit. All rights reserved.
//

import Foundation

struct Helper {
    
    static func isJsonAvailable(fileName: String) -> Bool {
           do {
               let fileManager = FileManager.default
               let url = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               let jsonUrl = url.appendingPathComponent(fileName)
               return fileManager.fileExists(atPath: jsonUrl.path)
           } catch {
               return false
           }
       }

    static func saveJsonToDocumentDirectory<T: Codable>(object: T, fileName: String) {
           do {
                var objectData = Data()
                let encoder = JSONEncoder()
                objectData =  try encoder.encode(object)
               let fileManager = FileManager.default
               let url = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               let jsonUrl = url.appendingPathComponent(fileName)
               try objectData.write(to: jsonUrl)
               print("\(fileName) is stored in \(jsonUrl)")
           } catch {
               
           }
       }
       
       static func readJsonFromDocumentDirectory(fileName: String) -> Data {
           do {
               let fileManager = FileManager.default
               let url = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               let jsonUrl = url.appendingPathComponent(fileName)
               guard let data = try? Data(contentsOf: jsonUrl) else {
                   return Data()
               }
               return data
           } catch {

           }
           return Data()
       }
}
