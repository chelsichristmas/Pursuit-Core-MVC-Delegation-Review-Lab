//
//  ViewController.swift
//  Delegation-Lab-Unit-4
//
//  Created by Chelsi Christmas on 1/27/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

// the thing that's configuring th e cell is what needs to be tolsd that the font has changed
// So when the font size value changes on the other view controller
// The font size equals whatever is sent by the delegate, correct?

import UIKit

class ViewController: UIViewController {
     
     @IBOutlet weak var tableView: UITableView!
     var movies = [Movie]()
     var movieTitleFontSize = Double(17) {
         didSet{
             tableView.reloadData()
         }
     }
     var movieSubtitleFontSize = Double(12) {
         didSet {
             tableView.reloadData()
         }
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         tableView.dataSource = self
         loadData()
         
     }
     
     func loadData() {
         movies = Movie.allMovies
         
         
     }
     
     

     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsController = segue.destination as? SettingsViewController else {
            fatalError("Unable to access SettingsVC")
        }
        
        settingsController.delegate = self
        settingsController.titleFontSize = CGFloat(movieTitleFontSize)
        settingsController.subtitleFontSize = CGFloat(movieSubtitleFontSize)
    }

 }
 extension ViewController: UITableViewDataSource {
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return movies.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
         
         let movie = movies[indexPath.row]
         
         cell.textLabel?.text = movie.name
         cell.detailTextLabel?.text = movie.year.description
//         cell.imageView?.image = UIImage(named:"\(movie.posterImageName)")
         
        cell.textLabel?.font = cell.textLabel!.font.withSize(CGFloat(movieTitleFontSize))
         cell.detailTextLabel?.font = cell.textLabel!.font.withSize(CGFloat(movieSubtitleFontSize))

     
        
         return cell
     }
     
     
 }

extension ViewController: StepperAndSliderDelegate {
    func didChangeValue(titleFontSize: CGFloat) {
        self.movieTitleFontSize = Double(titleFontSize)
        self.movieSubtitleFontSize = Double(titleFontSize) - 5.0
    }
    
    
}
