# ProfileView Project

A SwiftUI view that demonstrates **State**, **Binding**, and **Toggle** usage for updating the background color and displaying a user's name.

## Features

1. **Toggle for Background Color**  
   - Allows switching between gray and white backgrounds.
   - Dynamically updates text color to remain visible on either background.

2. **User Input (Name)**  
   - Uses @State and @Binding to capture user input.
   - Displays a custom greeting message based on the name entered.

3. **Button to Update Displayed Name**  
   - Replaces the default "World" with the new name entered by the user.

## How It Works

1. **Toggle**  
   - The `@State private var toggle` property is bound to a `Toggle` component.
   - When the toggle is switched, the background color changes between white and gray, and the text color toggles between black and white accordingly.

2. **Name Entry**  
   - The `@State private var name` stores the user's input.
   - The `@Binding var name` in `EnterNameView` is connected to the `name` property in `ProfileView`, ensuring the input updates in real time.

3. **DisplayedName Update**  
   - The `@State private var displayedName` property is initially set to "World".
   - Pressing the **Update Name** button sets `displayedName` to the value of `name`, updating the greeting message.

## Code

```swift

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


```
# Usage
1. **Open Xcode** and create a new SwiftUI project (or add this file to an existing project).  
2. **Build and run** on the simulator or a real device.  
3. **Toggle** the background color and **enter a name** to see dynamic updates in real time.

## Requirements
- **Xcode**: Version 14 or higher (recommended)  
- **Swift**: Version 5.7 or higher (recommended)  
- **iOS**: Works on iOS 15 and above (adjust as needed)

## License
Feel free to use this code in any way you like. No attribution required.

