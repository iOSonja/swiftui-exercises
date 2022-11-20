//
//  AddView.swift
//  Acquaintances
//
//  Created by Sonja Ek on 20.11.2022.
//

import SwiftUI

struct AddView: View {
    let image: Image?
    @State private var name = ""

    var body: some View {
        NavigationView {
            List {
                image?
                    .resizable()
                    .scaledToFit()

                TextField("Person's name", text: $name)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save", action: save)
                        .disabled(image == nil)
                }
            }
        }
    }

    func save() {
        // to be continued
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
