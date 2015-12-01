//
//  ViewController3.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate{
    
    
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
    
    //TextFieldの宣言
    var myTextField: UITextField!
    
    //プレイヤー名の宣言
    var player:String! = ""
    
    //カウントラベルの宣言
    @IBOutlet var countLabel:UILabel!
    
    //決定ボタンの宣言
    @IBOutlet var ketteiButton: UIButton!
    
    //決定ボタン2(半透明)の宣言
    @IBOutlet var ketteiButton2: UIButton!
    
    //リトライするか判定する変数を宣言
    var haveRetried:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ここでhaveRetriedをfalseにすることで、nilを生まず判定を可能にする
        haveRetried = false
        
        //何人目カウントを＋１
        count = count + 1
        
        //ラベルに今何人目かを表示
        countLabel.text = "\(count)人目"
        
        //＝＝＝＝＝＝＝＝＝myTextField＝＝＝＝＝＝＝＝＝＝
        
        // UITextFieldを作成する.
        //iPhone4s
        if height == 480 {
            myTextField = UITextField(frame: CGRectMake(0,0,240,30))
            
            //iPhone5・5s・5c
        }else if height == 568 {
            myTextField = UITextField(frame: CGRectMake(0,0,240,50))
            
            //iPhone6
        }else if height == 667 {
            myTextField = UITextField(frame: CGRectMake(0,0,240,50))
            
            //iPhone6 Plus
        }else if height == 736 {
            myTextField = UITextField(frame: CGRectMake(0,0,240,50))
            
            //iPad
        }else if height == 1024 {
            myTextField = UITextField(frame: CGRectMake(0,0,360,50))
            
        } else{
            
        }
        
        
        // 表示する文字を代入する.
        //        myTextField.text = "Hello Swift!!"
        
        // Delegateを設定する.
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        //iPhone4s
        if height == 480 {
            myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:200);
            
            //iPhone5・5s・5c
        }else if height == 568 {
            myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:250);
            
            //iPhone6
        }else if height == 667 {
            myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:280);
            
            //iPhone6 Plus
        }else if height == 736 {
            myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:250);
            
            //iPad
        }else if height == 1024 {
            myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:450);
            
        } else{
            
        }
        
        
        //tagの設定
        myTextField.tag = 1
        
        //プレースホルダーに記載
        myTextField.placeholder = "Player名"
        
        //背景色を設定
        let lightWhite = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        myTextField.backgroundColor = lightWhite
        
        // Viewに追加する.
        self.view.addSubview(myTextField)
        
        //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        
        ketteiButton.hidden = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        //        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        
        //何も入力せず、改行を押したとき
        if textField.text == "" {
            
            
            //アラートを表示
            let alertController = UIAlertController(title: "Player名がありません", message: "入力してください", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
            //１回入力して、その後消去して空欄にされたとき対策
            ketteiButton.hidden = true
            ketteiButton2.hidden = false
            
            //何かしら入力されたとき
        } else {
            
            //プレイヤー名を文字列として登録
            player = ("\(textField.text!)")
            print("Player:\(player)")
            
            //プレイヤー名を配列に登録
            playerArray.append(player)
            
            
            //決定ボタンを表示
            ketteiButton.hidden = false
            ketteiButton2.hidden = true
            
        }
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView4"{
            let View4 = segue.destinationViewController as! ViewController4
            
            //プレイヤー数を受け渡す
            View4.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            View4.count = self.count
            
            //
            View4.playerArray = self.playerArray
            
            //
            View4.resultArray = self.resultArray
            
            //
            View4.dict = self.dict
            
            //
            View4.dict2 = self.dict2
            
            //
            View4.haveRetried = self.haveRetried
            
            //使用しているiPhoneのサイズを受け渡す
            View4.height = self.height
            
        }
    }
    
}