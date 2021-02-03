//
//  SongDetailViewController.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var viewModel = SongDetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO 1: Tell the VM that the view has loaded
        viewModel.viewDidLoad()
        setupUI()
        setButtonText()
    }
    
    private func setupUI() {
        
        //TODO 1.1: set the values in the storyboard
        self.artistNameLabel.text = viewModel.artist
        self.songImage.image = UIImage(named: viewModel.songImageName)
        self.releaseDateLabel.text = viewModel.releaseDate
        self.songNameLabel.text = viewModel.songName
        self.favoriteButton.isSelected = viewModel.isFavorite

        //TODO 1.2: Set the button's text
        self.setButtonText()
    }
    
    private func setButtonText(){
        //TODO 1.3: If the song is a fav the button should say "Remove from favorites", "Add to favorites" if not
        self.favoriteButton.setTitle("Add to favorites", for: .normal)
        self.favoriteButton.setTitle("Remove from favorites", for: .selected)
        
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        //TODO 4: handle the logic when pressed, inform the VM
        if favoriteButton.isSelected {
            favoriteButton.isSelected = false
        }
        else {
            favoriteButton.isSelected = true
        }
    }
    
}
