//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

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
    
    

    
    @IBAction func fontSizeChanged(segue: UIStoryboardSegue) {
        guard let settingsViewController = segue.source as? SettingsViewController, let titleFontSize = settingsViewController.titleFontSize, let subtitleFontSize = settingsViewController.subtitleFontSize else {
            fatalError("No fontSize available from SettingsViewController")
        }
        
        movieTitleFontSize = titleFontSize
        movieSubtitleFontSize = subtitleFontSize
        
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
        cell.imageView?.image = UIImage(named:"\(movie.posterImageName)")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(movieTitleFontSize))
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: CGFloat(movieSubtitleFontSize))

    
       
        return cell
    }
    
    
}


