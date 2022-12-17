//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sonja Ek on 17.12.2022.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    enum SortType {
        case `default`, name, country
    }

    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var isShowingDialog = false
    @State private var sortOrder = SortType.default

    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }

                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    isShowingDialog = true
                } label : {
                    Text("Sorting")
                    Label("Sort resorts", systemImage: "arrow.up.arrow.down")
                }
            }
            .confirmationDialog("Choose sorting", isPresented: $isShowingDialog) {
                Button("Sort by resort name") {
                 sortOrder = .name
                }
                Button("Sort by country") {
                 sortOrder = .country
                }
                Button("Default sorting") {
                    sortOrder = .default
                }
              }
            
            WelcomeView()
        }
        .environmentObject(favorites)
        .phoneOnlyStackNavigationView()
    }

    var filteredResorts: [Resort] {
        let result: [Resort]

        if searchText.isEmpty {
            result = resorts
        } else {
            result = resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }

        if sortOrder == .name {
            return result.sorted { $0.name < $1.name }
        } else if sortOrder == .country {
            return result.sorted { $0.country < $1.country }
        } else {
            return result
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
