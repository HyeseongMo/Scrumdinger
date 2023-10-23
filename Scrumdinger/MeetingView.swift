//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Paul Mo on 2023/10/12.
//

import SwiftUI
import SwiftData

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0).fill(scrum.theme.mainColor)
            VStack {
                
                
                Spacer()
                Circle().stroke(lineWidth: 24)
                Spacer()
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
            .padding()
        }.padding().foregroundColor(scrum.theme.accentColor).navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
