//
//  AppDelegate.swift
//  Test
//
//  Created by 邱耀辉 on 2023/3/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let _  = StructTest().count
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/// 弹窗等级
/// 控制弹窗显示顺序
/// eg：TL启动后的很多弹窗
/// 如需结束弹窗显示，window.windowLevel = .normal - 1 即可
enum AlertLevel: CGFloat {
    /// 弹窗显示结束
    case dismiss = -1.0
    /// 考试测验
    case examine = 1.0
    /// 语言内容
    case language = 2.0
    /// 版本更新
    case version = 3.0
    
    ///
    var windowLevel: UIWindow.Level {
        return .normal + rawValue
    }
}

private extension UIApplication {

    enum ThirdLoginPlatform {
        case unknow, mob, uMeng
    }
    
    enum Mob: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    enum UMeng: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    static let platform: ThirdLoginPlatform = .unknow
    
    static func setupMobPlatforms() {
        
    }
    
    static func setupUMengPlatforms() {
        
    }
}

enum AE {

    case ae
    
    func kj() {
        UIApplication.setupMobPlatforms()
    }
}

extension UIApplication {

    enum ThirdLoginType {
        case apple, google, facebook
    }
    
    static func setupThirdLogin() {
        switch platform {
        case .mob:
            setupMobPlatforms()
            
        case .uMeng:
            setupUMengPlatforms()
            
        default:
            break
        }
    }
    
    static func thirdLogin(_ type: ThirdLoginType) {
        switch platform {
        case .mob:
            break
            
        case .uMeng:
            break
            
        default:
            break
        }
    }
}
