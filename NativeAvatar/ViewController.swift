//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Станислав Соколов on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"person.crop.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .gray
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)

        
        navigationItem.title = "Avatar"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        scrollView.frame = CGRect(x: .zero, y: self.view.safeAreaInsets.top,
                                  width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createNavigationBar()
    }
    
    func createNavigationBar() {
        guard let largeNavView = navigationController?.navigationBar.subviews.first(where: { type(of: $0) == NSClassFromString("_UINavigationBarLargeTitleView") }) else {
            return
        }
        
        largeNavView.addSubview(imageView)
        
        let imageViewConstraints = [
            imageView.bottomAnchor.constraint(equalTo: largeNavView.bottomAnchor, constant: -10),
            imageView.trailingAnchor.constraint(equalTo: largeNavView.trailingAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.heightAnchor.constraint(equalToConstant: 36)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
    }

    
    
}

