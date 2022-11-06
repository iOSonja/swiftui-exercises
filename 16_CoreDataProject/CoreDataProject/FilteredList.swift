//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sonja Ek on 1.11.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }

    init(filterKey: String, filterValue: String, predicate: Predicate, sorters: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        let predicateString: String
        switch predicate {
        case .beginsWith:
            predicateString = "BEGINSWITH"
        case .endsWith :
            predicateString = "ENDSWITH"
        }
        // The underscore is there because we’re not writing to the fetched results object
        // inside our fetch request, but instead writing a wholly new fetch request
        _fetchRequest = FetchRequest<T>(sortDescriptors: sorters, predicate: NSPredicate(format: "%K \(predicateString) %@", filterKey, filterValue))
        self.content = content
    }
}
