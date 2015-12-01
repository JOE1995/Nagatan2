//
//  ViewController2.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //プレイヤー数の宣言
    var numberOfPeople:Int = 2
    
    //PickerViewで使う行の宣言
    var row:Int!
    
    // UIPickerViewを宣言
    var myUIPicker: UIPickerView!
    
    // 表示する値の配列
    let myValues: NSArray = ["２人","３人","４人","５人"]
    
    //何人目か数える変数の宣言
    var count:Int! = 0
    
    //使用しているiPhoneのサイズ
    var height:CGFloat!
    
    //Label"Player人数"
    var label:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myUIPicker = UIPickerView()
        
        // サイズを指定する.
        //iPhone4s
        if height == 480 {
            myUIPicker.frame = CGRectMake(40,130,self.view.bounds.width-80, 120)
            label = UILabel(frame: CGRectMake(55, 130, 100, 50))
            
            
            //iPhone5・5s・5c
        }else if height == 568 {
            myUIPicker.frame = CGRectMake(40,130,self.view.bounds.width-80, 170)
            label = UILabel(frame: CGRectMake(55, 130, 100, 50))
            
            //iPhone6
        }else if height == 667 {
            myUIPicker.frame = CGRectMake(40,130,self.view.bounds.width-80, 190)
            label = UILabel(frame: CGRectMake(55, 130, 100, 50))
            
            //iPhone6 Plus
        }else if height == 736 {
            myUIPicker.frame = CGRectMake(40,150,self.view.bounds.width-80, 210)
            label = UILabel(frame: CGRectMake(55, 150, 100, 50))
            
            //iPad
        }else if height == 1024 {
            myUIPicker.frame = CGRectMake(240,230,self.view.bounds.width-480, 200)
            label = UILabel(frame: CGRectMake(255, 230, 100, 50))
            
        } else{
            
        }
        
        label.text = "Player人数"
        
        myUIPicker.layer.cornerRadius = 25
        
        // Delegateを設定する.
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        //背景色を設定
        let lightWhite = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        myUIPicker.backgroundColor = lightWhite
        
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        self.view.addSubview(label)
        
    }
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }
    
    /*
    pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(myValues[row])")
        
        numberOfPeople = row + 2
        
        
    }
    
    @IBAction func next(){
        print("プレイヤー数:\(numberOfPeople)")
        performSegueToView3()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func performSegueToView3(){
        performSegueWithIdentifier("toView3", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView3"{
            let View3 = segue.destinationViewController as! ViewController3
            
            //プレイヤー数を受け渡す
            View3.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            View3.count = self.count
            
            //使用しているiPhoneのサイズを受け渡す
            View3.height = self.height
        }
    }
}
