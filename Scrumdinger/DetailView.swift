//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Paul Mo on 2023/10/14.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Metting Info")){
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer").font(.headline).foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)").padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in Label("\(attendee.name)", systemImage: "person")
                }
            }
            Section(header: Text("Hisroy")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
            
        }.navigationTitle("\(scrum.title)")
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    editingScrum = scrum
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    DetailEditView(scrum: $editingScrum)
                        .navigationTitle(scrum.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("done") {
                                    isPresentingEditView = false
                                    scrum = editingScrum
                                }
                            }
                        }
                }
                
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
