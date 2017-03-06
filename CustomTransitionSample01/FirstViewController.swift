//
//  FirstViewController.swift
//  CustomTransitionSample01
//
//  Created by hirauchi.shinichi on 2017/03/05.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    let photoMax = 35
    let customTransition = CustomTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondView = segue.destination as? SecondViewController, let indexPath = sender as? IndexPath {
            secondView.indexPath = indexPath
            secondView.transitioningDelegate = customTransition
        }
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoSecondViewController", sender: indexPath)
    }

    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoMax
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.photoView.image = UIImage(named: String.init(format: "%03d", indexPath.row))
        cell.label.text = String.init(format: "Photo-%03d", indexPath.row)
        return cell
    }
}
