//
//  ViewController.swift
//  snowflake3
//
//  Created by Emiko Clark on 1/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var NewYearLabel: UILabel!
    @IBOutlet weak var Label2018: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    var emitter1: CAEmitterLayer?
    var emitter2: CAEmitterLayer?
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NewYearLabel.alpha = 0
        Label2018.alpha = 0
        bgImage.alpha = 0
        playBackgroundMusic(filename: "Ed_Sheeran_ShapeOfYou.mp3")
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, animations: {
            self.bgImage.alpha = 1.0
        }) { (true) in
            self.showHappyNewYear()
        }
    }
    
    func showHappyNewYear() {
        UIView.animate(withDuration: 1, animations: {
            self.NewYearLabel.alpha = 1.0
        }, completion: { (true) in
            self.showYear()
        })
    }
    
    func showYear() {
        UIView.animate(withDuration: 1.0, animations: {
            self.Label2018.alpha = 1.0
            self.showSnowflake1()
        })
    }
    
    // fix: flake1 and flake 2 not showing unless stepping through code
    func showSnowflake1() {
        UIView.animate(withDuration: 5.0, animations: {
            self.emitter1 = Emitter.get(with: (UIImage(named: "snowflake1.png"))!, scale: 90, velocity: 1)
            self.emitter1?.emitterPosition = CGPoint(x: self.view.frame.width/2, y: -10)
            self.emitter1?.emitterSize = CGSize(width: self.view.frame.width, height: 1)
            self.self.view.layer.addSublayer(self.emitter1!)
            self.emitter1?.opacity = 1.0
            self.emitter1?.scale = 18
        }, completion: { (true) in
            self.showSnowflake2()
        })
    }

    func showSnowflake2() {
        UIView.animate(withDuration: 5.0, delay:10.0, animations: {
            self.emitter2 = Emitter.get(with: (UIImage(named: "snowflake2.png"))!, scale: 90, velocity: 1)
            self.emitter2?.emitterPosition = CGPoint(x: self.view.frame.width/2, y: -10)
            self.emitter2?.emitterSize = CGSize(width: self.view.frame.width, height: 1)
            self.self.view.layer.addSublayer(self.emitter2!)
            self.emitter2?.opacity = 1.0
            self.emitter2?.scale = 25
            
        }, completion: { (true) in
            // fade out snowFlake1
//            self.emitter1?.birthRate = 0
//            self.emitter1?.opacity = 0
        })
    }
    
    func playBackgroundMusic(filename: String) {
        if let soundURL = Bundle.main.url(forResource: "Ed_Sheeran_ShapeOfYou", withExtension: "mp3") {
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: soundURL)
                if let thePlayer = player {
                    thePlayer.prepareToPlay()
                    thePlayer.numberOfLoops = -1
                    thePlayer.play()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            playButton.setTitle("Pause", for: UIControlState.normal)
        } else {
            playButton.setTitle("Play", for: UIControlState.normal)
            player.play()
        }
    }

    @IBAction func repeatTapped(_ sender: UIButton) {
        playButton.setTitle("Play", for: UIControlState.normal)
        player.currentTime = 0
        player.play()
    }
    
}

//=============
////
////  ViewController.swift
////  snowflake3
////
////  Created by Emiko Clark on 1/5/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//import QuartzCore
//
//class ViewController: UIViewController {
//    @IBOutlet weak var view2: UIView!
//    @IBOutlet weak var landscape1: UIImageView!
//
//    @IBOutlet weak var view1: UIView!
//    @IBOutlet weak var landscape2: UIImageView!
//
//    @IBOutlet weak var NewYearLabel: UILabel!
//    @IBOutlet weak var Label2018: UILabel!
//
//    var emitter1: CAEmitterLayer?
//    var emitter2: CAEmitterLayer?
//    var emitter3: CAEmitterLayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // set up view1 and view2
//        landscape1.image = UIImage(named: "landscape.jpg")
//
//        landscape1.contentMode = .scaleAspectFill
//
//        landscape2.image = UIImage(named: "landscape.jpg")
//        landscape2.contentMode = .scaleAspectFill
//
//        // turn off alpha channels
//        view2.alpha = 0
//        NewYearLabel.alpha = 0
//        Label2018.alpha = 0
//        landscape1.alpha = 0
//        landscape2.alpha = 0
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        UIView.animate(withDuration: 1, animations: {
//            self.landscape1.alpha = 1.0
//        }) { (true) in
//            self.showHappyNewYear()
//            self.showSnowflake1()
//        }
//    }
//
//    func showHappyNewYear() {
//        UIView.animate(withDuration: 1, animations: {
//            self.NewYearLabel.alpha = 1.0
//        }, completion: { (true) in
//            self.showYear()
//            //            self.showSnowflake2()
//        })
//    }
//
//    func showYear() {
//        UIView.animate(withDuration: 1.0, animations: {
//            self.Label2018.alpha = 1.0
//        })
//    }
//
//    func showSnowflake1() {
//        UIView.animate(withDuration: 1.0, animations: {
//            self.emitter1 = Emitter.get(with: (UIImage(named: "snowflake1.jpg"))!, scale: 70, velocity: 100)
//            self.emitter1?.emitterPosition = CGPoint(x: self.view.frame.width/2, y: -10)
//            self.emitter1?.emitterSize = CGSize(width: self.view.frame.width, height: 1)
//            self.view1.layer.addSublayer(self.emitter1!)
//            self.emitter1?.opacity = 1.0
//        })
//    }
//
//    func showSnowflake2() {
//        UIView.animate(withDuration: 1.0, animations: {
//            self.emitter2 = Emitter.get(with: (UIImage(named: "snowflake3.jpg"))!, scale: 40, velocity: 50)
//            self.emitter2?.emitterPosition = CGPoint(x: self.view.frame.width/2, y: -10)
//            self.emitter2?.emitterSize = CGSize(width: self.view.frame.width, height: 1)
//            self.view2.alpha = 1.0
//            self.emitter2?.opacity = 1.0
//            self.landscape2.alpha = 1.0
//            self.view2.layer.addSublayer(self.emitter1!)
//            self.view2.layer.addSublayer(self.emitter2!)
//
//
//            UIView.transition(from: self.view1, to: self.view2, duration: 2, options: [.transitionCrossDissolve ], completion: { (true) in
//
//            })
//        }, completion: { (true) in
//            //            self.showSnowflake3()
//        })
//    }
//
//    func showSnowflake3() {
//        UIView.animate(withDuration: 5.0, animations: {
//            self.emitter3 = Emitter.get(with: (UIImage(named: "snowflake3.jpg"))!, scale: 15, velocity: 30)
//            self.emitter3?.emitterPosition = CGPoint(x: self.view.frame.width/2, y: -10)
//            self.emitter3?.emitterSize = CGSize(width: self.view.frame.width, height: 1)
//            self.view2.layer.addSublayer(self.emitter3!)
//            self.emitter3?.opacity = 1.0
//
//            UIView.transition(from: self.view, to: self.view2, duration: 2, options: [.transitionCrossDissolve ], completion: { (true) in
//                self.view2.layer.addSublayer(self.emitter1!)
//                self.view2.alpha = 1.0
//
//            })
//        })
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}

