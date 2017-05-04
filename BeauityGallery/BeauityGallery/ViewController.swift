//
//  ViewController.swift
//  BeauityGallery
//
//  Created by l5ee on 2017/5/2.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit

class HWNavigationDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}

class HWTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    weak var transitionContext: UIViewControllerAnimatedTransitioning?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext as? UIViewControllerAnimatedTransitioning
        
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let button = fromVC.popBtn
        
        containerView.addSubview(toVC.view)
        
        let circleMaskPathInitial = UIBezierPath(ovalIn: (button?.frame)!)
        let extremePoint = CGPoint(x: (button?.center.x)! - 0, y: (button?.center.y)! - toVC.view.bounds.height)
        let radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        let circleMaskPathFinal = UIBezierPath(ovalInRect: (button?.frame)!.insetBy(dx: -radius, dy: -radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.cgPath
        toVC.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
        maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
        maskLayerAnimation.duration = self.transitionDuration(using: transitionContext)
        maskLayerAnimation.delegate = self as? CAAnimationDelegate
        maskLayer.add(maskLayerAnimation, forKey: "path")
    }
    
//    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        
//        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
//        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
//    }
   
}


class ViewController: UIViewController {

    @IBOutlet weak var popBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func popClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    


}

