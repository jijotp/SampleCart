//
//  CustomeViewController.swift
//  TestAPP
//
//  Created by Arjun on 20/02/21.
//

import UIKit

class CustomeViewController: UIViewController {

    @IBOutlet weak var tapAction: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func tapAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("myNotification"), object: nil)
    }
}
