//
//  ProfileView.swift
//  State-Binding
//
//  Created by عبدالله حافظ on 06/09/1446 AH.
//

import SwiftUI

struct ProfileView: View {
    @State private var toggle: Bool = false
    @State private var name: String = ""
    @State private var displayedName: String = "World"
    var body: some View {
        ZStack {
            toggle ? Color.gray.ignoresSafeArea(edges: .all) : Color.white.ignoresSafeArea(edges: .all)
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .foregroundColor(toggle ? .white : .black)
                Toggle("Background Color", isOn: $toggle)
                    .padding()
                    .toggleStyle(.switch)
                    .foregroundColor(toggle ? .white : .black)
                
                Text("Hello, \(displayedName)!")
                    .font(.headline)
                    .padding()
                    .foregroundColor(toggle ? .white : .black)
                
                EnterNameView(name: $name)
                    .padding()
                
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
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
