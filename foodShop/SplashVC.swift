//
//  ViewController.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import AVKit
import grpc

class SplashVC: UIViewController {
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer?.play()
        setUpElements()
        setUpVideo()
    }
    override func viewWillAppear(_ animated: Bool) {
        videoPlayer?.play()
        //Set up video in background
        setUpVideo()
    }

    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    func setUpVideo(){
        //Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "FoodIntro", ofType: "mp4")
        guard bundlePath != nil else {
            return
        }
        //Get a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        //Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width:
                                        self.view.frame.size.width*4, height:
                                            self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        //Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 1)
        videoPlayer?.isMuted = true
       
   
    }
}

