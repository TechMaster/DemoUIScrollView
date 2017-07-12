//
//  DisplaySerierPhoto.swift
//  DemoScrollView
//
//  Created by Minh Tuan on 7/11/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class DisplaySerierPhoto: UIViewController, UIScrollViewDelegate {
    var pageImage: [String] = []
    @IBOutlet weak var scorllView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImage = ["shop1-0", "shop1-1", "shop1-2", "shop1-3", "shop1-4", "shop1-5"]
        let pagesScrollViewSize = scorllView.frame.size
        scorllView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImage.count),height: 0)
        for i in 0 ..< pageImage.count{
            let imgView = UIImageView(image: UIImage(named: pageImage[i]+".jpg"))
            imgView.frame = CGRect(x: CGFloat(i) * scorllView.frame.size.width, y: 0, width: scorllView.frame.size.width, height: scorllView.frame.size.height)
            imgView.contentMode = .scaleAspectFit
            self.scorllView.addSubview(imgView)
        }

          }

   
}
