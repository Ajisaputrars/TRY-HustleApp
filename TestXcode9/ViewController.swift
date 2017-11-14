//
//  ViewController.swift
//  TestXcode9
//
//  Created by Aji Saputra Raka Siwi on 11/13/17.
//  Copyright © 2017 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparingPlayerToPlay()
    }
    
    @IBAction func powerButtonPressed(_ sender: UIButton) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = false
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 233, height: 209)
        }) { (finished) in
            self.onLbl.isHidden = false
            self.hustleLbl.isHidden = false
        }
    }
    
    func preparingPlayerToPlay(){
        let path = Bundle.main.path(forResource: "hustle-ons", ofType: "wav")!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let err as NSError{
            print("Errornya di sini nich\(err.description)")
        }

    }
}
