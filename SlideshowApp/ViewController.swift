//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Toshi Fujita on 2018/04/09.
//  Copyright © 2018年 toshibo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnGoNext: UIButton!
    @IBOutlet weak var btnGoBack: UIButton!
    @IBOutlet weak var playAndStopButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var images:[UIImage] = []
    var index:Int = 0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImages()
        
        // 初期画像のセット
        imageView.image = UIImage(named:"\(index+1).jpg")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setImages() {
        // 初期画像を配列にセット
        while index < 6 {
            images.append(UIImage(named:"\(index+1).jpg")!)
            imageView.animationImages = images
            index += 1
        }
        index = 0
    }
    @IBAction func handleNextImage(_ sender: Any) {
        index += 1
        if index >= images.count {
            index = 0
        }
        imageView.image = images[index]
    }
    @IBAction func handlePreviousImage(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = images.count - 1
        }
        imageView.image = images[index]
    }
    @IBAction func handlePlayAndStopButton(_ sender: Any) {
        if self.timer == nil { //再生ボタンを押したときの処理
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
            btnGoNext.isEnabled = false
            
            playAndStopButton.setTitle("停止", for: .normal)
        } else { //停止ボタンを押したときの処理
            self.timer.invalidate()
            self.timer = nil
            playAndStopButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func startAnimation(timer: Timer) {
        handleNextImage(self)
    }
}

