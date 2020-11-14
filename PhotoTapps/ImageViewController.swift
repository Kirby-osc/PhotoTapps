//
//  ImageViewController.swift
//  PhotoTapps
//
//  Created by Дмитрий Мартьянов on 14.11.2020.
//

import UIKit

class ImageViewController: UIViewController {

    var photo: UIImage?
    @IBOutlet weak var imageVC: UIImageView!
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        //ActivityView позволяет выполнить действия над объектом вне приложения
        //activityItems - объект, надо котором должны быть выполнены действия в ActivityView
        let activityController = UIActivityViewController(activityItems: [photo!], applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { _, isSuccess,_, _ in
            if isSuccess{
                print("Success")
            }
            
        }
        
   present(activityController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        imageVC.image = photo
    }
    


}
