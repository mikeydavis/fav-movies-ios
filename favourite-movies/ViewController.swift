//
//  ViewController.swift
//  favourite-movies
//
//  Created by Mike Davis on 29/03/2018.
//  Copyright © 2018 Midax. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{

    var favMovies: [Movie] = []
    
    @IBOutlet var mainTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let idx: Int = indexPath.row

        moviecell.movieTitle?.text = favMovies[idx].title
        moviecell.movieYear?.text = favMovies[idx].year
        displayMovieImage(idx, moviecell: moviecell)
        return moviecell
        
    }
    
    func displayMovieImage(_ row:Int, moviecell: CustomTableViewCell){
        let url: String = (URL(string: favMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
            
        }).resume()
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if (favMovies.count == 0){
            favMovies.append(Movie(id: "01", title: "Batman Begins", year: "2005", imageUrl: "https://i.kinja-img.com/gawker-media/image/upload/s--AN7YYUbh--/c_scale,fl_progressive,q_80,w_800/y94tqd0evm9hwxvm9qim.png", plot: "caped crusaider"))
        }
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

