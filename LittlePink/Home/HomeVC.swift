//
//  HomeVC.swift
//  LittlePink
//
//  Created by 张玮 on 2022/3/10.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        settings.style.selectedBarBackgroundColor = UIColor(named:"main")!
        settings.style.selectedBarHeight = 3;
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemLeftRightMargin = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        super.viewDidLoad()
        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        DispatchQueue.main.async {
//            self.moveToViewController(at:1)
        }
    }
    
  
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let nearByVC = storyboard!.instantiateViewController(withIdentifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(withIdentifier: kDiscoveryVCID)
        return [discoveryVC,followVC,nearByVC]
    }
}
