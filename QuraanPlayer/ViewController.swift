//
//  ViewController.swift
//  QuraanPlayer
//
//  Created by adol kazmy on 23/03/2020.
//  Copyright © 2020 Adel Kazme. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

//  override var prefersStatusBarHidden: Bool {
//    return true
//  }

    
    
    
    
    @IBOutlet weak var tableView: UITableView! { didSet { tableView.delegate = self ; tableView.dataSource = self }}

    var soraArray = [

     "الفاتحة"
            ,
     "البقرة"
     ,
     "آل عمران"
     ,
     "النساء"
     ,
     "المائدة"
     ,
    "الأنعام"
     ,
"الاعراف"
    ,
"الأنفال"
      ,
        "التوبة"
      ,
        "يونس"
      ,

        "هود"
      ,
        "يوسف"
      ,
        "الرعد"
      ,
        "إبراهيم"
      ,

        "الحجر"
      ,
        "النحل"
      ,
        "الإسراء"
      ,
        "الكهف"
      ,

        "مريم"
      ,
        "طه"
      ,
        "الأنبياء"
      ,
        "الحج"
      ,

      "المؤمنون"
      ,
      "النور"
      ,
      "الفرقان"
      ,
        "الشعراء"
      ,

        "النمل"
      ,
        "القصص"
      ,
        "العنكبوت"
      ,
        "الروم"
      ,

        "لقمان"
      ,
        "السجدة"
      ,
        "الأحزاب"
      ,
        "سبأ"
      ,

        "فاطر"
      ,
        "يس"
      ,
        "الصافات"
      ,
        "ص"
      ,

        "الزمر"
      ,
        "غافر"
      ,
        "فصلت"
      ,
        "الشورى"
      ,

        "الزخرف"
      ,
        "الدخان"
      ,
        "الجاثية"
      ,
        "الأحقاف"
      ,

        "محمد"
      ,
        "الفتح"
      ,
        "الحجرات"
      ,
        "ق"
      ,
        "الذاريات"
      ,
        "الطور"
      ,
        "النجم"
      ,
        "القمر"
      ,
        "الرحمن"
      ,
        "الواقعة"
      ,
        "الحديد"
      ,
        "المجادلة"
      ,
        "الحشر"
      ,
        "الممتحنة"
      ,
        "الصف"
      ,
        "الجمعة"
      ,
        "المنافقون"
      ,
        "التغابن"
      ,
        "الطلاق"
      ,
        "التحريم"
      ,

        "الملك"
      ,
        "القلم"
      ,
        "الحاقة"
      ,
        "المعارج"
      ,

        "نوح"
      ,
        "الجن"
      ,
        "المزمل"
      ,
        "المدثر"
      ,

        "القيامة"
      ,
        "الإنسان"
      ,
        "المرسلات"
      ,
        "النبأ"
      ,

        "النازعات"
      ,
        "عبس"
      ,
        "التكوير"
      ,
        "الانفطار"
      ,

        "المطففين"
      ,
        "الانشقاق"
      ,
        "البروج"
      ,
        "الطارق"
      ,

        "الأعلى"
      ,
        "الغاشية"
      ,
        "الفجر"
      ,
        "البلد"
      ,

        "الشمس"
      ,
        "الليل"
      ,
        "الضحى"
      ,
        "الشرح"
      ,

        "التين"
      ,
        "العلق"
      ,
        "القدر"
      ,
        "البينة"
      ,

        "الزلزلة"
      ,
        "العاديات"
      ,
        "القارعة"
      ,
        "التكاثر"
      ,
        "العصر"
      ,
        "الهمزة"
      ,
        "الفيل"
      ,
        "قريش"
      ,
        "الماعون"
      ,
        "الكوثر"
      ,
        "الكافرون"
      ,
        "النصر"
      ,
        "المسد"
      ,
        "الإخلاص"
      ,
        "الفلق"
      ,
        "الناس"
       
    ]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return soraArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyCell

        Cell.soraName.text = soraArray[indexPath.row]
        
        
        
  return Cell  }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        

  
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToPlayer", sender: indexPath.row)

    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVc = segue.destination as? PlayerVC {
            
            nextVc.theNumber = sender as! Int
            nextVc.soraAraay = soraArray
        }
        
        
    }
    
    

    
    
}



class MyCell : UITableViewCell {
    
    

    @IBOutlet weak var soraName: UILabel!
    
    
    


    
}






