//: [Previous](@previous)

import UIKit
import PlaygroundSupport



let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
contentView.layer.borderColor = UIColor.gray.cgColor
contentView.layer.borderWidth = 1.0
contentView.backgroundColor = .white


//var box = UIView(frame: CGRect(x: 0, y: 25, width: 50, height: 50))
var box = UIView(frame: CGRect(x: 0, y: contentView.bounds.height/2 - 25, width: 50, height: 50))

box.backgroundColor = .systemGreen
contentView.addSubview(box)

/*
 UIViewPropertyAnimator初始化後，想要加其他的動畫或是動畫是否完成的事件
 可以使用
 addAnimations增加其他動畫
 addCompletion取得動畫是否完成的事件
 continueAnimation增加其他timing curve
 */

let animator = UIViewPropertyAnimator(duration: 5.0, curve: .easeInOut) {
    box.frame.origin.x = 230
//    box.layer.cornerRadius = 25
//    box.alpha = 0.5
//    box.center.x += 200
//    box.transform = CGAffineTransform(rotationAngle: .pi)
}

animator.addAnimations {
//    box.backgroundColor = .systemRed
    box.alpha = 0.5
}

animator.addCompletion { _ in
    print("動畫執行完成")
}

animator.continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 0.5), durationFactor: 1)
//let springTimingParameters: UITimingCurveProvider = UISpringTimingParameters(dampingRatio: 0.5,initialVelocity: CGVector(dx:1.0, dy: 0.0))
//animator.continueAnimation(withTimingParameters: springTimingParameters, durationFactor: 1)
animator.startAnimation()

DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
    animator.isReversed = true
}

PlaygroundPage.current.liveView = contentView

//: [Next](@next)
