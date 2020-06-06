//
//  RecordViewController.swift
//  3A1B
//
//  Created by Chuweilun on 2017/6/30.
//  Copyright © 2017年 Chuweilun. All rights reserved.
//

import UIKit
import GoogleMobileAds

protocol Reset{
    func ResetRecord()
}

class RecordViewController: UIViewController {
    
    @IBOutlet weak var bannerView3: GADBannerView!
    @IBOutlet weak var bannerView4: GADBannerView!
    
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var totalPoint: UILabel!
    @IBOutlet weak var averagePoint: UILabel!
    @IBOutlet weak var recordWin1: UILabel!
    @IBOutlet weak var recordWin2: UILabel!
    @IBOutlet weak var recordWin3: UILabel!
    @IBOutlet weak var recordWin4: UILabel!
    @IBOutlet weak var recordWin5: UILabel!
    @IBOutlet weak var recordWin6: UILabel!
    @IBOutlet weak var recordWin7: UILabel!
    @IBOutlet weak var recordWin8: UILabel!
    @IBOutlet weak var recordWin9: UILabel!
    @IBOutlet weak var recordWin10: UILabel!
    @IBOutlet weak var recordLose: UILabel!
    var CountNumber = 0
    var Win1 = 0
    var Win2 = 0
    var Win3 = 0
    var Win4 = 0
    var Win5 = 0
    var Win6 = 0
    var Win7 = 0
    var Win8 = 0
    var Win9 = 0
    var Win10 = 0
    var Lose = 0
    
    
    
    var delegate:Reset?
    
    //歸零用資料
    func easyResetData(){
        CountNumber = 0
        Win1 = 0
        Win2 = 0
        Win3 = 0
        Win4 = 0
        Win5 = 0
        Win6 = 0
        Win7 = 0
        Win8 = 0
        Win9 = 0
        Win10 = 0
        Lose = 0
        
        let timesCount = CountNumber + Win1 + Win2 + Win3 + Win4 + Win5 + Win6 + Win7 + Win8 + Win9 + Win10 + Lose
        let totalPointCount = Win1 * 10 + Win2 * 9 + Win3 * 8 + Win4 * 7 + Win5 * 6 + Win6 * 5 + Win7 * 4 + Win8 * 3 + Win9 * 2 + Win10 * 1 - Lose * 1
        
        Count.text = " Times of guess :  \(timesCount)"
        totalPoint.text = " Total points :   \(totalPointCount)"
        recordWin1.text = "win1 :    \(Win1)"
        recordWin2.text = "win2 :    \(Win2)"
        recordWin3.text = "win3 :    \(Win3)"
        recordWin4.text = "win4 :    \(Win4)"
        recordWin5.text = "win5 :    \(Win5)"
        recordWin6.text = "win6 :    \(Win6)"
        recordWin7.text = "win7 :    \(Win7)"
        recordWin8.text = "win8 :    \(Win8)"
        recordWin9.text = "win9 :    \(Win9)"
        recordWin10.text = "win10 :  \(Win10)"
        recordLose.text = "Lose :    \(Lose)"
    }
    
    //設定若平均分數分母為零則為零
    func averagePointText(){
        
        let timesCount = CountNumber + Win1 + Win2 + Win3 + Win4 + Win5 + Win6 + Win7 + Win8 + Win9 + Win10 + Lose
        let totalPointCount = Win1 * 10 + Win2 * 9 + Win3 * 8 + Win4 * 7 + Win5 * 6 + Win6 * 5 + Win7 * 4 + Win8 * 3 + Win9 * 2 + Win10 * 1 - Lose * 1
        
        if timesCount == 0{
            averagePoint.text = " Average points :   \(0)"
        }else{
            averagePoint.text = " Average points :   \(Float(totalPointCount) / Float(timesCount))"
        }
    }

    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetRecordButton(_ sender: UIButton) {
        let isMyAlert = UIAlertController(title: "Warning", message: " You really want to clean ? ", preferredStyle: .alert)
        let isOkAction = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            self.delegate?.ResetRecord()
            self.easyResetData()
            self.averagePointText()
        }
        let isCancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        isMyAlert.addAction(isOkAction)
        isMyAlert.addAction(isCancelAction)
        present(isMyAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timesCount = CountNumber + Win1 + Win2 + Win3 + Win4 + Win5 + Win6 + Win7 + Win8 + Win9 + Win10 + Lose
        let totalPointCount = Win1 * 10 + Win2 * 9 + Win3 * 8 + Win4 * 7 + Win5 * 6 + Win6 * 5 + Win7 * 4 + Win8 * 3 + Win9 * 2 + Win10 * 1 - Lose * 1
        
        Count.text = " Times of guess :  \(timesCount)"
        totalPoint.text = " Total points :   \(totalPointCount)"
        
        //設定若平均分數分母為零則為零
        averagePointText()
        
        recordWin1.text = "win1 :    \(Win1)"
        recordWin2.text = "win2 :    \(Win2)"
        recordWin3.text = "win3 :    \(Win3)"
        recordWin4.text = "win4 :    \(Win4)"
        recordWin5.text = "win5 :    \(Win5)"
        recordWin6.text = "win6 :    \(Win6)"
        recordWin7.text = "win7 :    \(Win7)"
        recordWin8.text = "win8 :    \(Win8)"
        recordWin9.text = "win9 :    \(Win9)"
        recordWin10.text = "win10 :  \(Win10)"
        recordLose.text = "Lose :    \(Lose)"
        
        DispatchQueue.global().async {
            self.bannerView3.adUnitID = "ca-app-pub-2739057954665163/4799088043"
            self.bannerView3.rootViewController = self
            self.bannerView3.load(GADRequest())
            
            self.bannerView4.adUnitID = "ca-app-pub-2739057954665163/4799088043"
            self.bannerView4.rootViewController = self
            self.bannerView4.load(GADRequest())
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
