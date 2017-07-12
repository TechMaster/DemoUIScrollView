//
//  Nested.swift
//  DemoScrollView
//
//  Created by Tung on 7/12/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class Nested: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    var pageImages : [String] = []
    var photo : [UIImageView] = []
    var frontScrollViews : [UIScrollView] = []
    
    var first = false
    var test = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["dog_1","dog_2","dog_3","dog_4","dog_5"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count
        
        
    }
    override func viewDidLayoutSubviews() {
        if !first {
            first = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: 0)
            for i in 0 ..< pageImages.count
            {
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                imgView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
                imgView.contentMode = .scaleAspectFit
                
                photo.append(imgView)
                
                let frontScrollView = UIScrollView(frame: CGRect(x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
                frontScrollView.minimumZoomScale = 1
                frontScrollView.maximumZoomScale = 2
                frontScrollView.delegate = self
                frontScrollView.contentSize = imgView.bounds.size
                frontScrollView.addSubview(imgView)
                frontScrollViews.append(frontScrollView)
                self.scrollView.addSubview(frontScrollView)
            }
        }
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        return photo[pageController.currentPage]
    }
    @IBAction func pull(_ sender: Any) {
        scrollView.contentOffset = CGPoint(x: CGFloat(pageController.currentPage) * scrollView.frame.size.width, y: 0)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
        
    }
}
