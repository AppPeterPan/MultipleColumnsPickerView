//
//  ViewController.swift
//  Demo
//
//  Created by Peter Pan on 2022/8/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var districtPickerView: UIPickerView!
    @IBOutlet weak var districtLabel: UILabel!
    let cities = City.data

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let cityRow = districtPickerView.selectedRow(inComponent: 0)
        let districtRow = districtPickerView.selectedRow(inComponent: 1)
        let message = "\(cities[cityRow].name)\(cities[cityRow].districts[districtRow].name)"
        let alertController = UIAlertController(title: "我想搬到", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return cities.count
        } else {
            let cityRow = pickerView.selectedRow(inComponent: 0)
            return cities[cityRow].districts.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return cities[row].name
        } else {
            let cityRow = pickerView.selectedRow(inComponent: 0)
            return cities[cityRow].districts[row].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
        let cityRow = pickerView.selectedRow(inComponent: 0)
        let districtRow = pickerView.selectedRow(inComponent: 1)
        districtLabel.text = "\(cities[cityRow].name)\(cities[cityRow].districts[districtRow].name)"
    }
    
    
}
