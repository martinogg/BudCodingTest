//
//  MockUITableView.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class MockUITableView : UITableView {
    
    var reloadDataCallBack: (()->())?
    override func reloadData() {
        
        reloadDataCallBack?()
    }
}
