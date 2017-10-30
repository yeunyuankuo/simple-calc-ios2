//
//  SecondViewController.swift
//  simple-calc
//
//  Created by Jessie Kuo on 28/10/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    public var history = [String]()
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var margin = 0
        for string in history {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width - 16), height: 35))
            label.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.1)
            label.font = UIFont.systemFont(ofSize: 16)
            label.text = string
            label.textAlignment = .center
            let screen = UIScreen.main.bounds.width - 16
            label.center = CGPoint(x: Int(screen/2), y: 35/2 + margin)
            scrollView.addSubview(label)
            margin = margin + 35 + 8
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
