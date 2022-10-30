//
//  FontCalculateExtension.swift
//  RickAndMorty
//
//  Created by Farid Rzayev on 29.10.22.
//

import UIKit

class FontCalculate{
    
    func overrideTitleFontSize(_ size : CGFloat) -> CGFloat{
        let height = UIScreen.main.bounds.height
        let newFontSize = (height * size) / 852 ///I think 14~10  is the ideal title font sizes for iPhone 14 Pro's Screen height but, not for other models. So that's my way to solve the font resizing :
                                                ///( screen's height *  font size)  / 852(Screen Size)
        return newFontSize

    }

}
