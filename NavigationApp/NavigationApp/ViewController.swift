//
//  ViewController.swift
//  NavigationApp
//
//  Created by Victor Kimpel on 4.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    // Ссылка на сториборд, где размещен данный ViewController
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // перейти к зеленой сцене
    @IBAction func toGreenScene(_ sender: UIButton) {
        // получаем ссылку на следующий контроллер
        // в данном случае следующий - это зеленый
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "greenViewController")
        // обращаемся к Navigation Controller
        // и вызываем метод перехода к новому контроллеру
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // перейти к желтой сцене
    @IBAction func toYellowScene(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "yellowViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // перейти к корневой сцене
    @IBAction func toRootScene(_ sender: UIButton) {
        // обращаемся к NavigationController
        // и вызываем метод перехода к корневому контроллеру
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // перейти к предыдущему экрану
    @IBAction func toPreviousScene(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

