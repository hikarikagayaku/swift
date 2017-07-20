//
//  ViewController.swift
//  colen5
//
//  Created by VietAnh on 2017/07/20.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
     lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.backgroundColor = .white
        vc.isPagingEnabled = true
        vc.delegate = self
        vc.dataSource = self
        return vc
    }()
    
    lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    
    let skipButton : UIButton = {
        let sk = UIButton(type: .system)
        sk.setTitle("Skip", for: .normal)
        sk.tintColor = .red
        return sk
    }()
    
    let nextButton :UIButton = {
        let nb = UIButton(type: .system)
            nb.setTitle("Next", for: .normal)
            nb.tintColor = .red
        return nb
    }()
    
    let pages: [PageDefault] = {
        let firstPage = PageDefault(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = PageDefault(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        
        let thirdPage = PageDefault(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()

    var pageControllAnchor : NSLayoutConstraint?
    var skipAnchor: NSLayoutConstraint?
    var nextAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeKeyboardNotifications()
        
        view.addSubview(collectionView)
        view.addSubview(pageController)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        collectionView.anchorToTop(view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        pageControllAnchor = pageController.anchor(nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[0]
        skipAnchor = skipButton.anchor(view.topAnchor, bottom: nil, left: view.leftAnchor, right: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 40).first
        nextAnchor = nextButton.anchor(view.topAnchor, bottom: nil, left: nil, right: view.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 40).first
        registerCells()
    }

    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -50, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = pageNumber
        
        if pageNumber == pages.count {
            pageControllAnchor?.constant = 40
            skipAnchor?.constant = -40
            nextAnchor?.constant = -40
        } else {
            pageControllAnchor?.constant = 0
            skipAnchor?.constant = 0
            nextAnchor?.constant = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
        
       
    }
    
    fileprivate func registerCells() {
        collectionView.register(collectionCell.self, forCellWithReuseIdentifier: "id")
        collectionView.register(loginCell.self, forCellWithReuseIdentifier: "login")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
           let logincell = collectionView.dequeueReusableCell(withReuseIdentifier: "login", for: indexPath)
            return logincell
            
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! collectionCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

