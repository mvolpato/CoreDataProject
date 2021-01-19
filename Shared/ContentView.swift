//  ContentView
//  Shared
//
//  Created by Michele Volpato on 16/01/2021.
//  
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    @State private var lastNameFilter = "A"
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>

    var body: some View {
        VStack {
            VStack {
                FilterList(filterKey: "lastName",
                           filterValue: lastNameFilter,
                           predicate: "BEGINSWITH",
                           sortDescriptors: [NSSortDescriptor(keyPath: \Singer.lastName, ascending: false)]) { (singer: Singer) in
                    Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                }
                Button("Add Examples") {
                    let taylor = Singer(context: self.moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"

                    let ed = Singer(context: self.moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"

                    let adele = Singer(context: self.moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"

                    try? self.moc.save()
                }

                Button("Show A") {
                    self.lastNameFilter = "A"
                }

                Button("Show S") {
                    self.lastNameFilter = "S"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
