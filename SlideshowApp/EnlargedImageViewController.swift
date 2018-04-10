//
//  EnlargedImageViewController.swift
//  SlideshowApp
//
//  Created by Toshi Fujita on 2018/04/09.
//  Copyright © 2018年 toshibo. All rights reserved.
//

import UIKit

class EnlargedImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画像をImageViewにセット
        imageView.image = self.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
