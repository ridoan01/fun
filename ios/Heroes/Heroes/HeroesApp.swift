//
//  HeroesApp.swift
//  Heroes
//
//  Created by Ridoan Wibisono on 06/07/21.
//

import SwiftUI
import CoreData
@main
struct HeroesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}



var persistentContainer : NSPersistentContainer = {
    let container = NSPersistentContainer(name: "HeroDataModel")
    container.loadPersistentStores(completionHandler: { storeDescription, error in
        if let error = error as NSError?{
            fatalError("Unresolved Error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext(){
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do{
            try context.save()
        }catch{
            let nserror = error as NSError
            fatalError("Unresolved Error \(error), \(nserror.userInfo)")
        }
    }
}
