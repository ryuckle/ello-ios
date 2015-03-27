//
//  StreamTextCellPresenter.swift
//  Ello
//
//  Created by Sean on 2/18/15.
//  Copyright (c) 2015 Ello. All rights reserved.
//

import UIKit

struct StreamTextCellPresenter {
    static let commentMargin = CGFloat(58)

    static func configure(
        cell:UICollectionViewCell,
        streamCellItem:StreamCellItem,
        streamKind: StreamKind,
        indexPath: NSIndexPath)
    {
        if let cell = cell as? StreamTextCell {
            cell.contentView.alpha = 0.0
            cell.onWebContentReady { webView in
                if let actualHeight = webView.windowContentSize()?.height {
                    if actualHeight != streamCellItem.calculatedWebHeight {
                        streamCellItem.multiColumnCellHeight = actualHeight
                        streamCellItem.oneColumnCellHeight = actualHeight
                        streamCellItem.calculatedWebHeight = actualHeight
                        postNotification(RelayoutStreamViewControllerNotification, cell)
                    }
                }
            }

            if let textRegion = streamCellItem.data as TextRegion? {
                let content = textRegion.content
                let html = StreamTextCellHTML.postHTML(content)
                cell.webView.loadHTMLString(html, baseURL: NSURL(string: "/"))
            }
            else {
                cell.webView.loadHTMLString("", baseURL: NSURL(string: "/"))
            }

            if let comment = streamCellItem.jsonable as? Comment {
                cell.leadingConstraint.constant = commentMargin
            }
            else {
                cell.leadingConstraint.constant = 0.0
            }
        }
    }

}
