//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Станислав Соколов on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    var personBarButton: UIBarButtonItem = UIBarButtonItem()
    var rightButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        customTitleView.backgroundColor = .red
        navigationItem.titleView = customTitleView
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-10, for: .compactPrompt)

        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]

        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance


        self.title = "Avatar"
        navigationItem.title = "Avatar"

        self.navigationController?.navigationBar.prefersLargeTitles = true

        let rightButton = UIButton()
        let image = UIImage(named:"person.crop.circle.fill")
        rightButton.setImage(image, for: .normal)
        rightButton.imageView?.tintColor = .gray
    
        
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.tag = 1

        let targetView = self.navigationController?.navigationBar
        
        let trailingConstraint = NSLayoutConstraint(item: rightButton, attribute:
                .trailingMargin, relatedBy: .equal, toItem: targetView,
                                 attribute: .trailingMargin, multiplier: 1.0, constant: -16)
        
        let centerConstraint = NSLayoutConstraint(item: rightButton, attribute: .centerY, relatedBy: .equal, toItem: targetView, attribute: .centerY, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
                                            toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
        let heightConstraint = NSLayoutConstraint(item: rightButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 36)
        let aspectRation = NSLayoutConstraint(item: rightButton, attribute: .width, relatedBy: .equal, toItem: rightButton, attribute: .height, multiplier: 1, constant: 0)
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([trailingConstraint, bottomConstraint, heightConstraint, aspectRation])

            
        
        view.addSubview(scrollView)
        scrollView.frame = CGRect(x: .zero, y: view.safeAreaInsets.top,
                                  width: view.frame.width, height: view.frame.height)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        
        if let largeTitleView = findLargeTitleView(in: navigationController?.navigationBar) {
                    // Создаем новый UIView для добавления в качестве subview
            let customSubview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
                customSubview.backgroundColor = .red
                    
                // Добавляем новый UIView к _UINavigationBarLargeTitleView
                largeTitleView.addSubview(rightButton)
        }
        
        
   
    }
    
    private func showImage(_ show: Bool) {
      UIView.animate(withDuration: 0.4) {
        self.rightButton.alpha = show ? 1.0 : 0.0
      }
    }
    
    private func findLargeTitleView(in view: UIView?) -> UIView? {
        print(#function)
        if let view = view {
            if String(describing: type(of: view)) == "_UINavigationBarLargeTitleView" {
                return view
            }
            
            for subview in view.subviews {
                if let result = findLargeTitleView(in: subview) {
                    print(result)
                    return result
                }
            }
        }
        return nil
    }
    
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Получаем текущую позицию прокрутки
        let offsetY = scrollView.contentOffset.y
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
       if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
          navigationController?.setNavigationBarHidden(true, animated: true)

       } else {
          navigationController?.setNavigationBarHidden(false, animated: true)
       }
    }
}
