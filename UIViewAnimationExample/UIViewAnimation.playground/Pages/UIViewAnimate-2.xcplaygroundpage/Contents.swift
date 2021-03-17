//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
contentView.layer.borderColor = UIColor.gray.cgColor
contentView.layer.borderWidth = 1.0
contentView.backgroundColor = .white


var box = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//box.center.x = contentView.center.x
box.backgroundColor = .systemRed
contentView.addSubview(box)

/*
 之前有談到UIView.animate的一些參數的作用
 還有兩個還沒說到
 usingSpringWithDamping:阻尼參數，0.0 ~ 1.0之間，越接近0就會產生相對有彈性的動畫，反之接近1動畫效果就會比較生硬、死板
 動畫到最後的位置時都會有一個彈跳的動作，數值越小搖晃會越緩和
 initialSpringVelocity:初始速度，動畫執行快慢由Velocity和Duratio共同決定，所以效果如何需要視實際執行狀況進行來調整
 
 這兩個參數後可以產生彈性動畫（Spring Animations）
 */
//UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.0, options: [.curveEaseInOut], animations: {
//
//    box.bounds.size = CGSize(width: box.frame.width * 2, height: box.frame.width * 2)
////    box.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)//縮放
//    box.center = contentView.center
//}, completion: {
//    animateSuccess in
//})

/*
 curveLinear:不針對動畫加速或減速
 */
//UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveLinear], animations: {
//    box.center.y += 250
//})


/*
 curveEaseIn:動畫開始時慢，結束時加速
 */
//UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveEaseIn], animations: {
//    box.center.y += 250
//})

/*
 curveEaseOut:動畫開始時加速，結束時慢
 */
//UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveEaseOut], animations: {
//    box.center.y += 250
//})

/*
 curveEaseInOut:動畫開始、結束時慢，中間變快
 */
//UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveEaseInOut], animations: {
//    box.center.x += 250
//})

//也可以複合使用
UIView.animate(withDuration: 1.5, delay: 0.0, options: [.curveLinear,.curveEaseInOut], animations: {
    box.center.x += 250
})


PlaygroundPage.current.liveView = contentView

//: [Next](@next)
