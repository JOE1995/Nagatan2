//
//  ViewController4.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController4: UIViewController {
    
    var playerViewController: AVPlayerViewController!
    
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝共通の変数＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    //プレイヤー数の宣言
    var numberOfPeople:Int!
    
    //何人目か数える変数の宣言
    var count:Int!
    
    //プレイヤーの名前を入れるための配列の宣言
    var playerArray:[String] = []
    
    //前プレイヤーまでの結果が入った配列の宣言
    var resultArray:[Float] = []
    
    //前プレイヤーまでの結果とプレイヤー名が入った配列の宣言
    var dict = Dictionary<Float,String>()
    
    //前プレイヤーまでの結果とその結果の符号が入った配列の宣言
    var dict2 = Dictionary<Float,String>()
    
    //リトライするか判定する変数を宣言
    var haveRetried:Bool!
    
    //使用しているiPhoneのサイズ
    var height:CGFloat!
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    var label:UILabel!
    
    var rect = CGRectMake(0, 0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アニメーション用の画像
        let image1 = UIImage(named:"demo1.png")!
        let image2 = UIImage(named:"demo2.png")!
        let image3 = UIImage(named:"demo3.png")!
        let image4 = UIImage(named:"demo4.png")!
        
        // UIImage の配列を作る
        var imageListArray :Array<UIImage> = []
        // UIImage 各要素を追加、ちょっと冗長的ですが...
        imageListArray.append(image1)
        imageListArray.append(image2)
        imageListArray.append(image3)
        imageListArray.append(image4)
        
        
        //iPhone4s
        if height == 480 {
            label = UILabel(frame: CGRectMake(66, 15, 188, 320))
            rect = CGRectMake(79, 36, view.bounds.width - 158, view.bounds.height - 192)
            
            //iPhone5・5s・5c
        }else if height == 568 {
            label = UILabel(frame: CGRectMake(40, 25, 240, 400))
            rect = CGRectMake(54, 36, view.bounds.width - 108, view.bounds.height - 192)
            
            //iPhone6
        }else if height == 667 {
            label = UILabel(frame: CGRectMake(40, 25, 295, 500))
            rect = CGRectMake(53, 36, view.bounds.width - 106, view.bounds.height - 192)
            
            //iPhone6 Plus
        }else if height == 736 {
            label = UILabel(frame: CGRectMake(40, 25, 335, 570))
            rect = CGRectMake(54, 36, view.bounds.width - 108, view.bounds.height - 192)
            
            //iPad
        }else if height == 1024 {
            label = UILabel(frame: CGRectMake(130, 40, 505, 870))
            rect = CGRectMake(150, 56, view.bounds.width - 300, view.bounds.height - 192)
            
        } else{
            
        }
        
        // UIImageView のインスタンス生成,ダミーでimage1を指定
        let imageView:UIImageView = UIImageView(image:image1)
        imageView.frame = rect
        
        // 画像の配列をアニメーションにセット
        imageView.animationImages = imageListArray
        
        // 1.5秒間隔
        imageView.animationDuration = 6
        // 3回繰り返し
        imageView.animationRepeatCount = 0
        // アニメーションを開始
        imageView.startAnimating()
        
        // view に追加する
        
        
        
        //let lightred = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.6)
        //背景色を設定
        let lightWhite = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        label.backgroundColor = lightWhite
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25.0
        
        //imageViewとobject2をviewを順番に追加.
        self.view.addSubview(label)
        self.view.addSubview(imageView)
        /*
        // 動画ファイルのURLを取得
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("Demo1", ofType: "mov")
        let url = NSURL(fileURLWithPath: path!)
        
        // アイテム取得
        let playerItem = AVPlayerItem(URL: url)
        
        // 生成
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // 設定
        //iPhone4s
        if height == 480 {
        playerViewController.view.frame = CGRectMake(79, 36, view.bounds.width - 158, view.bounds.height - 192)
        
        //iPhone5・5s・5c
        }else if height == 568 {
        playerViewController.view.frame = CGRectMake(54, 36, view.bounds.width - 108, view.bounds.height - 192)
        
        //iPhone6
        }else if height == 667 {
        playerViewController.view.frame = CGRectMake(53, 36, view.bounds.width - 106, view.bounds.height - 192)
        
        //iPhone6 Plus
        }else if height == 736 {
        playerViewController.view.frame = CGRectMake(54, 36, view.bounds.width - 108, view.bounds.height - 192)
        
        //iPad
        }else if height == 1024 {
        playerViewController.view.frame = CGRectMake(150, 56, view.bounds.width - 300, view.bounds.height - 192)
        
        } else{
        
        }
        playerViewController.showsPlaybackControls = false // 操作パネルを非表示にする場合はfalse
        playerViewController.videoGravity = AVLayerVideoGravityResizeAspect // 矩形にフィット
        
        // 通知登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didPlayerItemReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        // 表示
        view.addSubview(playerViewController.view)
        
        // 再生
        player.play()
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPlayerItemReachEnd(notification: NSNotification) {
        // リピート再生
        playerViewController.player!.seekToTime(kCMTimeZero)
        playerViewController.player!.play()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView5"{
            let View5 = segue.destinationViewController as! ViewController5
            
            //プレイヤー数を受け渡す
            View5.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            View5.count = self.count
            
            //
            View5.playerArray = self.playerArray
            
            //
            View5.resultArray = self.resultArray
            
            //
            View5.dict = self.dict
            
            //
            View5.dict2 = self.dict2
            
            //
            View5.haveRetried = self.haveRetried
            
            //使用しているiPhoneのサイズを受け渡す
            View5.height = self.height
            
        }
    }
    
    
}
