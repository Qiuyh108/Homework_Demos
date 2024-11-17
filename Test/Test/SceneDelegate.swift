//
//  SceneDelegate.swift
//  Test
//
//  Created by 邱耀辉 on 2023/3/5.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        UIScene.scene(scene, willConnectTo: session, options: connectionOptions)
        
        UIApplication.setupThirdLogin()
        UIApplication.thirdLogin(.apple)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        UIScene.sceneDidDisconnect(scene)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        UIScene.sceneDidBecomeActive(scene)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        UIScene.sceneWillResignActive(scene)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        UIScene.sceneWillEnterForeground(scene)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        UIScene.sceneDidEnterBackground(scene)
    }
}

extension UIScene {
    ///
    static weak var delegateWindow: UIWindow?
    ///
    static var loginAuthWindow: UIWindow?
    ///
    static var timeInterval: TimeInterval = 0
    
    static func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let wsDelegate = scene.delegate as? UIWindowSceneDelegate, let window = wsDelegate.window else { return }
        delegateWindow = window
    }
    
    static func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    static func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    static func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    static func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    static func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
//        ThirdLogin.unknow.registerMobPlatforms()
//        ThirdLogin.unknow.registerUMengPlatforms()
    }
}

public enum ThirdLogin {

    case unknow, mob, uMeng
    
    func setup() {
        switch self {
        case .unknow:
            break
            
        case .mob:
            registerMobPlatforms()
            
        case .uMeng:
            registerUMengPlatforms()
        }
    }
    
    func login(_ type: ThirdLoginType, completion: ((Bool) -> Void)? = nil) {
        switch self {
        case .unknow:
            break
            
        case .mob:
            
            completion?(false)
            
        case .uMeng:
            completion?(false)
        }
    }
}

extension ThirdLogin {

    enum ThirdLoginType: Int {

        case apple, google, facebook
        
//    var mobPlatformType: MobPlatformType {
//        switch self {
//        case .apple:
//            <#code#>
//        case .google:
//            <#code#>
//        case .facebook:
//            <#code#>
//        }
//    }
        
//    var umengPlatformType: UMengPlatformType {
//        switch self {
//        case .apple:
//            <#code#>
//        case .google:
//            <#code#>
//        case .facebook:
//            <#code#>
//        }
//    }
    }
}

private extension ThirdLogin {

    enum Google: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    enum Facebook: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    enum Mob: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    private func registerMobPlatforms() {
        
    }
    
    enum UMeng: String {
        case appKey = "k"
        case appSecret = "s"
    }
    
    private func registerUMengPlatforms() {
        
    }
}
