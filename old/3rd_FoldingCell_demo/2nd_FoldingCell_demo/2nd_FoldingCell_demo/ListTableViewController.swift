//
//  ListTableViewController.swift
//  2nd_FoldingCell_demo
//
//  Created by 竹村博徳 on 2020/08/10.
//  Copyright © 2020 竹村博徳. All rights reserved.
//

import Foundation
import UIKit
import FoldingCell


class ListTableViewController: UITableViewController {

    private let closeCellHeight: CGFloat = 96
    private let openCellHeight: CGFloat = 328

    private let cellCount = 10

    private var cellHeights: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        cellHeights = Array.init(repeating: closeCellHeight, count: cellCount)
        tableView.backgroundColor = UIColor.gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SampleCell else {
            fatalError("Could not create SampleCell")
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as SampleCell = tableView.cellForRow(at: indexPath) else {
            return
        }

        var duration = 0.0
        if cellHeights[indexPath.row] == closeCellHeight { // open cell
            cellHeights[indexPath.row] = openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 1.1
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as SampleCell = cell {
            if cellHeights[indexPath.row] == closeCellHeight {
                cell.unfold(false, animated: false, completion:nil)
            } else {
                cell.unfold(true, animated: false, completion: nil)
            }
        }
    }
}
