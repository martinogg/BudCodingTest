//
//  MockJSONData.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import ObjectMapper
@testable import budTestApp

class MockJSONData {
    
    static func mockJSONData() -> TransactionAmountData? {
        
        let testBundle = Bundle(for: type(of: MockJSONData()))
        
        guard let filePath = testBundle.path(forResource: "testModel", ofType: "json"),
            let data = NSData(contentsOfFile: filePath),
            let jsonDataRaw = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments),
            let jsonData = jsonDataRaw as? [String: Any] else {
                
                return nil
        }
        
        return Mapper<TransactionAmountData>().map(JSON: jsonData)
    }
}
