//
//  Basket.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class Basket : Codable {
    var sepet_yemek_id: Int?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_siparis_adet:Int?
    var kullanici_adi:String?
    

    init(){
        
    }
    
    init(sepet_yemek_id:Int,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:Int,kullanici_adi:String){
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }
}
