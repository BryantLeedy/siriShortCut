//
//  SceneDelegate.swift
//  ActivityShortcut
//
//  Created by lidongyang on 2022/11/2.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        continue userActivity: NSUserActivity
    ) {
        if (userActivity.activityType == "com.yuanfudao.dylee") {
            let vc = TakePhotoViewController(isCamera: true)
            let nav = window?.rootViewController as? UINavigationController
            if let nav = nav {
                nav.pushViewController(vc, animated: true)
            }
        } else if (userActivity.activityType == "CheckHomeworkIntent") {
            let vc = TakePhotoViewController(isCamera: false)
            let nav = window?.rootViewController as? UINavigationController
            if let nav = nav {
                nav.pushViewController(vc, animated: true)
            }
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let vc = UserActivityViewController(nibName: nil, bundle: nil)
            let nvc = UINavigationController(rootViewController: vc)
            window.rootViewController = nvc
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}

