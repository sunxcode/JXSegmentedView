//
//  JXSegmentedIndicatorBaseView.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2018/12/26.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

public enum JXSegmentedIndicatorPosition {
    case top
    case bottom
}

open class JXSegmentedIndicatorBaseView: UIView, JXSegmentedIndicatorProtocol {
    /// 默认JXSegmentedViewAutomaticDimension（与cell的宽度相等）。内部通过getIndicatorWidth方法获取实际的值
    open var indicatorWidth: CGFloat = JXSegmentedViewAutomaticDimension
    /// 默认JXSegmentedViewAutomaticDimension（与cell的高度相等）。内部通过getIndicatorHeight方法获取实际的值
    open var indicatorHeight: CGFloat = JXSegmentedViewAutomaticDimension
    /// 默认JXSegmentedViewAutomaticDimension （等于indicatorHeight/2）。内部通过getIndicatorCornerRadius方法获取实际的值
    open var indicatorCornerRadius: CGFloat = JXSegmentedViewAutomaticDimension
    open var indicatorColor: UIColor = .red
    open var indicatorPosition: JXSegmentedIndicatorPosition = .bottom
    /// 垂直方向边距；
    open var verticalMargin: CGFloat = 0
    //手势滚动、点击切换的时候，是否允许滚动。
    open var isScrollEnabled: Bool = true
    /// 是否需要将当前的indicator的frame转换到cell。辅助JXSegmentedTitleDataSourced的isTitleMaskEnabled属性使用。
    /// 如果添加了多个indicator，仅能有一个indicator的isIndicatorConvertToItemFrameEnabled为true。
    /// 如果有多个indicator的isIndicatorConvertToItemFrameEnabled为true，则以最后一个isIndicatorConvertToItemFrameEnabled为true的indicator为准。
    open var isIndicatorConvertToItemFrameEnabled: Bool = true

    public override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    open func commonInit() {
    }

    public func getIndicatorCornerRadius(itemFrame: CGRect) -> CGFloat {
        if indicatorCornerRadius == JXSegmentedViewAutomaticDimension {
            return getIndicatorHeight(itemFrame: itemFrame)/2
        }
        return indicatorCornerRadius
    }

    public func getIndicatorWidth(itemFrame: CGRect) -> CGFloat {
        if indicatorWidth == JXSegmentedViewAutomaticDimension {
            return itemFrame.size.width
        }
        return indicatorWidth
    }

    public func getIndicatorHeight(itemFrame: CGRect) -> CGFloat {
        if indicatorHeight == JXSegmentedViewAutomaticDimension {
            return itemFrame.size.height
        }
        return indicatorHeight
    }

    //MARK: - JXSegmentedIndicatorProtocol
    open func refreshIndicatorState(model: JXSegmentedIndicatorParamsModel) {
    }

    open func contentScrollViewDidScroll(model: JXSegmentedIndicatorParamsModel) {
    }

    open func selectItem(model: JXSegmentedIndicatorParamsModel) {
    }
}
