//
//  EditView.swift
//  Scrumdinger
//
//  Created by William Porto on 30/05/21.
//

import SwiftUI

struct EditView: View {
    @Binding var data: DailyScrum.Data
    @State private var newAttendee: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(data.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minues")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $data.color)
                    .accessibilityLabel(Text("Color Picker"))
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            data.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(data: .constant(DailyScrum.data[0].data))
    }
}
