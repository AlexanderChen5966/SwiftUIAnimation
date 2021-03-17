//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport


/*
 UI的動畫有一些基本的變換
 像是位置移動、大小變化、顏色漸變、透明度、旋轉等等
 
 可以用在動畫上使用的屬性
 bounds frame center
 backgroundColor alpha
 transform
 */

let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
contentView.layer.borderColor = UIColor.gray.cgColor
contentView.layer.borderWidth = 1.0
contentView.backgroundColor = .white


var box = UIView(frame: CGRect(x: 0, y: 25, width: 50, height: 50))
box.backgroundColor = .systemRed
contentView.addSubview(box)

//UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear,.repeat,.autoreverse], animations: {
//
//}, completion: {
//    animateComplete in
//})

/*
 withDuration:動畫持續時間
 delay:動畫開始前的延遲時間
 options:定義動畫的變化形式，使用UIView.AnimationOptions
 animations:需要放入動畫的區塊
 completion:動畫執行完成
 */

//UIView位置移動
//UIView.animate(withDuration: 1.5) {
//    box.frame = box.frame.offsetBy(dx: 250, dy: 0)
////    box.frame.origin.x = 250
////    box.center.x += 250
//
//}


//UIView大小
//UIView.animate(withDuration: 1.5) {
//    box.frame.size = CGSize(width: box.frame.width * 1.5, height: box.frame.height * 1.5)
//}


//顏色變換
//UIView.animate(withDuration: 3.0) {
//    box.backgroundColor = .systemBlue
//}

//透明度
//UIView.animate(withDuration: 3.0) {
//    box.alpha = 0.3
////    box.layer.opacity = 0.3
//}

//變形
//UIView.animate(withDuration: 1.5) {
//    box.layer.cornerRadius = box.frame.width / 2
//}


//平移、縮放或旋轉UIView
//UIView.animate(withDuration: 1.5) {
////    box.transform = CGAffineTransform(rotationAngle: .pi)//旋轉
////    box.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)//縮放
//    box.transform = CGAffineTransform(translationX: 200, y: 0)//平移
//
//}

//複合式動畫
UIView.animate(withDuration: 3.0) {
    box.layer.cornerRadius = 25
    box.alpha = 0.5
    box.backgroundColor = .systemGreen
    box.center.x += 250
    box.transform = CGAffineTransform(rotationAngle: .pi)
    
}




PlaygroundPage.current.liveView = contentView

//: [Next](@next)
