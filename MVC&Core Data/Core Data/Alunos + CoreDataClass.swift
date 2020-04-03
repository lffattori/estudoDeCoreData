//
//  CoreDataObjects.swift
//  MVC&Core Data
//
//  Created by Luiza Fattori on 03/04/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class Alunos: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alunos> {
        return NSFetchRequest<Alunos>(entityName: "Aluno")
    }

    @NSManaged public var nome: String?
    @NSManaged public var curso: String?
    @NSManaged public var tia: String?
    
    
}
