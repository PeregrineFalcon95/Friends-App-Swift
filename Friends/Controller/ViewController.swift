//
//  ViewController.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var isFirstTimeLoading = true
    
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
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: Constant.cell )
        collectionView.delegate = self
        collectionView.dataSource = self
        DataLoader.shared.delegate = self
        updateCollectionViewLayout()
    }
    func updateCollectionViewLayout(){
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumInteritemSpacing = UIDevice.current.userInterfaceIdiom == .phone ? 10 : 15
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10)
        }
        collectionView.reloadData()
    }
    
    //Adjusting cell layout on orientation change
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            if UIDevice.current.orientation.isLandscape {
                self.updateCollectionViewLayout()
            }
            if UIDevice.current.orientation.isFlat {
                self.updateCollectionViewLayout()
            } else {
                self.updateCollectionViewLayout()
            }
            timer.invalidate()
        }
    }
}

//MARK: CollectionView Delegate and DataSource
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataLoader.shared.person.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
          collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.cell,
            for: indexPath) as? CollectionViewCell
        else {
          fatalError("Unable to dequeue CollectionViewCell")
        }
        let image = DataLoader.shared.person [ indexPath.row ].image
        let name = DataLoader.shared.person [ indexPath.row ].fullName
        let country = DataLoader.shared.person [ indexPath.row ].country
        cell.configure(image: image, name: name, country: country )
        return cell
    }
    
    //Showing details viewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController(nibName: Constant.detailsVC, bundle: nil)
        detailsVC.detailsData = DataLoader.shared.person [ indexPath.row ]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//MARK: DataLoader Delegate
extension ViewController : dataLoaderDelegate {
    func noConnectedToInternet() {
        let alert = UIAlertController(title: "No InterNet", message: "Device is not connected to internet", preferredStyle: UIAlertController.Style.alert)
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
