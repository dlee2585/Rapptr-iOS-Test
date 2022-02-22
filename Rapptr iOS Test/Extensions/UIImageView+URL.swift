//
//  UIImageView+URL.swift
//  Rapptr iOS Test
//
//  Created by David Lee on 2/20/22.
//

import Foundation
import UIKit

extension UIImageView {
    /// setImage
    ///
    /// Asynchronously set the image of the imageView with a given url.
    func setImage(url: URL?) {
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let safeData = data, let image = UIImage(data: safeData) else {
                print("Failed to retrieve data while loading image")
                return
            }
            
            // Ensure UI Update is happening on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
