//
//  ContentView.swift
//  Shared
//
//  Created by T on 13/11/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    func fetchAPI(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php")
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                
            }.navigationTitle("Courses")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
