//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport
/*
 animateWithKeyFrames
 addKeyframe
 */
let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
contentView.layer.borderColor = UIColor.gray.cgColor
contentView.layer.borderWidth = 1.0
contentView.backgroundColor = .white


//var box = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//box.backgroundColor = .systemRed
//contentView.addSubview(box)

var button = UIButton()
button.frame.size = CGSize(width: 50, height: 50)
button.center = contentView.center
button.backgroundColor = .systemBlue
button.layer.cornerRadius = button.frame.height / 2
contentView.addSubview(button)

func animateWithUIView(){
    UIView.animate(withDuration: 0.25, delay: 1.0,animations: {
    //1.Expansion
        button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }) { (completed) in
        UIView.animate(withDuration: 0.25, animations: {
            //2.Shrink
            button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (completed) in
            UIView.animate(withDuration: 0.25, animations: {
                //3.Grant momentum
                button.frame.origin.x -= 16
            }) { (completed) in
                UIView.animate(withDuration: 0.25, animations: {
                    //4.Move out of screen and reduce alpha to 0
                    button.frame.origin.x = contentView.frame.size.width
                    button.alpha = 0.0
                }) { (completed) in
                    //Completion of whole animation sequence
                }
            }
        }
    }
}
//animateWithUIView()



func animateWithKeyFrames(){
    //Total animation duration is 1.0 seconds - This time is inside the
    UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, options: [], animations: {
        //withRelativeStartTime: 0 ~ 1 的相對時間
        //relativeDuration:relativeDuration 都是0.25就表示下列的四個動畫個佔總 總時長的1/4
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
            //1.Expansion + button label alpha
            button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
        UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
            //2.Shrink
            button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
        UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
            //3.Grant momentum
            button.frame.origin.x -= 16
        })
        UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
            //4.Move out of screen and reduce alpha to 0
            button.frame.origin.x = contentView.frame.size.width
            button.alpha = 0.0
        })
    }) { (completed) in
        //Completion of whole animation sequence
    }
}

animateWithKeyFrames()


//let view3 = UIView(frame: CGRect(x: contentView.center.x, y: 0, width: 30, height: 30))
//view3.layer.borderColor = UIColor.gray.cgColor
//view3.layer.borderWidth = 1.0
//view3.backgroundColor = .systemRed
//contentView.addSubview(view3)

//var p = view3.center
//let dur = 0.25
//var start = 0.0
//let dx: CGFloat = -100
//let dy: CGFloat = 50
//var dir: CGFloat = 1
//
//UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
//    UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
//    p.x += dx*dir
//    p.y += dy
//    view3.center = p
//  })
//  start += dur
//  dir *= -1
//  UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
//    p.x += dx*dir
//    p.y += dy
//    view3.center = p
//  })
//  start += dur
//  dir *= -1
//  UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
//    p.x += dx*dir
//    p.y += dy
//    view3.center = p
//  })
//  start += dur
//  dir *= -1
//  UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
//    p.x += dx*dir
//    p.y += dy
//    view3.center = p
//  })
//}, completion: nil)


//-------
//let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 600))
//contentView.layer.borderColor = UIColor.gray.cgColor
//contentView.layer.borderWidth = 1.0
//contentView.backgroundColor = .white
//
//
//var box = UIView(frame: CGRect(x: contentView.center.x - 25, y: contentView.center.y - 25, width: 50, height: 50))
//
//box.backgroundColor = .systemGreen
//contentView.addSubview(box)

//let start = button.center
//
//UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeCubic, animations: {
//    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
//        button.transform = CGAffineTransform(scaleX: 2, y: 2)
//    }
//
//    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
//        button.center = CGPoint(x: contentView.bounds.midX, y: contentView.bounds.maxY)
//    }
//
//    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
//        button.center = CGPoint(x: contentView.bounds.width, y: start.y)
//    }
//
//    UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
//        button.center = start
//    }
//})

PlaygroundPage.current.liveView = contentView
//PlaygroundPage.current.liveView = view3

//: [Next](@next)
