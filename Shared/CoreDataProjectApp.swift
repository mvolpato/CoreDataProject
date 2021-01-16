//  CoreDataProjectApp
//  Shared
//
//  Created by Michele Volpato on 16/01/2021.
//  
//

import CoreData
import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        persistenceController.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
