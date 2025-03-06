//
//  ProfileView.swift
//  State-Binding
//
//  Created by عبدالله حافظ on 06/09/1446 AH.
//

import SwiftUI

struct ProfileView: View {
    @State private var toggle: Bool = false // this toggle is for the darmode function
    @State private var name: String = "" // empty string to fill the name later
    @State private var displayedName: String = "World" // the first string displayed is world just to mke look good
    var body: some View {
        // ZStack to put all the content inside
        ZStack {
            // this is where the toglle is used for changing background color
            toggle ? Color.gray.ignoresSafeArea(edges: .all) : Color.white.ignoresSafeArea(edges: .all) // here to make the safe area the same color
            // VStack to the content appear beneath each other
            VStack {
                // the main text shown on the top
                Text("Profile")
                    .font(.largeTitle)
                    .foregroundColor(toggle ? .white : .black) // this is to change the text color based on the background color
                
                // this is where we change the background color
                Toggle("Background Color", isOn: $toggle)
                    .padding()
                    .toggleStyle(.switch)
                    .foregroundColor(toggle ? .white : .black)
                Spacer()
                // here I show a text with name entered
                Text("Hello, \(displayedName)!")
                    .font(.headline)
                    .padding()
                    .foregroundColor(toggle ? .white : .black)
                // this view is for the user to put his name in it will save the entered name in name variable
                EnterNameView(name: $name)
                    .padding()
                
                // this button updates the name shown in the screen to the entered name
                Button(action: {
                    self.displayedName = self.name
                }) {
                    Text("Update Name")
                        .font(.headline)
                        .padding()
                        .cornerRadius(10)
                }
                .foregroundColor(toggle ? .black : .white)
                .background(toggle ? Color.white : Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
