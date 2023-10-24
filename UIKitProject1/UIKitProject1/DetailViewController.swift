//
//  DetailViewController.swift
//  UIKitProject1
//
//  Created by AndrewLuo on 2023-10-14.
//

import UIKit

class DetailViewController: UIViewController {
    // why is optional, because we the view is loading, those variable is not exist
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageIndex: Int?
    var imageAmount: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        //title = selectedImage
        title = "Picture \(String(selectedImageIndex!)) of \(String(imageAmount!))"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad) //UIImage store image like png, jpg
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
