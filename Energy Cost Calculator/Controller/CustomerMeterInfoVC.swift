//
//  CustomerMeterInfoVC.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import UIKit

class CustomerMeterInfoVC: BaseVC {

   // ------------------------------------------------
   // MARK: outlets
   // ------------------------------------------------
      
    @IBOutlet weak var serviceTxtField: UITextField!
    @IBOutlet weak var currentMeterReadingtxtField: UITextField!
    @IBOutlet weak var submitbtn: UIButton!
    
    
   // ------------------------------------------------
   // MARK: variable
   // ------------------------------------------------
 

   // ------------------------------------------------
   // MARK: View life cycle method
   // ------------------------------------------------
   
   override func viewDidLoad() {
       super.viewDidLoad()
       submitbtn.layer.cornerRadius = 10
       submitbtn.layer.borderWidth = 0.5
       submitbtn.layer.borderColor = UIColor(hex: "#555555")?.cgColor
   }
   
   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
   }
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
   }

    // ------------------------------------------------
    // MARK: Custom method
    // ------------------------------------------------
    
    func validateRecord()-> Bool{
        if(serviceTxtField.text!.isEmpty){
            showTost(strMsg: "Serivce number is required.")
            return false
        }else if(serviceTxtField.text!.count != 10){
            showTost(strMsg: "Enter valid 10 digit serivce number.")
            return false
        }else if(currentMeterReadingtxtField.text!.isEmpty){
            showTost(strMsg: "Current meter reading is required.")
            return false
        }else{
            let meterInfoViewModel = MeterInfoViewModel()
            let arr = meterInfoViewModel.retrieveMeterInfoData(Int64(serviceTxtField.text!) ?? 0)
            if(arr.count > 0 && (arr.last?.currentMeterReading ?? 0) > (Int64(currentMeterReadingtxtField.text!) ?? 0)){
                showTost(strMsg: "Current meter reading should be greater than previous reading.")
                return false
            }
        }
        return true
    }
   
   // ------------------------------------------------
   // MARK: IBAction method
   // ------------------------------------------------
   
    @IBAction func submitbtntpd(_ sender: Any) {
        self.view.endEditing(true)
        if(validateRecord()){
            let meterInfoViewModel = MeterInfoViewModel()
            meterInfoViewModel.createMeterInfoData(Int64(serviceTxtField.text!) ?? 0, Int64(currentMeterReadingtxtField.text!) ?? 0)
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ConsumptionCostVC") as? ConsumptionCostVC{
                vc.serviceNumber = Int64(serviceTxtField.text!) ?? 0
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
           

}

