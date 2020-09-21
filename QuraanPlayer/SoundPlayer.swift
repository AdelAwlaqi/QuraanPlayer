//
//  SoundPlayer.swift
//  QuraanPlayer
//
//  Created by adol kazmy on 24/03/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import Foundation
import AVFoundation



class SoundPlayer {
    
    
    static var player : AVAudioPlayer!
    static func play(number : Int) {
        
        let session = AVAudioSession.sharedInstance()
        let path = Bundle.main.path(forResource: String(number) + ".mp3", ofType: nil)!
       

        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            player = sound
            player.play()
        } catch  {
          func stop() {
               player.pause()
           }
        }
        
          do{
            try session.setCategory(AVAudioSession.Category.playback)
          }
          catch{
          }

          player.play()
    }
    
    
    static func playAfterPause() {
        
        player.play()
    }
    
    

    
}

