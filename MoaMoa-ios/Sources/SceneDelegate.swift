//
//  SceneDelegate.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

//    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.windowScene = windowScene
//        self.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
////        window?.rootViewController = ViewController()
//        window?.makeKeyAndVisible()
//    }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = TabBarViewController()
        UserDefaultManager.user = .init(nickName: "", gender: "", id: "'", password: "'", phoneNumber: "")
        if UserDefaultManager.user.nickName == "" {
            window?.rootViewController = UINavigationController(rootViewController: LoginViewController(viewModel: .init()))

        } else {
            window?.rootViewController = HomeViewController()
        }
        window?.makeKeyAndVisible()
    }



    func sceneDidDisconnect(_: UIScene) {}

    func sceneDidBecomeActive(_: UIScene) {}

    func sceneWillResignActive(_: UIScene) {}

    func sceneWillEnterForeground(_: UIScene) {}

    func sceneDidEnterBackground(_: UIScene) {}
}
