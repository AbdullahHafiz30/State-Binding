//
//  EnterNameView.swift
//  State-Binding
//
//  Created by عبدالله حافظ on 06/09/1446 AH.
//

import SwiftUI

struct EnterNameView: View {
    @Binding var name: String  // Bound to parent's name variable

    var body: some View {
        TextField("Enter your name...", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
