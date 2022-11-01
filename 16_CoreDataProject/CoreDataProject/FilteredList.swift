//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sonja Ek on 1.11.2022.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }

    init(filter: String) {
        // The underscore is there because we’re not writing to the fetched results object
        // inside our fetch request, but instead writing a wholly new fetch request
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
