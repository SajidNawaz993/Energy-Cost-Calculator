//
//  ConsumptionCostVC.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import UIKit

class ConsumptionCostVC: BaseVC {

   // ------------------------------------------------
   // MARK: outlets
   // ------------------------------------------------
      
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var savebtn: UIButton!
    
    
   // ------------------------------------------------
   // MARK: variable
   // ------------------------------------------------
    
    var meterInfoArr:[MeterInfo] = []
    var serviceNumber:Int64 = 0

   // ------------------------------------------------
   // MARK: View life cycle method
   // ------------------------------------------------
   
   override func viewDidLoad() {
       super.viewDidLoad()
       savebtn.layer.cornerRadius = 10
       savebtn.layer.borderWidth = 0.5
       savebtn.layer.borderColor = UIColor(hex: "#555555")?.cgColor
       let meterInfoViewModel = MeterInfoViewModel()
       let arr = meterInfoViewModel.retrieveMeterInfoData(serviceNumber)
       if (arr.count > 3){
           meterInfoArr.append(contentsOf: arr.suffix(3))
       }else{
           meterInfoArr.append(contentsOf: arr)
       }
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
    
    func getTotalBill(_ totalReading:Int64)->Int64{
        var cost:Int64 = 0
        if(totalReading <= 100){
            cost = totalReading*5
        }else if(totalReading <= 500){
            cost = 100*5
            cost = cost + (totalReading-100)*8
        }else {
            cost = 100*5
            cost = cost + 400*8
            cost = cost + (totalReading-500)*100
        }
        return cost
    }
   
   // ------------------------------------------------
   // MARK: Delegate method
   // ------------------------------------------------
   
  
 
   
   // ------------------------------------------------
   // MARK: IBAction method
   // ------------------------------------------------
   
    @IBAction func savebtntpd(_ sender: Any) {
        let meterInfoViewModel = MeterInfoViewModel()
        let meterConsumptionCostHistoryViewModel = MeterConsumptionCostHistoryViewModel()
        let arr = meterInfoViewModel.retrieveMeterInfoData(serviceNumber)
        for index in 0..<arr.count{
            if(!arr[index].isRecordInConsumption){
                var totalreading:Int64 = 0
                if(index == 0){
                    totalreading = arr[index].currentMeterReading
                }else{
                    totalreading = arr[index].currentMeterReading - arr[index-1].currentMeterReading
                }
                meterConsumptionCostHistoryViewModel.createonsumptionCostHistoryData(arr[index].serviceNumber, arr[index].currentMeterReading, getTotalBill(totalreading))
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
  
   // ------------------------------------------------
   // MARK: Api Call method
   // ------------------------------------------------
           

}

// ------------------------------------------------
// MARK: TableView Delegate method
// ------------------------------------------------
extension ConsumptionCostVC: UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meterInfoArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CosumptionResultTableVIewCell
        cell.upperView.layer.borderColor = UIColor(hex: "#555555")?.cgColor
        cell.upperView.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 5
        if(indexPath.row == 0){
            let totalreading = meterInfoArr[indexPath.row].currentMeterReading
            cell.consumptionCostlbl.text = "Total Reading:\(totalreading)\nTotal Bill:\(getTotalBill(totalreading))"
        }else{
            let totalreading = meterInfoArr[indexPath.row].currentMeterReading - meterInfoArr[indexPath.row-1].currentMeterReading
            cell.consumptionCostlbl.text = "Total Reading:\(totalreading)\nTotal Bill:\(getTotalBill(totalreading))"
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}


