//
//  ResultViewController2.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit
import Social
class ResultViewController2: UIViewController {
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝共通の変数＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    //プレイヤー数の宣言
    var numberOfPeople:Int!
    
    //何人目か数える変数の宣言
    var count:Int!
    
    //プレイヤーの名前を入れるための配列の宣言
    var playerArray = [AnyObject]()
    
    //前プレイヤーまでの結果が入った配列の宣言
    var resultArray:[Float] = []
    
    //前プレイヤーまでの結果とプレイヤー名が入った配列の宣言
    var dict = Dictionary<Float,String>()
    
    //前プレイヤーまでの結果とその結果の符号が入った配列の宣言
    var dict2 = Dictionary<Float,String>()
    
    //使用しているiPhoneのサイズ
    var height:CGFloat!
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    var firstPlayer:String!
    var secondPlayer:String!
    var thirdPlayer:String!
    var forthPlayer:String!
    var fifthPlayer:String!
    
    var firstSign:String! = ""
    var secondSign:String! = ""
    var thirdSign:String! = ""
    var forthSign:String! = ""
    var fifthSign:String! = ""
    
    var result1:Float!
    var result2:Float!
    var result3:Float!
    var result4:Float!
    var result5:Float!
    
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var label5:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(resultArray)
        print(dict)
        print(dict2)
        
        resultArray.sortInPlace { $0 < $1 }
        
        print(resultArray)
        
        if numberOfPeople == 5{
            result1 = resultArray[0]
            result2 = resultArray[1]
            result3 = resultArray[2]
            result4 = resultArray[3]
            result5 = resultArray[4]
            
            firstPlayer = dict[resultArray[0]]
            secondPlayer = dict[resultArray[1]]
            thirdPlayer = dict[resultArray[2]]
            forthPlayer = dict[resultArray[3]]
            fifthPlayer = dict[resultArray[4]]
            
            firstSign = dict2[resultArray[0]]
            secondSign = dict2[resultArray[1]]
            thirdSign = dict2[resultArray[2]]
            forthSign = dict2[resultArray[3]]
            fifthSign = dict2[resultArray[4]]
            
            label1.text = "１位:\(firstPlayer) \(firstSign)\(result1)cm差"
            label2.text = "２位:\(secondPlayer) \(secondSign)\(result2)cm差"
            label3.text = "３位:\(thirdPlayer) \(thirdSign)\(result3)cm差"
            label4.text = "４位:\(forthPlayer) \(forthSign)\(result4)cm差"
            label5.text = "５位:\(fifthPlayer) \(fifthSign)\(result5)cm差"
            
        } else if numberOfPeople == 4{
            result1 = resultArray[0]
            result2 = resultArray[1]
            result3 = resultArray[2]
            result4 = resultArray[3]
            
            firstPlayer = dict[resultArray[0]]
            secondPlayer = dict[resultArray[1]]
            thirdPlayer = dict[resultArray[2]]
            forthPlayer = dict[resultArray[3]]
            
            firstSign = dict2[resultArray[0]]
            secondSign = dict2[resultArray[1]]
            thirdSign = dict2[resultArray[2]]
            forthSign = dict2[resultArray[3]]
            
            label1.text = "１位:\(firstPlayer) \(firstSign)\(result1)cm差"
            label2.text = "２位:\(secondPlayer) \(secondSign)\(result2)cm差"
            label3.text = "３位:\(thirdPlayer) \(thirdSign)\(result3)cm差"
            label4.text = "４位:\(forthPlayer) \(forthSign)\(result4)cm差"
            label5.text = ""
            
        } else if numberOfPeople == 3{
            result1 = resultArray[0]
            result2 = resultArray[1]
            result3 = resultArray[2]
            
            firstPlayer = dict[resultArray[0]]
            secondPlayer = dict[resultArray[1]]
            thirdPlayer = dict[resultArray[2]]
            
            firstSign = dict2[resultArray[0]]
            secondSign = dict2[resultArray[1]]
            thirdSign = dict2[resultArray[2]]
            
            label1.text = "１位:\(firstPlayer) \(firstSign)\(result1)cm差"
            label2.text = "２位:\(secondPlayer) \(secondSign)\(result2)cm差"
            label3.text = "３位:\(thirdPlayer) \(thirdSign)\(result3)cm差"
            label4.text = ""
            label5.text = ""
            
        } else if numberOfPeople == 2{
            result1 = resultArray[0]
            result2 = resultArray[1]
            
            firstPlayer = dict[resultArray[0]]
            secondPlayer = dict[resultArray[1]]
            
            firstSign = dict2[resultArray[0]]
            secondSign = dict2[resultArray[1]]
            
            label1.text = "１位:\(firstPlayer) \(firstSign)\(result1)cm差"
            label2.text = "２位:\(secondPlayer) \(secondSign)\(result2)cm差"
            label3.text = ""
            label4.text = ""
            label5.text = ""
            
            
        } else {
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Facebook投稿メソッド
    @IBAction func postFacebook(sender: AnyObject) {
        //Facebook投稿用定数を作成
        let fbVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        //投稿テキストを設定
        fbVC.setInitialText("ながたん優勝は\(firstPlayer)さん! 結果\(firstSign)\(result1)cm差でした！おめでとうございます！")
        //投稿画像を設定
        fbVC.addImage(UIImage(named: "iconforupload.png"))
        //投稿コントローラーを起動
        self.presentViewController(fbVC, animated: true, completion: nil)
    }
    
    //Twitter投稿メソッド
    @IBAction func postTwitter(sender: AnyObject) {
        //Twitter投稿用定数を作成
        let twVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        //投稿テキストを設定
        twVC.setInitialText("ながたん優勝は\(firstPlayer)さん! 結果\(firstSign)\(result1)cm差でした！おめでとうございます！")
        //投稿画像を設定
        twVC.addImage(UIImage(named: "iconforupload.png"))
        //投稿コントローラーを起動
        self.presentViewController(twVC, animated: true, completion: nil)
    }
    
    
}

