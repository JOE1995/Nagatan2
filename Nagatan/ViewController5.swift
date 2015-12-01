//
//  ViewController5.swift
//  Nagatan
//
//  Created by 矢吹祐真 on 2015/11/18.
//  Copyright © 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    
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
    
    //タッチ＆ドラッグで動かすラベルの宣言
    var object: UILabel!
    //object1の分身、動かない
    var object2: UILabel!
    
    //目標値を表示するためのラベルを宣言
    @IBOutlet var label: UILabel!
    
    //ランダムで出る目標値(Float)
    var goal: Float!
    
    //convertをデバイスによって変えるために、幅を取得
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width
    
    //pointをcmに変換するための変数
    var convert:Float!
    
    //ランダムで出る初期値(Float)
    var randx:Float!
    var randy:Float!
    
    //objectの位置の初期値を宣言
    var firstx:CGFloat!
    var firsty:CGFloat!
    
    //ラベルの位置をいれるためのFloat変数
    var startPoint: CGPoint?
    var LabelBeHereNowPoint: CGPoint?
    
    //Label内をタッチしたか判定する変数
    var isLabelInside: Bool?
    
    //目標値と結果値
    var before:Float!
    var after:Float = 0
    
    //誤差の変数(2の方が仮)
    var DifInCM:Float!
    var DifInCM2:Float!
    
    //ResultViewに受け渡す文字列
    var resultString:String!
    
    //タイマーでつかう整数とtimerの宣言
    var time:Int = 5
    var timer: NSTimer = NSTimer()
    
    //タイマー表示するためのラベルの宣言
    var timerLabel: UILabel!
    
    //プレイヤーラベルの宣言
    @IBOutlet var playerLabel: UILabel!
    
    //タッチした回数を数えるための整数を宣言
    var touchCount:Int = 0
    
    //プラスマイナスを指定する文字列を宣言
    var sign:String!
    
    //x座標を入れる変数を宣言(yは後で)
    var presentx:CGFloat!
    
    //このViewにいるか判定する変数
    var isThisView:Bool?
    
    //リトライするか判定する変数を宣言
    var haveRetried:Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(haveRetried)
        
        
        //このViewにいることを宣言
        isThisView = true
        
        //プレイヤー名をラベルに表示
        playerLabel.text = ("Player:\(playerArray[0])")
        
        // 目標値を設定
        //iPhone4s
        if height == 480 {
            goal = getRandomNumber(Min: 1.5, Max: 5)
            
            //iPhone5・5s・5c
        }else if height == 568 {
            goal = getRandomNumber(Min: 1.5, Max: 6)
            
            //iPhone6
        }else if height == 667 {
            goal = getRandomNumber(Min: 1.5, Max: 7)
            
            //iPhone6 Plus
        }else if height == 736 {
            goal = getRandomNumber(Min: 1.5, Max: 8)
            
            //iPad
        }else if height == 1024 {
            goal = getRandomNumber(Min: 1.5, Max: 10)
            
        } else{
            
        }
        
        //convertを設定
        if width == 320 && height == 667 {
            convert = 55.5
        } else if height == 736 && width == 414{
            convert = 58.8
        } else if height == 736 && width == 320{
            convert = 48.6
        } else if height == 736 && width == 375{
            convert = 55.5
        } else {
            convert = 62.5
        }
        
        //目標値を小数点第一位までの文字列に変換
        let str = NSString(format: "%.1f", goal)
        
        //str(目標値)をラベルに表示
        label.text = ("目標\(str)cm")
        
        //文字列strをFloatに再変換、beforeとする
        before = NSString(string: str).floatValue + 0.00
        print("before(目標):\(before)")
        
        //objectをランダムに配置するために、Floatをランダムに生成
        //iPhone4s
        if height == 480 {
            randx = getRandomNumber(Min: 30, Max: 260)
            randy = getRandomNumber(Min: 180, Max: 450)
            
            //iPhone5・5s・5c
        }else if height == 568 {
            randx = getRandomNumber(Min: 30, Max: 290)
            randy = getRandomNumber(Min: 180, Max: 508)
            
            //iPhone6
        }else if height == 667 {
            randx = getRandomNumber(Min: 30, Max: 325)
            randy = getRandomNumber(Min: 180, Max: 607)
            
            //iPhone6 Plus
        }else if height == 736 {
            randx = getRandomNumber(Min: 30, Max: 364)
            randy = getRandomNumber(Min: 180, Max: 676)
            
            //iPad
        }else if height == 1024 {
            randx = getRandomNumber(Min: 40, Max: 720)
            randy = getRandomNumber(Min: 300, Max: 960)
            
            
        } else{
            
        }
        
        //FloatをCGFloatに変換
        firstx = CGFloat(randx)
        firsty = CGFloat(randy)
        
        //＝＝＝＝＝＝＝＝＝object＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        //objectを生成
        object = UILabel(frame: CGRectMake(firstx, firsty, 50, 50))
        //object.text = "Drag!"
        object.font = UIFont.systemFontOfSize(8)
        object.textAlignment = NSTextAlignment.Center
        object.backgroundColor = UIColor.blackColor()
        object.layer.masksToBounds = true
        object.layer.cornerRadius = 25.0
        
        //objectをviewに追加.
        self.view.addSubview(object)
        
        //objectに影を追加
        putShadowOnView(object, shadowColor: UIColor(white: 1.0, alpha: 0.7), radius: 5.0, offset: CGSizeMake(4.0, 4.0), opacity: 0.5)
        
        //タッチ操作を enable
        object.userInteractionEnabled = true
        
        //＝＝＝＝＝＝＝＝＝object2＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        //object2を生成
        object2 = UILabel(frame: CGRectMake(firstx, firsty, 50, 50))
        //object2.text = "Drag!"
        object2.font = UIFont.systemFontOfSize(8)
        object2.textAlignment = NSTextAlignment.Center
        //        let lightred = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.6)
        //背景色を設定
        let lightBlack = UIColor.blackColor().colorWithAlphaComponent(0.5)
        object2.backgroundColor = lightBlack
        object2.layer.masksToBounds = true
        object2.layer.cornerRadius = 25.0
        
        //object2をviewに追加.
        self.view.addSubview(object2)
        
        //xの座標は現時点で、firstxと同じ
        presentx = firstx
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //他のページで反応しないためのif文
        if isThisView!{
            
            // タッチをやり始めた座標を取得
            let touch: UITouch! = touches.first
            startPoint = touch.locationInView(self.view)
            //println("startPoint =\(startPoint)")
            
            // タッチをやり始めた時のイメージの座標を取得
            LabelBeHereNowPoint = self.object.frame.origin
            //println("imageBeHereNowPoint =\(imageBeHereNowPoint)")
            
            let MinX = LabelBeHereNowPoint!.x
            let MaxX = LabelBeHereNowPoint!.x + self.object.frame.width
            let MinY = LabelBeHereNowPoint!.y
            let MaxY = LabelBeHereNowPoint!.y + self.object.frame.height
            
            // イメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if (MinX <= startPoint!.x && startPoint!.x <= MaxX) && (MinY <= startPoint!.y && startPoint!.y <= MaxY) {
                print("Inside of Image")
                isLabelInside = true
                
            } else {
                print("Outside of Image")
                isLabelInside = false
            }
            
            
            //Insideなら
            if isLabelInside!{
                
                //しかも初回なら、◯
                if touchCount == 0{
                    // Labelアニメーション.
                    UIView.animateWithDuration(0.06,
                        // アニメーション中の処理.
                        animations: { () -> Void in
                            // 縮小用アフィン行列を作成する.
                            self.object.transform = CGAffineTransformMakeScale(0.8, 0.8)
                            
                        })
                        { (Bool) -> Void in
                    }
                }
                    //２回目だったら、×
                else {
                    let alert = UIAlertController(title: "１度しか動かせません", message: "OKを押してください", preferredStyle: UIAlertControllerStyle.Alert)
                    if resultArray.count == numberOfPeople{
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt2()}))
                        presentViewController(alert, animated: true, completion:nil)
                    } else{
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt()}))
                        presentViewController(alert, animated: true, completion:nil)
                    }
                }
            }
                //そもそもOutsideだったら、どうでもいい、Don't care
            else {
                //print("Outside of Image")
            }
            
        }
    }
    
    //　ドラッグ時に呼ばれる
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if isThisView!{
            
            //Insideなら
            if isLabelInside! {
  
                // タッチイベントを取得
                let touchEvent = touches.first!
                
                // ドラッグ前の座標, Swift 1.2 から
                let preDx = touchEvent.previousLocationInView(self.view).x
                let preDy = touchEvent.previousLocationInView(self.view).y
                
                // ドラッグ後の座標
                let newDx = touchEvent.locationInView(self.view).x
                let newDy = touchEvent.locationInView(self.view).y
                
                // ドラッグしたx座標の移動距離
                let dx = newDx - preDx
                print("x:\(dx)")
                
                // ドラッグしたy座標の移動距離
                let dy = newDy - preDy
                print("y:\(dy)")
                
                // 画像のフレーム
                var viewFrame: CGRect = object.frame
                
                // 移動分を反映させる
                viewFrame.origin.x += dx
                viewFrame.origin.y += dy
                
                object.frame = viewFrame
                
                self.view.addSubview(object)

/*
                // タッチイベントを取得.
                let aTouch:UITouch = touches.first as UITouch!
                
                // 移動した先の座標を取得.
                let location = aTouch.locationInView(self.object)
                
                // 移動する前の座標を取得.
                let prevLocation = aTouch.previousLocationInView(self.object)
                
                // 画像のフレーム
                var viewFrame: CGRect = object.frame
                
                // ドラッグで移動したx, y距離をとる.
                let deltaX: CGFloat = location.x - prevLocation.x
                let deltaY: CGFloat = location.y - prevLocation.y
                
                // 移動した分の距離をmyFrameの座標にプラスする.
                viewFrame.origin.x += deltaX
                viewFrame.origin.y += deltaY
                
                
                object.frame = viewFrame
*/
                self.view.addSubview(object)
                putShadowOnView(object, shadowColor: UIColor(white: 1.0, alpha: 0.7), radius: 5.0, offset: CGSizeMake(4.0, 4.0), opacity: 1.0)
            }
            
            
        }
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if isThisView!{
            
            //Insideなら
            if isLabelInside!{
                
                print("yes")
                
                touchCount++
                
                // Labelアニメーション.
                UIView.animateWithDuration(0.1,
                    
                    // アニメーション中の処理.
                    animations: { () -> Void in
                        // 拡大用アフィン行列を作成する.
                        self.object.transform = CGAffineTransformMakeScale(0.4, 0.4)
                        // 縮小用アフィン行列を作成する.
                        self.object.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    })
                    { (Bool) -> Void in
                        
                }
                
                
                LabelBeHereNowPoint = self.object.frame.origin
                presentx = LabelBeHereNowPoint!.x
                let presenty = LabelBeHereNowPoint!.y
                
                //移動距離をCGFloatのdifとして取得
                let difx = presentx - firstx
                let dify = presenty - firsty
                
                //CGFloatのdifをFloatに変換
                let x = Float(difx)
                let y = Float(dify)
                
                //xとyをそれぞれ二乗し、それらの和を求める
                let sqx:Float = x * x
                let sqy:Float = y * y
                let sum:Float = sqx + sqy
                
                //計算結果用にFloatを宣言
                let result: Float!
                
                //和(sum)をルート処理
                result = safeSqrt(sum)
                //        print(result)
                
                //pointをcmに変換、resultInCM(結界値)とする
                let resultInCM:Float = result / convert
                
                //resultInCMを小数点第二位までの文字列に変換
                let str2 = NSString(format: "%.2f", resultInCM)
                print("\(str2)cm")
                //        resLabel.text = String("結果:\(res)cm")
                
                //文字列str2をFloatに再変換、afterとする
                after = NSString(string: str2).floatValue
                print("after(現実):\(after)")
                
                //最後の処理
                if before > after{
                    DifInCM2 = before - after
                    let str3 = NSString(format: "%.2f", DifInCM2)
                    DifInCM = NSString(string: str3).floatValue
                    
                } else {
                    DifInCM2 = after - before
                    let str3 = NSString(format: "%.2f", DifInCM2)
                    DifInCM = NSString(string: str3).floatValue
                }
                
                
                
                //resultStringにプラスかマイナスかまで記録(まだ使うか未定)
                let str = NSString(format: "%.2f", DifInCM)
                print("結果：\(str)cm差")
                if before > after{
                    resultString = "結果：-\(str)cm差"
                    sign = "−"
                } else if after > before {
                    resultString = "結果：+\(str)cm差"
                    sign = "+"
                } else if before == after{
                    resultString = "結果：\(str)cm差"
                    sign = ""
                } else {
                    
                }
                
                
                //超重要
                //リトライするか、どのSegueで遷移するか指定するif文
                //まずはこれが最終回かどうか
                if numberOfPeople == count{
                    //初回ならリトライするチャンスをあげる
                    if haveRetried == false{
                        //アラートを表示
                        let alertController = UIAlertController(title: "結果が検出されました", message: "１度だけリトライできます", preferredStyle: .Alert)
                        
                        //選択肢１を追加
                        alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToRetry()}))
                        
                        //選択肢２を追加
                        alertController.addAction(UIAlertAction(title: "Finish", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt2()}))
                        presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                        //2回もリトライはできない
                    else {
                        //他の画面でタップを検出しないように変更したうえで、画面遷移
                        isThisView = false
                        //trueになっているので、次の人のためにfalseに戻す
                        haveRetried = false
                        //アラートを表示
                        let alertController = UIAlertController(title: "結果が検出されました", message: "Okを押してください", preferredStyle: .Alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt2()}))
                        presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                }
                    //最終回ではない
                else {
                    //初回ならリトライするチャンスをあげる
                    if haveRetried == false{
                        //アラートを表示
                        let alertController = UIAlertController(title: "結果が検出されました", message: "１度だけリトライできます", preferredStyle: .Alert)
                        
                        //選択肢１を追加
                        alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToRetry()}))
                        
                        //選択肢２を追加
                        alertController.addAction(UIAlertAction(title: "Finish", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt()}))
                        presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                        //2回もリトライはできない
                    else {
                        //他の画面でタップを検出しないように変更したうえで、画面遷移
                        isThisView = false
                        
                        //trueになっているので、次の人のためにfalseに戻す
                        haveRetried = false
                        //アラートを表示
                        let alertController = UIAlertController(title: "結果が検出されました", message: "Okを押してください", preferredStyle: .Alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {action in self.performSegueToReslt()}))
                        presentViewController(alertController, animated: true, completion: nil)
                        
                        
                    }
                    
                }
            }
            
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResultView"{
            let resultView = segue.destinationViewController as! ResultViewController
            
            //プレイヤー数を受け渡す
            resultView.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            resultView.count = self.count
            
            //
            resultView.playerArray = self.playerArray
            
            //
            resultView.resultArray = self.resultArray
            
            //
            resultView.dict = self.dict
            
            //
            resultView.dict2 = self.dict2
            
            //
            resultView.haveRetried = self.haveRetried
            
            //使用しているiPhoneのサイズを受け渡す
            resultView.height = self.height
        }
        
        if segue.identifier == "toResultView2"{
            let resultView = segue.destinationViewController as! ResultViewController2
            
            //プレイヤー数を受け渡す
            resultView.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            resultView.count = self.count
            
            //
            resultView.playerArray = self.playerArray
            
            //
            resultView.resultArray = self.resultArray
            
            //
            resultView.dict = self.dict
            
            //
            resultView.dict2 = self.dict2
            
            //使用しているiPhoneのサイズを受け渡す
            resultView.height = self.height
            
        }
        
        if segue.identifier == "toRetry"{
            let resultView = segue.destinationViewController as! ViewController4
            
            //プレイヤー数を受け渡す
            resultView.numberOfPeople = self.numberOfPeople
            
            //countを受け渡す
            resultView.count = self.count
            
            //
            resultView.playerArray = self.playerArray
            
            //
            resultView.resultArray = self.resultArray
            
            //
            resultView.dict = self.dict
            
            //
            resultView.dict2 = self.dict2
            
            //
            resultView.haveRetried = self.haveRetried
            
            //使用しているiPhoneのサイズを受け渡す
            resultView.height = self.height
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ルート計算をするメソッド
    func safeSqrt(x: Float) -> Float? {
        return x < 0.0 ? nil : sqrt(x)
    }
    
    //ランダムにFloatを生成するメソッド
    func getRandomNumber(Min _Min : Float, Max _Max : Float)->Float {
        
        return ( Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX) ) *
            (_Max - _Min) + _Min
    }
    
    
    //UILabelに影をつけるメソッド
    func putShadowOnView(viewToWorkUpon:UILabel, shadowColor:UIColor, radius:CGFloat, offset:CGSize, opacity:Float)-> UILabel{
        
        var shadowFrame = CGRectZero // Modify this if needed
        shadowFrame.size.width = 0.0
        shadowFrame.size.height = 0.0
        shadowFrame.origin.x = 0.0
        shadowFrame.origin.y = 0.0
        
        let shadow = UILabel(frame: shadowFrame)//[[UIView alloc] initWithFrame:shadowFrame];
        shadow.userInteractionEnabled = false; // Modify this if needed
        shadow.layer.shadowColor = shadowColor.CGColor
        shadow.layer.shadowOffset = offset
        shadow.layer.shadowRadius = radius
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        shadow.layer.shadowOpacity = opacity
        viewToWorkUpon.superview?.insertSubview(shadow, belowSubview: viewToWorkUpon)
        shadow.addSubview(viewToWorkUpon)
        return shadow
    }
    
    //toResulViewセグエを呼び出すメソッド
    func performSegueToReslt(){
        
        //結果を配列と辞書に追加
        resultArray.append(DifInCM)
        dict[DifInCM] = "\(playerArray[0])"
        
        //もう用なしの現プレイヤーを配列から消去
        playerArray.removeFirst()
        //符号を追加
        dict2[DifInCM] = (sign)
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    //toResulViewセグエ2を呼び出すメソッド
    func performSegueToReslt2(){
        
        //結果を配列と辞書に追加
        resultArray.append(DifInCM)
        dict[DifInCM] = "\(playerArray[0])"
        
        //もう用なしの現プレイヤーを配列から消去
        playerArray.removeFirst()
        //符号を追加
        dict2[DifInCM] = (sign)
        performSegueWithIdentifier("toResultView2", sender: nil)
    }
    
    //toRetryセグエを呼び出すメソッド
    func performSegueToRetry(){
        
        //先ほどのタッチをなかったことにし、リトライすることを示す
        touchCount--
        haveRetried = true
        
        performSegueWithIdentifier("toRetry", sender: nil)
    }
}

