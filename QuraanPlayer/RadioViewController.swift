//
//  RadioViewController.swift
//  QuraanPlayer
//
//  Created by adol kazmy on 21/04/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVFoundation

class RadioViewController: UIViewController {
    
    var player : AVPlayer?
    
    @IBOutlet weak var stationLable: UILabel!
    @IBOutlet weak var PlayImage: UIButton!
    
    var StaionsURL = "http://api.mp3quran.net/radios/radio_arabic.json"
    var staionName = ""
    var url = ""
    var num = 0
    var isPlaying = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayImage.setImage(UIImage(named: "pause.png"), for: .normal)
        getAllRadios()
    }
    
    
    
    @IBAction func NextPressed(_ sender: Any) {
        if num < 119 {
        player?.pause()
        num += 1
        getAllRadios()
        }
        else {return}
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func PrevPressed(_ sender: Any) {
        if num > 0 {
               player?.pause()
               num -= 1
               getAllRadios()
               }
               else {return}
    }
    
    
    func loadRadio(radioURL: String ) {
        stationLable.text = staionName
        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player?.play()
    }
    
    
    
    
    
    func getAllRadios () {
        
        Alamofire.request(StaionsURL, method: .get).responseJSON {
            response in
            if response.error == nil {
                let resultJSON = JSON(response.value)
                //                print(resultJSON)
                self.radioNameAndURL(json: resultJSON)
                print("we are in")
                print("//////////////////////////////////////////////")
                print(self.staionName)
                self.loadRadio(radioURL: self.url)
            } else {
                print("connection issues")
            }
        }
        
    }
    func radioNameAndURL (json : JSON) {
        
        staionName = json["radios"][num]["name"].stringValue
        url = json["radios"][num]["radio_url"].stringValue
           }

    @IBAction func playPressed(_ sender: Any) {
          isPlaying = !isPlaying
        if isPlaying == false {
            PlayImage.setImage(UIImage(named: "play.png"), for: .normal)
            player?.pause()
        }
        if isPlaying == true {
            PlayImage.setImage(UIImage(named: "pause.png"), for: .normal)
            getAllRadios()
        }
        }
    
}
