//
//  PlayerVC.swift
//  QuraanPlayer
//
//  Created by adol kazmy on 24/03/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

//    override var prefersStatusBarHidden: Bool {
//      return true
//    }
    
    var theNumber : Int = 0
    var soraAraay = ["adel"]
    var isPlaying = true
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderMoving(_ sender: Any) {
        
        SoundPlayer.player.currentTime = TimeInterval(slider.value)
        SoundPlayer.player.play()
    }
    
   
    @IBOutlet weak var soraName: UILabel!
    @IBOutlet weak var playLable: UIButton!
    
    
    func nextNprev(){
        
        SoundPlayer.play(number: theNumber + 1 )
               soraName.text = soraAraay[theNumber]
//               playLable.setTitle("ايقاف", for: .normal)
            playLable.setImage(UIImage(named: "pause.png"), for: .normal)
                slider.maximumValue = Float(SoundPlayer.player.duration)
               slider.value = 0
        
    }
    @objc func timer() {
        
        slider.value = Float(SoundPlayer.player.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SoundPlayer.play(number: theNumber + 1)
        soraName.text =  soraAraay[theNumber]
        soraName.textColor = UIColor.white
        slider.maximumValue = Float(SoundPlayer.player.duration)
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayerVC.timer) , userInfo: nil, repeats: true)
        
    }
    
    

    @IBAction func PlayPressed(_ sender: Any) {
        
        
        isPlaying = !isPlaying
        
        if isPlaying {
          
            SoundPlayer.playAfterPause()
            playLable.setImage(UIImage(named: "pause.png"), for: .normal)
                       
         
            
        } else {
            
            playLable.setImage(UIImage(named: "play.png"), for: .normal)
                     
                     SoundPlayer.player.stop()
             
        }
    }
    
    @IBAction func prevPressed(_ sender: Any) {
        
         if theNumber < 1 { return}
         theNumber -= 1
    nextNprev()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if theNumber > 112 {return }
        theNumber += 1
       nextNprev()
        
    }
    
    
  
    @IBAction func backPressed(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
        SoundPlayer.player.stop()
        
    }
    

}
