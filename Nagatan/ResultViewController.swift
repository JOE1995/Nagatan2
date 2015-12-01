//
//  ResultViewController.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
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
    
    //使用しているiPhoneのサイズ
    var height:CGFloat!
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    //リトライするか判定する変数を宣言
    var haveRetried:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dict)
        print(dict2)
        
        
        /*
        print(dict)
        for (key,val) in dict{
        print("dict[\(key)=\(val)]")
        }
        
        
        print(dict2)
        for (key,val) in dict2{
        print("dict2[\(key)=\(val)]")
        }
        */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toNext"{
            let View3 = segue.destinationViewController as! ViewController3
            
            //プレイヤー数を受け渡す
            View3.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            View3.count = self.count
            
            //
            View3.playerArray = self.playerArray
            
            //
            View3.resultArray = self.resultArray
            
            //
            View3.dict = self.dict
            
            //
            View3.dict2 = self.dict2
            
            //
            View3.haveRetried = self.haveRetried
            
            View3.height = self.height
        }
    }
    
    
    
}
