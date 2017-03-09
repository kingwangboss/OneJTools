//
//  ViewController.swift
//  表情键盘
//
//  Created by One'J on 16/4/14.
//  Copyright © 2016年 One'J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    // MARK:- 懒加载
    private lazy var emoticonVc : EmoticonViewController = EmoticonViewController {
        [weak self] (emoticon) -> () in
        self?.textView.insertEmoticon(emoticon)
        
    }

    @IBAction func sendItemClick(sender: AnyObject) {
        print(textView.getEmoticonString())
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.inputView = emoticonVc.view
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
    }

}


