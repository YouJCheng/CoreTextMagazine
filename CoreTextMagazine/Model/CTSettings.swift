//
//  CTSettings.swift
//  CoreTextMagazine
//
//  Created by Yu-J.Cheng on 2018/3/28.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import Foundation
import UIKit

class CTSettings {

    // MARK: - Properties
    let margin: CGFloat = 20 // the page margin (default of 20)
    var columnsPerPage: CGFloat! // the number of columns per page
    var pageRect: CGRect! // the frame of each page containing the columns
    var columnRect: CGRect! // frame size of each column per page

    // MARK: - Initializers
    init() {
        //  Since this magazine serves both iPhone and iPad carrying zombies, show two columns on iPad and one column on iPhone so the number of columns is appropriate for each screen size.
        columnsPerPage = UIDevice.current.userInterfaceIdiom == .phone ? 1 : 2
        //  Inset the entire bounds of the page by the size of the margin to calculate pageRect.
        pageRect = UIScreen.main.bounds.insetBy(dx: margin, dy: margin)
        //  Divide pageRect's width by the number of columns per page and inset that new frame with the margin for columnRect.
        columnRect = CGRect(x: 0,
                            y: 0,
                            width: pageRect.width / columnsPerPage,
                            height: pageRect.height).insetBy(dx: margin, dy: margin)
    }
}
