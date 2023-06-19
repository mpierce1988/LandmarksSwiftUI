//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-19.
//

import SwiftUI

struct ProfileHost: View {
    // Create a variable named editMode that reflects the current 'editMode' state
    // from the environment
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    // add cancel button
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // EditButton controls the editMode environment variable
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        // when opening the profile editor, populate the draftProfile
                        // with values from the persistant profile
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        // when closing the profile editor, save the values from the
                        // draftProfile to the modelData
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    // even though this view doesn't use ModelData, the childview ProfileSummary does
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
