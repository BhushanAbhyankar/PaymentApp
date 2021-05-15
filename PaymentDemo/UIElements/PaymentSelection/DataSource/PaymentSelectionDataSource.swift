//
//  PaymentSelectionDataSource.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class PaymentSelectionDataSource: NSObject,UITableViewDataSource,UITableViewDelegate  {
    private var items : ListResult!
    var isSerching = false
    var serchText = ""
    var showSelectedPaymentDetails: ((ApplicableNetwork) -> ()) = {_ in }

    init(items : ListResult) {
        self.items = items;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.networks.applicable.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentSelectionTableViewCell", for: indexPath) as! PaymentSelectionTableViewCell
            let item = self.items.networks.applicable[indexPath.row] as ApplicableNetwork
            cell.applicableNetwork = item
            return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items.networks.applicable[indexPath.row] as ApplicableNetwork
        self.showSelectedPaymentDetails(item)
    }
}
extension UIImageView {

 public func imageFromURL(urlString: String, PlaceHolderImage:UIImage) {

        if self.image == nil{
              self.image = PlaceHolderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }
}
