//
//  AddView.swift
//  Acquaintances
//
//  Created by Sonja Ek on 20.11.2022.
//

import SwiftUI

struct SuccessView: View {
    let inputImage: UIImage

    var body: some View {
        Image(uiImage: inputImage)
            .resizable()
            .scaledToFit()
    }
}

struct FailedView: View {
    var body: some View {
        Text("Couldn't load the image")
    }
}

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""

    @Binding var isDone: Bool
    @Binding var people : [Person]

    let inputImage: UIImage?
    let url: URL
    let locationFetcher = LocationFetcher()

    enum ImageState {
        case success, failed
    }

    var body: some View {
        NavigationView {
            List {
                if let rawImage = inputImage {
                    SuccessView(inputImage: rawImage)
                } else {
                    FailedView()
                }

                TextField("Person's name", text: $name)

                Button("Allow Location") {
                    self.locationFetcher.start()
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        save()
                        isDone = true
                        dismiss()
                    }
                        .disabled(inputImage == nil)
                }
            }
        }
    }

    func save() {
        var latitude : Double? = nil
        var longitude : Double? = nil

        if let location = self.locationFetcher.lastKnownLocation {
            latitude = location.latitude
            longitude = location.longitude
        }

        let person = Person(id: UUID(), name: name, longitude: longitude, latitude: latitude)

        do {
            people.append(person)
            let encoder = JSONEncoder()
            let json = try encoder.encode(people)

            try? json.write(to: url, options: [.atomic, .completeFileProtection])

            if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: FileManager.default.getDocumentsDirectory.appendingPathComponent(person.id.uuidString  + ".jpg"), options: [.atomic, .completeFileProtection])
            }
            print("Person successfully saved")
        } catch {
            print("Couldn't save the person")
        }
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
