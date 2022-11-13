//
//  ContentView.swift
//  Shared
//
//  Created by T on 13/11/22.
//

import SwiftUI

struct Course: Hashable, Codable {
    // api data objects
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Course] = [] // to update every time the API data changes
    
    func fetchAPI(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php")
        else {
            return
        }
        // weak self = prevent memory leak
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // decode JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            // if error occurs
            catch {
                print(error)
                
            }
        }
        task.resume()
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
