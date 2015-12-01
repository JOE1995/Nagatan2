//
//  ViewController.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let height:CGFloat = UIScreen.mainScreen().bounds.size.height
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView2"{
            let View2 = segue.destinationViewController as! ViewController2
            
            
            //使用しているiPhoneのサイズ
            View2.height = self.height
        }
        
        if segue.identifier == "toSingle"{
            let View = segue.destinationViewController as! SingleViewController
            
            //使用しているiPhoneのサイズ
            View.height = self.height
        }
        
        
    }
    
        
}

