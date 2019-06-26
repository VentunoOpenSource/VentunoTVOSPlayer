//
//  ViewController.swift
//  sample
//
//  Created by Ventuno Technologies on 22/02/19.
//  Copyright © 2019 Ventuno Technologies. All rights reserved.
//

import UIKit
import AVKit
class ViewController: UIViewController{
    
    var player:AVPlayer?
    let playerController:AVPlayerViewController? = nil
    var playerItem:AVPlayerItem?
    var playerLayer:AVPlayerLayer?
    
    
    @IBOutlet weak var buttonName: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")
        let VideoAsset = AVAsset(url: url!)


        //let url = URL(string: "https://www.ventunotech.com/m3u8/index.m3u8?source=master&csmil=Viswasam_HD_6_Track__0U4T6CHZZ_r,256,512,1020,2048,4096,.mp4.csmil&sid=712d3f5c-5f93-4370-92fa-32ba84447208&cast=true&media=sample.m3u8")
        //let videoAsset:AVAsset = AVURLAsset(url: URL(string:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")!)
        
        
      //  let filePath = URL(fileURLWithPath: (("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")))
        //let videoAsset = AVURLAsset(url: filePath)
        
        self.player = AVPlayer(url: url!)
        let playerItem = self.player?.currentItem
       // playerController?.player = player
        player?.isClosedCaptionDisplayEnabled = true
       
        for characteristic in VideoAsset.availableMediaCharacteristicsWithMediaSelectionOptions{
            print("bngknbkfgnk \(characteristic)")
            
            // Retoprieve the AVMediaSelectionGroup for the specified characteristic.
            if let group = VideoAsset.mediaSelectionGroup(forMediaCharacteristic: characteristic) {
                // Print its options.
                for option in group.options {
                    print("  Option: \(option.displayName)")
                }
            }
        }
        
      playerItem!.externalMetadata = makeExternalMetadata()
        
        
    }
    
    func menuButtonAction(recognizer:UITapGestureRecognizer) {
    
    // Add any code here you want to run after the menu button pressed
    }
    func makeExternalMetadata() -> [AVMetadataItem] {
        var metadata = [AVMetadataItem]()
     
        let titleItem = metadataItem(AVMetadataIdentifier.commonIdentifierTitle.rawValue, value: "Videotitle")
        metadata.append(titleItem)
   
        if let image = UIImage(named: "ponting") {
            let artwork = AVMutableMetadataItem()
            artwork.key = AVMetadataKey.commonKeyArtwork as NSCopying & NSObjectProtocol
            artwork.keySpace = AVMetadataKeySpace.common
            artwork.value = image.pngData() as! NSCopying & NSObjectProtocol
            artwork.locale = NSLocale.current
            metadata.append(artwork)
        }
        
        let item1 = AVMutableMetadataItem()
        item1.locale = NSLocale.current
        item1.key = AVMetadataKey.commonKeyLanguage as NSCopying & NSObjectProtocol
        item1.keySpace = AVMetadataKeySpace.common
        item1.value = "Subtitles" as NSCopying & NSObjectProtocol;
        
        metadata.append(item1)
        
        
        let ratingItem =
            metadataItem(AVMetadataIdentifier.iTunesMetadataContentRating.rawValue, value: "3.3")
        metadata.append(ratingItem)
        
      
        let genreItem =
            metadataItem(AVMetadataIdentifier.quickTimeMetadataGenre.rawValue, value: "Comedy")
        metadata.append(genreItem)
        
        
        let descItem = metadataItem(AVMetadataIdentifier.commonIdentifierDescription.rawValue, value: "The original line was ,It's alive! It's alive! In the name of God! Now I know what it's like to be God! Censors cut Dr. Frankenstein's full line because it was considered sacrilege.")
        metadata.append(descItem)
        
        return metadata
    }
  
    func metadataItem(_ identifier: String, value: String?) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = AVMetadataIdentifier(rawValue: identifier)
        item.value = value as! NSCopying & NSObjectProtocol
        item.extendedLanguageTag = "und"
        
        return item.copy() as! AVMetadataItem

    }
    
  
    @IBAction func enterClicked(_ sender: Any) {
        // showAlert(status: "Correct!", title: "Whoo! That is the correct response")
       // print("enter")
       // buttonName.setTitleColor(UIColor.yellow, for: .normal)
        let controller1 = AVPlayerViewController()
            controller1.player = player
        present(controller1, animated: true)
        {
           self.player!.play()
        }
           
       /* let videoPlusSubtitles = AVMutableComposition()        //Adds subtitle track
        let subtitleAsset = AVURLAsset(url: Bundle.main.url(forResource: "English", withExtension: "srt")!)
        
        let subtitleTrack = videoPlusSubtitles.addMutableTrack(withMediaType: .text, preferredTrackID: Int32(kCMPersistentTrackID_Invalid))
        
        try? subtitleTrack?.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: self.player!.currentItem!.asset.duration),
                                            of: subtitleAsset.tracks(withMediaType: .text)[0],
                                            at: CMTime.zero)
        
        self.playerItem = AVPlayerItem.init(asset:  videoPlusSubtitles)
        self.playerObj = AVPlayer.init(playerItem: self.playerItem)
        self.playerController.player = self.playerObj
        self.playerItem?.addObserver(self, forKeyPath: Notification.Name.status.rawValue, options: NSKeyValueObservingOptions.new, context: nil)
        self.playerController.player!.play()
 */
 //if buttonName.isSelected == false {
            
            //  favorited(button: buttonName)
          //  }
        //}
        //else {
    
            // notFavorited(button: buttonName)
        //}
}
    
 
    @IBAction func exitClicked(_ sender: Any) {
        //guard let url = URL(string: "https://59299831b66d0.streamlock.net/ibc-comedy/smil:ibccomedy.smil/playlist.m3u8")
        //guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
       // guard let url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
       //     guard let url = URL(string: "https://www.ventunotech.com/m3u8/index.m3u8?source=master&csmil=Viswasam_HD_6_Track__0U4T6CHZZ_r,256,512,1020,2048,4096,.mp4.csmil&sid=096d77c8-7131-4998-81d6-b7cda9d57ffa&cast=true&media=sample.m3u8")
        //guard let url = URL(string: "http://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_1MG.mp3")
         //guard let url = URL(string: "http://38.96.148.226:6176/;stream.mp3")
        //    else{
        //return
        //}
        var player1 = AVAudioPlayer()
       let sound = Bundle.main.path(forResource: "audio", ofType: "mp3")
        let url = URL(fileURLWithPath: sound!)
        
        do {
        player1 =  try AVAudioPlayer(contentsOf: url)
            player1.play()
        }
        catch {
            print("can't load file")
            
        }
        /* player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        let playerItem = self.player?.currentItem
      //  playerItem!.externalMetadata = makeExternalMetadata()
        controller.allowedSubtitleOptionLanguages = [""]
        present(controller, animated: true)
        {
            self.player!.play()
        }
        */
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: Selector(("finishedPlaying:")), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    func finishedPlaying(myNotification:NSNotification) {
        let stopedPlayerItem: AVPlayerItem = myNotification.object as! AVPlayerItem
        stopedPlayerItem.seek(to: CMTime.zero)
    }

    func favorited(button: UIButton) {
        button.isSelected = true
        button.backgroundColor = UIColor.red
        buttonName.setTitle("enter clicked", for: .normal)
        
    }
    
    func notFavorited(button: UIButton) {
        button.isSelected = false
        button.backgroundColor = UIColor.red
        buttonName.setTitle("enter not clicked", for: .normal)
    }
    
  


    func showAlert(status: String, title:String) {
        let alertController = UIAlertController(title: status, message: title, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alertController.addAction(cancelAction)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        }
      alertController.addAction(ok)
        
      self.present(alertController, animated: true) {
        }
    }
    
    
    
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
    print("Swipe Right")
    }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
    print("Swipe Left")
    }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
    print("Swipe Up")
    }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
    print("Swipe Down")
    }
    }
    
    

}

