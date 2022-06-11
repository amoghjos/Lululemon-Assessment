//
//  CoreDataModel.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation
import CoreData

//PersistenceStorage is implemented using CoreData and it only exposes 2 APIs to allows other models to interact with it while rest of the implementation details are kept hidden
//Citation: https://www.youtube.com/watch?v=tP4OGvIRUC4

class PersistenceStorage {
    
    func addGarment(_ name: String){
        let garment = Garment(context: persistentContainer.viewContext)
        garment.name = name
        garment.creationTime = Date()
        saveContext()
    }
    
    func getGarments() -> [Garment] {
        let fetchRequest: NSFetchRequest<Garment> = Garment.fetchRequest()
        var garments = [Garment]()
        
        do {
            garments = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            //I'm currently not handling errors because CoreData was the last module I worked on and I can't spend more time but this is def tech debt which needs to be addressed in future
            print(error)
        }
        return garments
    }
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: K.DataModel.garmentDataModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                //I'm currently not handling errors because CoreData was the last module I worked on and I can't spend more time but this is def tech debt which needs to be addressed in future
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
        
    private func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //I'm currently not handling errors because CoreData was the last module I worked on and I can't spend more time but this is def tech debt which needs to be addressed in future
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
