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
 動畫的初始化方式
 */
//1 runningPropertyAnimator會立即執行動畫不需要執行startAnimation()
//let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut) {
////    box.frame = box.frame.offsetBy(dx: 250, dy: 0)
////    box.frame.origin = CGPoint(x: 250, y: 25)
//    box.frame.origin.x = 230
//
//
//} completion: { (complete) in
//    print("動畫結束")
//}


//2 使用原生的UIKit的timing curve初始化的animator
//let animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear) {
//    box.frame.origin.x = 230
//}


//3 使用貝茲曲線timing curve初始化的animator
//let animator = UIViewPropertyAnimator(duration: 3.0, controlPoint1: CGPoint(x: 0.2, y:0.3 ), controlPoint2: CGPoint(x: 0.5, y: 0.1)) {
////    box.alpha = 0.0
//    box.frame.origin.x = 230
//}

//4 具彈跳效果的animator
//let animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.4) {
////    box.center = CGPoint(x: 250, y: 10)
//    box.frame.origin.x = 230
//}

//UITimingCurveProvider的potocol，有兩個類可供我們使用：UICubicTimingParameters和UISpringTimingParameters

//使用自定義timing curve初始化的animator
//5 使用timingParameters Type: UICubicTimingParameters
let cubicTimingParameters: UITimingCurveProvider = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.0, y: 1.0), controlPoint2: CGPoint(x: 1.0, y: 0.0))

//let animator = UIViewPropertyAnimator(duration: 4.0, timingParameters: cubicTimingParameters)
//animator.addAnimations {
//
////    box.center = CGPoint(x: 250, y: 10)
//    box.frame.origin.x = 230
//}


//6 使用timingParameters Type: UISpringTimingParameters
let springTimingParameters: UITimingCurveProvider = UISpringTimingParameters(dampingRatio: 0.5,initialVelocity: CGVector(dx:1.0, dy: 0.0))


let animator = UIViewPropertyAnimator(duration: 4.0, timingParameters: springTimingParameters)
animator.addAnimations {
    box.frame.origin.x = 230
}


animator.startAnimation()

//延遲執行
//animator.startAnimation(afterDelay:2.5)

PlaygroundPage.current.liveView = contentView
//PlaygroundPage.current.finishExecution()



//: [Next](@next)
