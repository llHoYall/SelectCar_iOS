//
//  ViewController.swift
//  SelectCar_iOS
//
//  Created by hoya kim on 11/05/2018.
//  Copyright © 2018 ChameleoN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var carPickerView: UIPickerView!
	
	let car_company = ["Tesla", "Lamborghini", "Porsche"]
	
	var car_model = [String]()
	let tesla = ["Model S", "Model X"]
	let lamborghini = ["Aventador", "Veneno", "Huracan"]
	let porsche = ["911", "Boxter"]
	
	var car_image = [String]()
	let tesla_image = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
	let lamborghini_image = ["lamborghini-aventador.jpg", "lamborghini-veneno.jpg", "lamborghini-huracan.jpg"]
	let porsche_image = ["porsche-911.jpg", "porsche-boxter.jpg"]
 
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		car_model = lamborghini
		car_image = lamborghini_image
		
		carPickerView.selectRow(1, inComponent: 0, animated: false)
		carPickerView.selectRow(1, inComponent: 1, animated: false)
		
		imgView.layer.cornerRadius = 15.0
		imgView.layer.masksToBounds = true
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// UIPickerViewDataSource --------------------------------------------------//
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 2
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if component == 0 {
			return car_company.count
		} else {
			return car_model.count
		}
	}
	
	// UIPickerViewDelegate ----------------------------------------------------//
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == 0 {
			return car_company[row]
		} else {
			return car_model[row]
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if component == 0 {
			if row == 0 {
				car_model = tesla
				car_image = tesla_image
			} else if row == 1 {
				car_model = lamborghini
				car_image = lamborghini_image
			} else if row == 2{
				car_model = porsche
				car_image = porsche_image
			}
			pickerView.selectRow(0, inComponent: 1, animated: false)
		}
		pickerView.reloadAllComponents()
		imgView.image = UIImage(named: car_image[pickerView.selectedRow(inComponent: 1)])
	}
}
