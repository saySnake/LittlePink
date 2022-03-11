//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by 张玮 on 2022/3/10.
//

import UIKit
import XLPagerTabStrip
class DiscoveryVC: ButtonBarPagerTabStripViewController ,IndicatorInfoProvider{

    override func viewDidLoad() {
        
        settings.style.selectedBarHeight = 0;
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        settings.style.buttonBarItemBackgroundColor = .clear

        super.viewDidLoad()

        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
    }
    
    var vcs : [UIViewController] = []
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        for channel in kChannels {
            let vc = storyboard!.instantiateViewController(withIdentifier: kWaterfallVCID) as! WaterfallVC
            vc.channel = channel
            vcs.append(vc)
        }
        return vcs
      
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "发现")
    }
}
