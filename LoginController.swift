//
//  ViewController.swift
//  colen7
//
//  Created by VietAnh on 2017/07/23.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

protocol loginDelegate: class {
    func finishLoggingIn()
}

class LoginController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, loginDelegate {

    var pageControllerAnchor: NSLayoutConstraint?
    var skipBtAnchor : NSLayoutConstraint?
    var nextBtAnchor: NSLayoutConstraint?
    
    let pages: [PageDefault] = {
        let firstPage = PageDefault(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = PageDefault(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        
        let thirdPage = PageDefault(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .gray
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    lazy var skipBt: UIButton = {
            let bt = UIButton(type: .system)
            bt.setTitle("Skip", for: .normal)
        bt.setTitleColor(.orange, for: .normal)
        bt.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return bt
    }()
    
    lazy var nextBt: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Next", for: .normal)
        bt.setTitleColor(.orange, for: .normal)
        bt.addTarget(self, action: #selector(nextbt), for: .touchUpInside)
        return bt
    }()
    func skip(){
        pageController.currentPage = pages.count - 1
        nextbt()
    }
    
    func nextbt (){
        if pageController.currentPage == pages.count {
return
        }
        if pageController.currentPage == pages.count - 1 {
            hidebutton()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        let indexPath = IndexPath(item: pageController.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageController.currentPage += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        observerkeyboard()
        view.addSubview(collectionView)
        view.addSubview(pageController)
        view.addSubview(skipBt)
        view.addSubview(nextBt)
        collectionView.anchorToTop(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        collectionView.register(cellCustom.self, forCellWithReuseIdentifier: "id")
        collectionView.register(loginPage.self, forCellWithReuseIdentifier: "id1")
        pageControllerAnchor = pageController.anchor(top: nil, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topconstant: 0, bottomconstant: 0, leftconstant: 0, rightconstant: 0, widthconstant: 0, heightconstant: 40)[0]
        skipBtAnchor = skipBt.anchor(top: view.topAnchor, bottom: nil, left: view.leftAnchor, right: nil, topconstant: 14, bottomconstant: 0, leftconstant: 0, rightconstant: 0, widthconstant: 50, heightconstant: 40)[0]
        nextBtAnchor = nextBt.anchor(top: view.topAnchor, bottom: nil, left: nil, right: view.rightAnchor, topconstant: 14, bottomconstant: 0, leftconstant: 0, rightconstant: 0, widthconstant: 50, heightconstant: 40)[0]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    fileprivate  func observerkeyboard (){
        NotificationCenter.default.addObserver(self, selector: #selector(fbon), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fbhide), name: .UIKeyboardWillHide, object: nil)
    }
    func fbon() {
        	UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                let y : CGFloat = UIDevice.current.orientation.isLandscape ? -100:-50
                self.view.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
    }
    
    func fbhide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let numberpage = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = numberpage
        
        if numberpage == pages.count {
            hidebutton()
        } else {
            pageControllerAnchor?.constant = 0
            skipBtAnchor?.constant = 14
            nextBtAnchor?.constant = 14
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    fileprivate func hidebutton(){
        pageControllerAnchor?.constant = 40
        skipBtAnchor?.constant = -40
        nextBtAnchor?.constant = -40
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
            let login = collectionView.dequeueReusableCell(withReuseIdentifier: "id1", for: indexPath) as! loginPage
            login.delegate = self
            return login
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! cellCustom
        let page = pages[indexPath.item]
        cell.page = page
        return cell
        }}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        
        let indexPath = IndexPath(item: pageController.currentPage, section: 0)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView.reloadData()
        }
        
    }
    
    func finishLoggingIn() {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigationController = rootViewController as? MainNavigationController else {
            return
        }
        
        mainNavigationController.viewControllers = [homeController2()]
        UserDefaults.standard.setIsLoggedIn(value: true)
        dismiss(animated: true, completion: nil)
    }
}

