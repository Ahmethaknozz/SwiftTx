//
//  ViewController.swift
//  textfieldpickerview
//
//  Created by ahmet hakan öz on 2.01.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var textfieldd: UITextField!
    
    var pickervieww:UIPickerView?
    
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["türkiye","almanya","israil","izlanda","isveç"]
        
        pickervieww = UIPickerView()  // PİCKERVİEWİ OLUSTURduk
        
        pickervieww?.delegate = self
        pickervieww?.dataSource = self
        
        textfieldd.inputView = pickervieww // textview e tikladigimizda acilmasi icin ekledik
        
        let dokunmaa = UITapGestureRecognizer(target: self, action: #selector(self.dokunma))
        view.addGestureRecognizer(dokunmaa)
        
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.green // RENK VERDİK
        toolbar.sizeToFit() // ekrana göre hizalanmasini yayılmasını saglar
        
        let tamambutton = UIBarButtonItem(title: "Taman", style: .plain, target: self, action: #selector(self.tamamtiklandi))
        
        let boslukbutton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptalbutton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(ViewController.iptaltiklandi))
        // 3 tane buton tanımladik simdi butonlari toolbara ekleyelim
        
        toolbar.setItems([iptalbutton,boslukbutton,tamambutton], animated: true) // eklendi
        
        textfieldd.inputAccessoryView = toolbar
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfieldd.text = ulkeler[row]
    }

    @objc func dokunma(){
        
        view.endEditing(true)
    }
    
    @objc func tamamtiklandi(){
        
        
        view.endEditing(true)
        
    }
    
    @objc func iptaltiklandi(){
        
        textfieldd.text = ""  // icini bosalt
        textfieldd.placeholder = "Ülke Seç..." // eski haline getir
        view.endEditing(true)
        
    }

}

