//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Joshua Hudson on 4/28/17.
//  Copyright © 2017 ParanoidPenguinProductions. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    var selectedImage: String?

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            
            imageView.image = UIImage(named: imageToLoad)
            
        }
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        
//        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(vc, animated: true)
        
        // Allow for sharing on Facebook
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            
            present(vc, animated: true)
        }
        
        // Aloow for sharing on Twitter
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            
            present(vc, animated: true)
        }
        
    }
    
}























