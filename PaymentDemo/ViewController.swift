//
//  ViewController.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelViewPaymentList: UITableView!
    var activityView: UIActivityIndicatorView?
    private var paymentListViewModel: PaymentSelectionListViewModel!
    var dataSource : PaymentSelectionDataSource!

    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var viewBottonContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateViewModel()
        buttonContinue.addBottomShadow()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: Utilites.UIColorFromRGB(rgbValue: 0x018E36))
        self.navigationController?.navigationBar.setNeedsLayout()

    }
    func updateViewModel(){
        self.paymentListViewModel = PaymentSelectionListViewModel()
        self.showActivityIndicator()
        self.paymentListViewModel.bindViewModelToVC = {
            if (self.paymentListViewModel.listError != nil) {
                print("show user retry message")
            }else{
            //update tabel View
            self.updateDataSource()
            }
        }
    }
   
    func updateDataSource()  {
        self.dataSource = PaymentSelectionDataSource(items: self.paymentListViewModel.paymentList!)        
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.tabelViewPaymentList.dataSource = self.dataSource
            self.tabelViewPaymentList.delegate = self.dataSource
            self.reloadTabelView()
        }
        
        self.dataSource.showSelectedPaymentDetails = { applicableNetwork in

        }
    }
    
    @IBAction func buttonContinueClicked(_ sender: Any) {
        
        //Do navigation on click
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SomeViewControllerID") as? SomeViewController
//            self.navigationController?.pushViewController(vc!, animated: true)

    }
    func reloadTabelView(){
        DispatchQueue.main.async {
            self.tabelViewPaymentList.reloadData()
        }
    }
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityView = UIActivityIndicatorView(style: .large)
            self.activityView?.center = self.view.center
            self.view.addSubview(self.activityView!)
            self.activityView?.startAnimating()
        }
    }

    func hideActivityIndicator(){
        DispatchQueue.main.async {
            if (self.activityView != nil){
                self.activityView?.stopAnimating()
            }
        }
    }
}

extension UIView {
    func addBottomShadow() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 0, height:0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
        layer.masksToBounds = false;
        clipsToBounds = false;
    }
}
