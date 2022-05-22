//
//  Notes.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import Foundation
import RealmSwift


class Notes: Object {
    @Persisted var taskname: String = ""
    @Persisted var taskdescription: String = ""
    @Persisted var taskstatus: Int?
}
