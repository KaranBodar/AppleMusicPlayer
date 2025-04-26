//
//  APIService.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 23/04/25.
//

import Foundation
struct Songs: Codable {
    let title: String
    let artist: String
}

class APIService {
    static let shared = APIService()

    func uploadSong(_ song: Songs) {
        guard let url = URL(string: "http://localhost:8080/songs") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpBody = try? JSONEncoder().encode(song)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print("Uploaded: \(String(data: data, encoding: .utf8) ?? "")")
            } else if let error = error {
                print("Error: \(error)")
            }
        }.resume()
    }
}
