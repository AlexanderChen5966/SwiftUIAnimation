//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport
/*
 transition轉場效果
 */
let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
contentView.layer.borderColor = UIColor.gray.cgColor
contentView.layer.borderWidth = 1.0
contentView.backgroundColor = .white



let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
imageView.backgroundColor = .white
imageView.contentMode = .scaleAspectFit
imageView.center = CGPoint(x: contentView.center.x, y: contentView.center.y - 100)
imageView.image = #imageLiteral(resourceName: "plane.png")
//imageView.image = #imageLiteral(resourceName: "helicopter.png")

let imageView1 = UIImageView(frame: imageView.frame)
imageView1.backgroundColor = .white
imageView1.contentMode = .scaleAspectFit
imageView1.center = CGPoint(x: contentView.center.x, y: contentView.center.y - 100)
imageView1.image = #imageLiteral(resourceName: "helicopter.png")


let responder = Responser()

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
button.backgroundColor = .systemBlue
button.center = CGPoint(x: contentView.center.x, y: imageView.center.y + 50)
button.setTitle("請按我", for: .normal)
button.addTarget(responder, action: #selector(Responser.buttonEvent), for: .touchUpInside)
//
contentView.addSubview(imageView)
contentView.addSubview(button)

button.addAction(UIAction(title: "Click", handler: { _ in
    print("action Click")
}), for: .touchUpInside)


class Responser: NSObject
{
    var animateOption:UIView.AnimationOptions = []
    //Method to be called
    @objc func buttonEvent(sender:UIButton){
        animationEvent(animateOption: animateOption)
    }

    func animationEvent(animateOption:UIView.AnimationOptions) {
        if animateOption != .transitionCrossDissolve {
            /*
             這裡實作第一個方法
             transition(with view: UIView, duration: TimeInterval, options: UIViewAnimationOptions = [], animations: (() -> Swift.Void)?, completion: ((Bool) -> Swift.Void)? = nil)
             */

            UIView.transition(with: imageView, duration: 0.6, options: animateOption, animations: {
                if imageView.image == #imageLiteral(resourceName: "plane.png") {
                    imageView.image = #imageLiteral(resourceName: "helicopter.png")
                } else {
                    imageView.image = #imageLiteral(resourceName: "plane.png")
                }

            })

        } else {
            //transitionCrossDissolve在使用圖片交換的動畫上效果並不好，需要透過其他屬性的變換來協助動畫
            //這裡使用更改alpha透明度
            UIView.transition(with: imageView, duration: 0.6, options: animateOption, animations: {
                imageView.alpha = 0.0

            },completion: {
                _ in
                imageView.alpha = 1.0

                if imageView.image == #imageLiteral(resourceName: "plane.png") {
                    imageView.image = #imageLiteral(resourceName: "helicopter.png")
                } else {
                    imageView.image = #imageLiteral(resourceName: "plane.png")
                }

            })

        }

    }
}

/*
 UIView提供的過渡動畫有
 .transitionFlipFromLeft、.transitionFlipFromRight、.transitionFlipFromTop、.transitionFlipFromBottom、.transitionCurlUp、.transitionCurlDown、.transitionCrossDissolve
 */

//.transitionFlipFromLeft
//responder.animateOption = [.transitionFlipFromLeft]

//.transitionFlipFromLeft
//responder.animateOption = [.transitionFlipFromRight]

//.transitionFlipFromTop
//responder.animateOption = [.transitionFlipFromTop]

//.transitionFlipFromBottom
//responder.animateOption = [.transitionFlipFromBottom]

//.transitionCurlUp
//responder.animateOption = [.transitionCurlUp]

//.transitionCurlDown
responder.animateOption = [.transitionCurlDown]

//.transitionCrossDissolve
//responder.animateOption = [.transitionCrossDissolve]


/*
 這裡實作第二個方法
 transition(from fromView: UIView, to toView: UIView, duration: TimeInterval, options: UIViewAnimationOptions = [], completion: ((Bool) -> Swift.Void)? = nil)
 
 */

//DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//
//    UIView.transition(from: imageView, to: imageView1, duration: 0.6, options: .transitionCurlUp) { _ in
//        contentView.addSubview(imageView1)
//        imageView.removeFromSuperview()
//    }
//}


PlaygroundPage.current.liveView = contentView

//: [Next](@next)
