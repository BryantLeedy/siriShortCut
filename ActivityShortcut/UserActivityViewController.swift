//
//  UserActivityViewController.swift
//  IntentMacMini
//
//  Created by lidongyang on 2022/11/2.
//

import Foundation
import UIKit
import Intents

final class UserActivityViewController: UIViewController {

    private let userActivityProperty = NSUserActivity(activityType: "com.yuanfudao.dylee")

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupNSUserActivity()
        setupViews()
        setupIntents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

    }

    private func setupNSUserActivity() {
        userActivityProperty.isEligibleForSearch = true
        userActivityProperty.isEligibleForPrediction = true
        userActivityProperty.title = "拍照搜题"
        userActivityProperty.keywords = ["学习", "辅导", "抄作业"]
        self.userActivity = userActivityProperty
    }

    private func setupIntents() {
        let noTopic = CheckHomeworkIntent()
        print("===== Donate !!")
        noTopic.suggestedInvocationPhrase = "猎杀时刻"
        let interaction = INInteraction(intent: noTopic, response: nil)
        interaction.donate { error in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error)")
                }
            } else {
                print("Successfully donated interaction")
            }
        }
    }

    func setupViews() {
        let label = UILabel(frame: CGRect(x: 160, y: 200, width: 100, height: 50))
        label.text = "空页面"
        label.textColor = .white
        view.addSubview(label)
    }
}
