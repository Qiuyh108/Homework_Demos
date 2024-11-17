//
//  ViewController.swift
//  iOSOrientation
//
//  Created by 邱耀辉 on 2022/10/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let uiio: UIInterfaceOrientation?
        if #available(iOS 13.0, *) {
            uiio = view.window?.windowScene?.interfaceOrientation
        } else {
            uiio = UIApplication.shared.statusBarOrientation
        }
        switch uiio {
        case .portrait:
            switchToLandscapeRight(uiiom: .landscapeRight)
        case .landscapeRight, .landscapeLeft:
            switchToLandscapeRight(uiiom: .portrait)
        default:
            break
        }
        func switchToLandscapeRight(uiiom: UIInterfaceOrientationMask) {
            if #available(iOS 16.0, *) {
                view.window?.windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: uiiom), errorHandler: { error in
                    print("orientation error:", error)
                })
            } else {
                switch uiiom {
                case .portrait:
                    UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
                case .landscapeRight:
                    UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                default:
                    break
                }
            }
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(size, coordinator)
        let uiio: UIInterfaceOrientation?
        if #available(iOS 13.0, *) {
            uiio = view.window?.windowScene?.interfaceOrientation
        } else {
            uiio = UIApplication.shared.statusBarOrientation
        }
        switch uiio {
        case .portrait:
            print("竖屏转横屏")
        case .landscapeRight, .landscapeLeft:
            print("横屏转竖屏")
        default:
            break
        }
    }
}

extension UIViewController {
    
}
