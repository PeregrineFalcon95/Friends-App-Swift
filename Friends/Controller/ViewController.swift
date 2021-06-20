//
//  ViewController.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    deinit {
        
    }
    
    //First Time loading
    func initialLoading(){
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: "CollectionViewCell" )
        collectionView.delegate = self
        collectionView.dataSource = self
        DataLoader.shared.delegate = self
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            //layout.minimumLineSpacing = UIDevice.current.userInterfaceIdiom == .phone ? 30 : 55
            layout.minimumInteritemSpacing = UIDevice.current.userInterfaceIdiom == .phone ? 10 : 15
        }
    }
    
    
}

//MARK: CollectionView Delegate and DataSource
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //return DataLoader.shared.person.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
          collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionViewCell",
            for: indexPath) as? CollectionViewCell
        else {
          fatalError("Unable to dequeue CollectionViewCell")
        }
        cell.configure(image: UIImage(named: "Amit")!, name: "Amit Sarker", country: "Bangladesh" )
        //let image = DataLoader.shared.person [ indexPath.row ].image
        //let name = DataLoader.shared.person [ indexPath.row ].fullName
        //let country = DataLoader.shared.person [ indexPath.row ].country
        //cell.configure(image: image, name: name, country: country )
        return cell
    }
    
    //Showing details viewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        let temp = PersonalInfo(image: UIImage(named: "Amit")!, fullName: "Amit Sarker", address: "16/6, 3rd Lane, Kalabagan", city: "Dhaka", state: "Dhaka", country: "Bangladesh", email: "amitcse1995@gmail.com", cellNumber: "+8801715714356")
        detailsVC.detailsData = temp
        //detailsVC.detailsData = DataLoader.shared.person [ indexPath.row ]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10)
        return size
    }
}

//MARK: DataLoader Delegate
extension ViewController : dataLoaderDelegate {
    func errorUpdatingData(idx: Int) {
        let alert = UIAlertController(title: "Error", message: "Error updating data for user \(idx)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func newDataUpdated() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
