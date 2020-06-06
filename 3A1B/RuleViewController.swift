//
//  RuleViewController.swift
//  3A1B
//
//  Created by Chuweilun on 2017/6/24.
//  Copyright © 2017年 Chuweilun. All rights reserved.
//

import UIKit
import GoogleMobileAds

class RuleViewController: UIViewController {
    
    @IBOutlet weak var bannerView2: GADBannerView!
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
    }
   
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.bannerView2.adUnitID = "ca-app-pub-2739057954665163/4799088043"
            self.bannerView2.rootViewController = self
            self.bannerView2.load(GADRequest())
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
