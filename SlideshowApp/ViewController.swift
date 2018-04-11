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
        index = 0
        imageView.image = UIImage(named:"\(index+1).jpg")
        // ボタン無効化時の設定
        btnGoNext.setTitleColor(.lightGray, for: .disabled)
        btnGoBack.setTitleColor(.lightGray, for: .disabled)
        
        // 画像をタップ時の処理
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(enlargeImage(tapGestureRecognizer:)))
        imageView.addGestureRecognizer(tapGestureRecognizer)
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
            btnGoBack.isEnabled = false
            playAndStopButton.setTitle("停止", for: .normal)
        } else { //停止ボタンを押したときの処理
            self.timer.invalidate()
            self.timer = nil
            btnGoNext.isEnabled = true
            btnGoBack.isEnabled = true
            playAndStopButton.setTitle("再生", for: .normal)
        }
    }
    
    func stopAnimation() {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            btnGoNext.isEnabled = true
            btnGoBack.isEnabled = true
            playAndStopButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func startAnimation(timer: Timer) {
        handleNextImage(self)
    }
    
    @objc func enlargeImage(tapGestureRecognizer:UITapGestureRecognizer) {
        // アニメーションを停止する
        stopAnimation()
        
        let enlargedImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "EnlargedImage") as! EnlargedImageViewController
            //EnlargedImageViewController(nibName: nil, bundle: nil)
        //self.navigationController?.pushViewController(enlargedImageViewController, animated: true)
        enlargedImageViewController.image = images[index]
        self.present(enlargedImageViewController, animated: true, completion: nil)
    }
    
    // 他の画面からsegueを使って戻ってきたときに呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}

