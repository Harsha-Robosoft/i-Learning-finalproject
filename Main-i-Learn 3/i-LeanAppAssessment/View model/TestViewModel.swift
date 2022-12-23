//
//  QuestionsListViewModel.swift
//  Questions List Display
//
//  Created by Shrushti Shetty on 10/12/22.
//

import Foundation
class TestViewModel {
    static var shared = TestViewModel()
    
     var testByLessonKey = "lessonId"
     var questionKey = "testId"
    
     var testByLessonValue = 29
     var questionValue = 166
    var testList = [Test]()
    
     
    func fetchQuestions(key: String, value: Int, completion: @escaping(([Test]?, Error) -> Void)){
         let networkManager = TestNetworkManager()
         let request = NSMutableURLRequest(url: NSURL(string: "https://app-e-learning-221207163844.azurewebsites.net/user/view/testByLesson?\(key)=\(value)")! as URL)
         request.httpMethod = "GET"
         request.allHTTPHeaderFields = nil
         
         networkManager.fetchList(at: request) {data,error in
             if let apiData = data{
                 print(apiData)
                guard let testData = apiData as?  [[String: Any]] else {return}
                guard let testId1 = testData[0]["testId"] as? Int else {return}
                print(testId1)
                guard let testName1 = testData[0]["testName"] as? String else {return}
                print(testName1)
                guard let lessonName1 = testData[0]["lessonName"] as? String else {return}
                print(lessonName1)
                guard let duration1 = testData[0]["duration"] as? Int else {return}
                print(duration1)
                guard let totalQuestions1 = testData[0]["totalQuestions"] as? Int else {return}
                print(totalQuestions1)
                guard let level1 = testData[0]["level"] as? String else {return}
                print(level1)
                guard let marks1 = testData[0]["marks"] as? Int else {return}
                print(marks1)
                let testsList = Test(testId: testId1, testName: testName1, lessonName: lessonName1, duration: duration1, totalQuestions: totalQuestions1, level: level1, marks: marks1)
                self.testList.append(testsList)
             }
         }
     }
    
    func assignQuestionKeyValue(key: String, value: Int) {
        questionKey = key
        questionValue = value
    }
    
    func assignTestKeyValue(key: String, value: Int) {
        testByLessonKey = key
        testByLessonValue = value
    }
}
