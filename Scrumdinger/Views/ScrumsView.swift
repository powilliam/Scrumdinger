//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by William Porto on 30/05/21.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .navigationTitle("Daily Scrums")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "plus")
                })
                .listRowBackground(scrum.color)
            }
        }
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let index = scrums.firstIndex(where: { dailyScrum in
            dailyScrum.id == scrum.id
        })
        else {
            fatalError("Can't find scrum in array")
        }
        return $scrums[index]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
