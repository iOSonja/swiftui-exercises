//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Sonja Ek on 29.11.2022.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }

    enum SortType {
        case name, date
    }

    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var isShowingDialog = false
    @State private var sortOrder = SortType.date

    let filter: FilterType

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        if filter == .none && prospect.isContacted {
                            Label("Contacted", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.green)
                        } else if filter == .none && !prospect.isContacted {
                            Label("Uncontacted", systemImage: "hourglass")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.yellow)
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)

                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingDialog = true
                    } label : {
                        Label("Sort", systemImage: "person.fill.and.arrow.left.and.arrow.right")
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
            .confirmationDialog("Choose sorting",
                isPresented: $isShowingDialog) {
                Button("Sort by name") {
                    sortOrder = .name
                }
                Button("Sort by most recent") {
                    sortOrder = .date
                }
             }
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }

    var filteredProspects: [Prospect] {
        let result: [Prospect]

        switch filter {
        case .none:
            result = prospects.people
        case .contacted:
            result = prospects.people.filter { $0.isContacted }
        case .uncontacted:
            result = prospects.people.filter { !$0.isContacted }
        }

        if sortOrder == .name {
            return result.sorted { $0.name < $1.name }
        } else {
            return result.reversed()
        }
    }

    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false

        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]

            prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }

    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
