//
//  NestViewController.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2019/1/3.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class NestViewController: UIViewController {
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let segmentedView = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(parentVC: self, delegate: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        let totalItemWidth: CGFloat = 150
        let titles = ["吃饭🍚", "运动💪"]
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedDataSource.itemContentWidth = totalItemWidth/CGFloat(titles.count)
        segmentedDataSource.titles = titles
        segmentedDataSource.isTitleMaskEnabled = true
        segmentedDataSource.titleColor = UIColor.red
        segmentedDataSource.titleSelectedColor = UIColor.white
        segmentedDataSource.reloadData(selectedIndex: 0)

        let indicator = JXSegmentedIndicatorBackgroundView()
        indicator.indicatorHeight = 30
        indicator.backgroundWidthIncrement = 0
        indicator.indicatorColor = UIColor.red

        segmentedView.frame = CGRect(x: 0, y: 0, width: totalItemWidth, height: 30)
        segmentedView.layer.masksToBounds = true
        segmentedView.layer.cornerRadius = 15
        segmentedView.layer.borderColor = UIColor.red.cgColor
        segmentedView.layer.borderWidth = 1/UIScreen.main.scale
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [indicator]
        segmentedView.itemSpacing = 0
        segmentedView.delegate = self
        navigationItem.titleView = segmentedView

        segmentedView.contentScrollView = listContainerView.scrollView
        view.addSubview(listContainerView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        listContainerView.frame = view.bounds
    }
}

extension NestViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        listContainerView.didClickSelectedItem(at: index)
    }

    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension NestViewController: JXSegmentedListContainerViewDelegate {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContentViewDelegate {
        let vc = NestChildViewController()
        if index == 0 {
           vc.titles = ["吃鸡🍗", "吃西瓜🍉", "吃热狗🌭"]
        }else if index == 1 {
            vc.titles = ["高尔夫🏌", "滑雪⛷", "自行车🚴"]
        }
        return vc
    }
}


