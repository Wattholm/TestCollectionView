//
//  ViewController.swift
//  TestCollectionView
//
//  Created by KJEM on 07/12/2019.
//  Copyright © 2019 KJEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: [Any] = []
    
    @IBAction func filterStringsBtnTap(_ sender: UIButton) {
        filterStrings()
    }
    
    @IBAction func filterIntsBtnTap(_ sender: UIButton) {
        filterInts()
    }
    
    @IBAction func resetDataBtnTap(_ sender: UIButton) {
        dataSource = [1,2,3,"four","five","six",7,8,"nine","ten"]
        collectionView.reloadData()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func populateData() {
        dataSource = [1,2,3,"four","five","six",7,8,"nine","ten"]
    }
    
    func filterStrings() {
        dataSource = dataSource.filter { $0 is String }
        collectionView.reloadData()
    }

    func filterInts() {
        dataSource = dataSource.filter { $0 is Int }
        collectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = dataSource[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        switch item {
        case let stringItem as String:
            cell.myCellLabel.text = " \(stringItem) "
            return cell
        case let numberItem as Int:
            cell.myCellLabel.text = " \(numberItem) "
            return cell
        default:
            print("This should not happen")
            return cell
        }
        
    }

}
