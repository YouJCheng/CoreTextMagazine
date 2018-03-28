//
//  ViewController.swift
//  CoreTextMagazine
//
//  Created by Yu-J.Cheng on 2018/3/27.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ctView: CTView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1
        guard let file = Bundle.main.path(forResource: "zombies", ofType: "txt") else { return }

        do {
            let text = try String(contentsOfFile: file, encoding: .utf8)
            // 2
            let parser = MarkupParser()
            parser.parseMarkup(text)
            (ctView)?.buildFrames(withAttrString: parser.attrString, andImages: parser.images)
        } catch _ {

        }
    }


}

