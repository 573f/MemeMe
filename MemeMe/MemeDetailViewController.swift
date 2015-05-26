//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Stephen Skubik-Peplaski on 5/25/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = meme.memedImage
    }
}
