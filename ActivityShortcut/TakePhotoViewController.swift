//
//  TakePhotoViewController.swift
//  ActivityShortcut
//
//  Created by lidongyang on 2022/11/2.
//

import Foundation
import UIKit

final class TakePhotoViewController: UIViewController {

    private let jumpButton1 = UIButton()
    private let jumpButton2 = UIButton()
    private var isCamera = true

    init(isCamera: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.isCamera = isCamera
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setupViews()
    }

    func setupViews() {
        jumpButton1.isHidden = !isCamera
        jumpButton2.isHidden = isCamera
        view.addSubview(jumpButton1)
        view.addSubview(jumpButton2)
        [jumpButton1, jumpButton2].forEach { btn in
            btn.backgroundColor = .darkGray
        }
        jumpButton1.setTitle("拍照搜题", for: .normal)
        jumpButton2.setTitle("检查作业", for: .normal)
        jumpButton1.frame = CGRect(x: 150, y: 300, width: 100, height: 50)
        jumpButton2.frame = CGRect(x: 150, y: 300, width: 100, height: 50)
    }
}

