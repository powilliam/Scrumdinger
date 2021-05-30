//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by William Porto on 30/05/21.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .navigationTitle("Daily Scrums")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
