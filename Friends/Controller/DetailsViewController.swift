//
//  DetailsViewController.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var informationContainer: UIView!
    
    //Personal Information
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var country: UILabel!
    
    var detailsData : PersonalInfo? = nil
    
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
        print("Deinit Called")
    }
    
    @IBAction func onEmailPressed(_ sender: UIButton) {
    }
    
    func initialLoading(){
        imageView.image = detailsData?.image
        fullName.text = detailsData?.fullName
        cellNumber.text = detailsData?.cellNumber
        email.setTitle(detailsData?.email, for: .normal)
        address.text = detailsData?.address
        city.text = detailsData?.city
        state.text = detailsData?.state
        country.text = detailsData?.country
    }
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
