//
//  ViewController.swift
//  SquaresNStuff
//
//  Created by James Campagno on 8/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var coverPhotoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        profileImageView.layer.borderWidth = 3.0
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
