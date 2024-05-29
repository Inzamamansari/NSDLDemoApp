//
//  ContentView.swift
//  NSDLDemoApp
//
//  Created by Inzimamul Ansari on 30/05/24.
//

import SwiftUI
import NSDLSwiftPackage

struct ContentView: View {
    @State private var email: String = "No email fetched yet"
    @State private var showingUserListView = false

    var body: some View {
        VStack {
            Spacer()
            Button(action: { showingUserListView = true }) {
                Text("Call Package")
            }
            .frame(width: 150, height: 50)
            .border(Color.black)
            .padding(.bottom, 100)
            Text(email)
                .frame(width: 200, height: 100)
                .border(Color.black)
                .padding(.bottom, 100)
        }
        .fullScreenCover(isPresented: $showingUserListView) {
            EmailListView { selectedEmail in
                self.email = selectedEmail
                self.showingUserListView = false
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
