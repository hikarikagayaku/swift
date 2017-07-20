//
//  collectionCell.swift
//  colen5
//
//  Created by VietAnh on 2017/07/20.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class collectionCell: UICollectionViewCell {
    
    
    
    var page : PageDefault? {
        didSet{
            guard let page = page else {
                return
            }
            imageView.image = UIImage(named: page.imageName)
            let color = UIColor.red
            let attributedString = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20),NSForegroundColorAttributeName: color])
            attributedString.append(NSMutableAttributedString(string:"\n\n" + page.message, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14),NSForegroundColorAttributeName:color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let lenght = attributedString.string.characters.count
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: lenght))
            
            textView.attributedText = attributedString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "page1")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.isEditable = false
        return tv
    }()
    
    
    func setupView(){
        addSubview(imageView)
        addSubview(textView)
        imageView.anchorToTop(topAnchor, bottom: textView.topAnchor, left: leftAnchor, right: rightAnchor)
//        textView.anchorToTop(nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
        _ = textView.anchor(nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        textView.center.x = textView.frame.width / 2
    }
}
