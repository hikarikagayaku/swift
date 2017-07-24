//
//  cellCustom.swift
//  colen7
//
//  Created by VietAnh on 2017/07/23.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class cellCustom: UICollectionViewCell {
    
    var page:PageDefault? {
        didSet{
            guard let page = page else { return  }
            
            var image = page.imageName
            if UIDevice.current.orientation.isLandscape {
                image += "_landscape"
            }
            imageView.image = UIImage(named: image)
            let color = UIColor(white: 0.5, alpha: 1)
            let attributed = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20),NSForegroundColorAttributeName: color])
            attributed.append(NSMutableAttributedString(string: "\n\n" + page.message, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSForegroundColorAttributeName:color]))
            
            let leghth = attributed.string.characters.count
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            attributed.addAttribute(NSParagraphStyleAttributeName, value: paragraph, range: NSRange(location: 0, length: leghth))
            
            textView.attributedText = attributed
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "page1")
        i.contentMode = .scaleAspectFill
        i.clipsToBounds = true
        return i
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        return tv
    }()
    
    func setupView(){
       addSubview(imageView)
        addSubview(textView)
        imageView.anchorToTop(top: topAnchor, bottom: textView.topAnchor, left: leftAnchor, right: rightAnchor)
        textView.anchorToTop(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
}
