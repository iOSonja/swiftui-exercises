//
//  ContentView.swift
//  Acquaintances
//
//  Created by Sonja Ek on 20.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputImage: UIImage?
    @State private var people = [Person]()
    @State private var savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("people.json")

    @State private var showingImagePicker = false
    @State private var showingAddView = false
    @State private var newPersonAdded = false

    var body: some View {
        NavigationView {
            List(people, id: \.id) { person in
                HStack {
                    Text(person.name)
                    Spacer()
                    person.image?
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add person") {
                        showingImagePicker = true
                    }
                }
            }
            .task {
                loadData()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { _ in
                showingAddView = true
            }
            .onChange(of: newPersonAdded) { _ in
                loadData()
            }
            .sheet(isPresented: $showingAddView) {
                AddView(isDone: $newPersonAdded, people: $people, inputImage: inputImage, url: savePath)
            }
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func loadData() {
        do {
            let data = try Data(contentsOf: savePath)
            let decoder = JSONDecoder()
            let decodedPeople = try decoder.decode([Person].self, from: data)
            people = decodedPeople.sorted()
            print("success with loadData")
        } catch {
            people = []
            print("Unable to load people")
        }
    }

    func loadImage(inputImage: UIImage?) -> Image? {
        guard let inputImage = inputImage else { return nil }
        return Image(uiImage: inputImage)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
