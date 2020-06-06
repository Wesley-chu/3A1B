//
//  ViewController.swift
//  3A1B
//
//  Created by Chuweilun on 2017/5/28.
//  Copyright © 2017年 Chuweilun. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,Reset {
    //pickerView循環設定
    let number = ["0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9",
                  "0","1","2","3","4","5","6","7","8","9"
                  ]
    
    var passRecordCount = 0
    var passRecordW1 = 0
    var passRecordW2 = 0
    var passRecordW3 = 0
    var passRecordW4 = 0
    var passRecordW5 = 0
    var passRecordW6 = 0
    var passRecordW7 = 0
    var passRecordW8 = 0
    var passRecordW9 = 0
    var passRecordW10 = 0
    var passRecordL = 0
    
    //四ランダム
    var random1 = String(arc4random_uniform(10))
    var random2 = String(arc4random_uniform(10))
    var random3 = String(arc4random_uniform(10))
    var random4 = String(arc4random_uniform(10))
    //控制tableview
    @IBOutlet weak var TView: UITableView!
    //tableview內容組み合わせ
    var tableviewArray = [String]()
    //字母的內容，數字的內容，pickerview控制
    @IBOutlet weak var XAXB: UILabel!
    @IBOutlet weak var killMiss: UILabel!
    @IBOutlet weak var PickerOutput: UILabel!
    @IBOutlet weak var PickerViewo: UIPickerView!
    
    @IBOutlet weak var bannerView1: GADBannerView!
    
    func ResetRecord() {
        passRecordCount = 0
        passRecordW1 = 0
        passRecordW2 = 0
        passRecordW3 = 0
        passRecordW4 = 0
        passRecordW5 = 0
        passRecordW6 = 0
        passRecordW7 = 0
        passRecordW8 = 0
        passRecordW9 = 0
        passRecordW10 = 0
        passRecordL = 0
        saveRecord()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueRecord"{
            if let recordView = segue.destination as? RecordViewController{
                recordView.CountNumber = passRecordCount
                recordView.Win1 = passRecordW1
                recordView.Win2 = passRecordW2
                recordView.Win3 = passRecordW3
                recordView.Win4 = passRecordW4
                recordView.Win5 = passRecordW5
                recordView.Win6 = passRecordW6
                recordView.Win7 = passRecordW7
                recordView.Win8 = passRecordW8
                recordView.Win9 = passRecordW9
                recordView.Win10 = passRecordW10
                recordView.Lose = passRecordL
                recordView.delegate = self
            }
        }
    }
    
    @IBAction func reSet(_ sender: UIButton) {
        if tableviewArray == []{
        }else{
            passRecordCount += 1
            saveRecord()
            tableviewArray = []
            XAXB.text = "0A0B"
            PickerOutput.text = "0000"
            TView.reloadData()
            fourSelectRow()
            //重跑亂數
            randomNumber()
            saveList()
        }
    }
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func buttonPutout(_ sender: UIButton) {
        //滾輪的數字
        let N1 = PickerViewo.selectedRow(inComponent: 0)
        let N2 = PickerViewo.selectedRow(inComponent: 1)
        let N3 = PickerViewo.selectedRow(inComponent: 2)
        let N4 = PickerViewo.selectedRow(inComponent: 3)
        //Ａ的參數
        var number1A = 0
        var number2A = 0
        var number3A = 0
        var number4A = 0
        
        //Ｂ的參數
        var number1B = 0
        var number2B = 0
        var number3B = 0
        var number4B = 0
        //限制四亂數不得重複，若重複重設var亂數，若不重複跳過while
        while random1 == random2 || random1 == random3 || random1 == random4 || random2 == random3 || random2 == random4 || random3 == random4{
            random1 = String(arc4random_uniform(10))
            random2 = String(arc4random_uniform(10))
            random3 = String(arc4random_uniform(10))
            random4 = String(arc4random_uniform(10))
        }
        //儲存亂數
        randomSaveList()
        let RNumber = "\(random1)\(random2)\(random3)\(random4)"
        print(RNumber)
        
        
        //Ａ的集合
        if number[N1] == random1
        {number1A = 1}else{number1A = 0}
        if number[N2] == random2
        {number2A = 1}else{number2A = 0}
        if number[N3] == random3
        {number3A = 1}else{number3A = 0}
        if number[N4] == random4
        {number4A = 1}else{number4A = 0}
        
        //B的集合
        if number[N1] == random2 || number[N1] == random3 || number[N1] == random4{
            number1B = 1}else{number1B = 0}
        if number[N2] == random1 || number[N2] == random3 || number[N2] == random4{
            number2B = 1}else{number2B = 0}
        if number[N3] == random1 || number[N3] == random2 || number[N3] == random4{
            number3B = 1}else{number3B = 0}
        if number[N4] == random1 || number[N4] == random2 || number[N4] == random3{
            number4B = 1}else{number4B = 0}
        
        //符合條件就累加
        XAXB.text = "\(number1A + number2A + number3A + number4A)" + "A" + "\(number1B + number2B + number3B + number4B)" + "B"
        //消除ＢＵＧ用數據
        killMiss.text = "\(number1A + number2A + number3A + number4A)" + "A" + "\(number1B + number2B + number3B + number4B)" + "B"
        //儲存ＸＡＸＢ
        saveKillMiss()
        
        //限制四滾輪數字不得重複，若重複清空字母并跳出警告
        if number[N1] == number[N2] || number[N1] == number[N3] || number[N1] == number[N4] || number[N2] == number[N3] || number[N2] == number[N4] || number[N3] == number[N4]{
            XAXB.text = ""
            let myAlert = UIAlertController(title: "Warning!", message: "You should enter four different numbers!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            myAlert.addAction(okAction)
            present(myAlert, animated: true, completion: nil)
        }else{
            PickerOutput.text = "\(number[N1])\(number[N2])\(number[N3])\(number[N4])"
        }
        //新增到清單
        if let xAoBText = XAXB.text{
            if XAXB.text == ""{
            }else{
                if let outPutText = PickerOutput.text{
                    let outPutMixAB = "\(tableviewArray.count + 1) :" + "               " + "\(outPutText)" + "               " + "\(xAoBText)"
                    tableviewArray.append(outPutMixAB)
                    //更新tableView資料
                    let insertInfoAtThisIndexPath = IndexPath(row: tableviewArray.count - 1, section: 0)
                    TView.insertRows(at: [insertInfoAtThisIndexPath], with: .left)
                    //讓資料顯示最下行資料
                    //modi by zhu 20200606
                    TView.scrollToRow(at: insertInfoAtThisIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
                    //儲存清單
                    saveList()
                }
                //猜對，重置數據（一猜對跳出視窗，按下新遊戲重置）
                if XAXB.text == "4A0B"{
                    if tableviewArray.count == 1{passRecordW1 += 1}
                    else if tableviewArray.count == 2{passRecordW2 += 1}
                    else if tableviewArray.count == 3{passRecordW3 += 1}
                    else if tableviewArray.count == 4{passRecordW4 += 1}
                    else if tableviewArray.count == 5{passRecordW5 += 1}
                    else if tableviewArray.count == 6{passRecordW6 += 1}
                    else if tableviewArray.count == 7{passRecordW7 += 1}
                    else if tableviewArray.count == 8{passRecordW8 += 1}
                    else if tableviewArray.count == 9{passRecordW9 += 1}
                    else if tableviewArray.count == 10{passRecordW10 += 1}
                    saveRecord()
                    let winAlert = UIAlertController(title: "You Win !!", message: "answer : \(RNumber)", preferredStyle: .alert)
                    let newGameAction = UIAlertAction(title: "new game", style: .default, handler: {(UIAlertAction) in
                        self.tableviewArray = []
                        self.randomNumber()
                        self.XAXB.text = "0A0B"
                        self.PickerOutput.text = "0000"
                        self.TView.reloadData()
                        self.fourSelectRow()
                        
                    })
                    winAlert.addAction(newGameAction)
                    present(winAlert, animated: true, completion: nil)
                    
                    
                //猜錯，重置數據（一猜錯跳出視窗，按下新遊戲重置）
                }else if tableviewArray.count >= 10{
                    passRecordL += 1
                    saveRecord()
                    let loseAlert = UIAlertController(title: "You lose ...", message: "answer : \(RNumber)", preferredStyle: .alert)
                    let newGameAction2 = UIAlertAction(title: "new game", style: .default, handler: {(UIAlertAction) in
                        self.tableviewArray = []
                        self.randomNumber()
                        self.XAXB.text = "0A0B"
                        self.PickerOutput.text = "0000"
                        self.TView.reloadData()
                        self.fourSelectRow()
                   
                    })
                    loseAlert.addAction(newGameAction2)
                    present(loseAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    

    
    //讓滾輪居中的方法
    func fourSelectRow(){
        PickerViewo.selectRow((number.count)/2, inComponent: 0, animated: true)
        PickerViewo.selectRow((number.count)/2, inComponent: 1, animated: true)
        PickerViewo.selectRow((number.count)/2, inComponent: 2, animated: true)
        PickerViewo.selectRow((number.count)/2, inComponent: 3, animated: true)
    }
    //重跑亂數方法
    func randomNumber(){
        random1 = String(arc4random_uniform(10))
        random2 = String(arc4random_uniform(10))
        random3 = String(arc4random_uniform(10))
        random4 = String(arc4random_uniform(10))
    }
    //儲存陣列資料方法
    func saveList(){
        UserDefaults.standard.set(tableviewArray, forKey: "list")
        UserDefaults.standard.synchronize()
    }
    //讀取陣列資料方法
    func loadList(){
        if let okList = UserDefaults.standard.stringArray(forKey: "list"){
            tableviewArray = okList
        }
    }
    //儲存亂數方法
    func randomSaveList(){
        UserDefaults.standard.set(random1, forKey: "random1")
        UserDefaults.standard.set(random2, forKey: "random2")
        UserDefaults.standard.set(random3, forKey: "random3")
        UserDefaults.standard.set(random4, forKey: "random4")
        UserDefaults.standard.synchronize()
    }
    //讀取亂數方法
    func randomLoadList(){
        if let okRandom1 = UserDefaults.standard.string(forKey: "random1"){random1 = okRandom1}
        if let okRandom2 = UserDefaults.standard.string(forKey: "random2"){random2 = okRandom2}
        if let okRandom3 = UserDefaults.standard.string(forKey: "random3"){random3 = okRandom3}
        if let okRandom4 = UserDefaults.standard.string(forKey: "random4"){random4 = okRandom4}
    }
    
    func saveRecord(){
        UserDefaults.standard.set(passRecordW1, forKey: "W1")
        UserDefaults.standard.set(passRecordW2, forKey: "W2")
        UserDefaults.standard.set(passRecordW3, forKey: "W3")
        UserDefaults.standard.set(passRecordW4, forKey: "W4")
        UserDefaults.standard.set(passRecordW5, forKey: "W5")
        UserDefaults.standard.set(passRecordW6, forKey: "W6")
        UserDefaults.standard.set(passRecordW7, forKey: "W7")
        UserDefaults.standard.set(passRecordW8, forKey: "W8")
        UserDefaults.standard.set(passRecordW9, forKey: "W9")
        UserDefaults.standard.set(passRecordW10, forKey: "W10")
        UserDefaults.standard.set(passRecordL, forKey: "L")
        UserDefaults.standard.set(passRecordCount, forKey: "Count")
        UserDefaults.standard.synchronize()
    }
    
    func loadRecord(){
        passRecordW1 = UserDefaults.standard.integer(forKey: "W1")
        passRecordW2 = UserDefaults.standard.integer(forKey: "W2")
        passRecordW3 = UserDefaults.standard.integer(forKey: "W3")
        passRecordW4 = UserDefaults.standard.integer(forKey: "W4")
        passRecordW5 = UserDefaults.standard.integer(forKey: "W5")
        passRecordW6 = UserDefaults.standard.integer(forKey: "W6")
        passRecordW7 = UserDefaults.standard.integer(forKey: "W7")
        passRecordW8 = UserDefaults.standard.integer(forKey: "W8")
        passRecordW9 = UserDefaults.standard.integer(forKey: "W9")
        passRecordW10 = UserDefaults.standard.integer(forKey: "W10")
        passRecordL = UserDefaults.standard.integer(forKey: "L")
        passRecordCount = UserDefaults.standard.integer(forKey: "Count")
    }
    
    //tableview方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SpecialTableViewCell{
            cell.xAoBNumber.text = tableviewArray[indexPath.row]
            return cell
        }else{
            let cell = UITableViewCell()
            return cell
        }
    }
    
    
    
    
    //pickerview方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return number.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return number[row]
        
    }
    //儲存ＸＡＸＢ方法（除錯用）
    func saveKillMiss(){
        UserDefaults.standard.set(killMiss.text, forKey: "XAXB")
        UserDefaults.standard.synchronize()
    }
    //讀取ＸＡＸＢ資料（除錯用）
    func loadXAXB(){
        if let okLoadKillMiss = UserDefaults.standard.string(forKey: "XAXB"){
            killMiss.text = okLoadKillMiss
        }
    }
    //重設列表資料（除錯用）
    func reset(){
        if killMiss.text == "4A0B"{
            tableviewArray = []
            saveList()
            randomNumber()
        }else if tableviewArray.count == 10{
            tableviewArray = []
            saveList()
            randomNumber()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //滾輪置中
        fourSelectRow()
        //讀取陣列
        loadList()
        //讀取亂數
        randomLoadList()
        //讀取ＸＡＸＢ資料（除錯）
        loadXAXB()
        //讀取戰績
        loadRecord()
        //重設列表資料（除錯用）
        reset()
        
        DispatchQueue.global().async {
            self.bannerView1.adUnitID = "ca-app-pub-2739057954665163/4799088043"
            self.bannerView1.rootViewController = self
            self.bannerView1.load(GADRequest())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

