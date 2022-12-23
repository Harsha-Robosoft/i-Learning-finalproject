//
//  LessontestViewController.swift
//  TestresultViewController
//
//  Created by Niveditha Naik on 08/12/22.
//

import UIKit

class LessonTestViewController: UIViewController {

    @IBOutlet weak var lessonButton: CustomButton!
 
    @IBOutlet weak var testButton: CustomButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var testContainerView: UIView!
    @IBOutlet weak var lessonContainerView: UIView!
    
    var testVc: TestViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
        
        getTestByLesson()
//        getQuestions()
        lessonButton.roundCorners(corners: [.bottomLeft,.topLeft], radius: 12)
        testButton.roundCorners(corners: [.bottomRight,.topRight], radius: 12)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        testVc = segue.destination as? TestViewController
    }
    
    func getTestByLesson(){
        TestViewModel.shared.fetchQuestions(key: TestViewModel.shared.testByLessonKey, value: TestViewModel.shared.testByLessonValue) { (test, error) in
            
        }
    }
    
    func getQuestions(){
        TestViewModel.shared.fetchQuestions(key: TestViewModel.shared.questionKey, value: TestViewModel.shared.questionValue) { (test, error) in
            
        }
    }
    

    @IBAction func lessonButtonTapped(_ sender: Any) {
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
        lessonButton.setTitleColor(#colorLiteral(red: 0.2274509804, green: 0.4980392157, blue: 0.9058823529, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        view.bringSubviewToFront(lessonContainerView)
    }
    

    @IBAction func testButtonTapped(_ sender: Any) {
        
        testContainerView.isHidden = false
        lessonContainerView.isHidden = true
        lessonButton.setTitleColor(#colorLiteral(red: 0.6250110865, green: 0.6290901303, blue: 0.6430234909, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
        wrongButton.setImage(#imageLiteral(resourceName: "backbutton"), for: .normal)
        testVc?.tableView.reloadData()
        view.bringSubviewToFront(testContainerView)
        
        


    }
}
