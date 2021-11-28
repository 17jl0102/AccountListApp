//
//  ViewController.swift
//  AccountListApp
//
//  Created by 角谷　悠平 on 2021/11/28.
//

import UIKit

class MainContainerViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    var currentViewController: UIViewController!
    var viewControllers: [UIViewController] = []
    
    var listViewController = "ListViewController"
    var searchViewController = "SearchViewController"
    var createViewController = "CreateViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            UIStoryboard(name: listViewController, bundle: nil).instantiateInitialViewController()!,
            UIStoryboard(name: searchViewController, bundle: nil).instantiateInitialViewController()!,
            UIStoryboard(name: createViewController, bundle: nil).instantiateInitialViewController()!
        ]
        
        let firstViewController = viewControllers[0]
        changeViewController(viewController: firstViewController)
    }

    func changeViewController(viewController: UIViewController) {
        addChild(viewController)
        viewController.didMove(toParent: self)
        currentViewController = viewController
        containerView.addSubview(viewController.view)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    @IBAction func listButtonDidTap(_ sender: UIButton) {
        if currentViewController != viewControllers[0] {
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParent()
            currentViewController.willMove(toParent: nil)
            changeViewController(viewController: viewControllers[0])
        }
    }
    
    @IBAction func searchButtonDidTap(_ sender: UIButton) {
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParent()
        currentViewController.willMove(toParent: nil)
        if currentViewController != viewControllers[1] {
            changeViewController(viewController: viewControllers[1])
        }
    }
    
    @IBAction func createButtonDidTap(_ sender: UIButton) {
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParent()
        currentViewController.willMove(toParent: nil)
        if currentViewController != viewControllers[2] {
            changeViewController(viewController: viewControllers[2])
        }
    }
}

