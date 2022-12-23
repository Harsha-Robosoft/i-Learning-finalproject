//
//  TestViewController.swift
//  TestresultViewController
//
//  Created by Niveditha Naik on 08/12/22.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static var shared = TestViewModel()
    
    var testimage: [UIImage] = [#imageLiteral(resourceName: "button_arrow"),#imageLiteral(resourceName: "button_arrow"),#imageLiteral(resourceName: "button_arrow")]
    var testTitleLbl: UILabel!
    var descriptionLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TestViewModel.shared.testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableViewCell
        cell.customizeView()
        cell.beginTestButton.layer.cornerRadius = 12
        cell.testLevels.text = TestViewModel.shared.testList[indexPath.row].level
        cell.testTitleLbl.text =  "\(TestViewModel.shared.testList[indexPath.row].testName):\n\(TestViewModel.shared.testList[indexPath.row].lessonName)"
    
        cell.generateDescription(duration: TestViewModel.shared.testList[indexPath.row].duration, numberOfQuestion: TestViewModel.shared.testList[indexPath.row].totalQuestions, marks: TestViewModel.shared.testList[indexPath.row].marks)
        return cell
    }
}
