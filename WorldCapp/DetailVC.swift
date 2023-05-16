//
//  DetailVC.swift
//  WorldCapp
//
//  Created by Maks Vogtman on 01/05/2023.
//

import UIKit

final class DetailVC: UIViewController {
    var event: WorldCupYear?
    
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var versusLabel: UILabel!
    @IBOutlet var numberOfTeamsLabel: UILabel!
    @IBOutlet var finalDescriptLabel: UILabel!
    @IBOutlet var thirdPlaceDescriptLabel: UILabel!
    @IBOutlet var topScorerLabel: UILabel!
    @IBOutlet var secondVersusLabel: UILabel!
    @IBOutlet var mvpLabel: UILabel!
    @IBOutlet var goldenGloveLabel: UILabel!
    @IBOutlet var thirdPlaceLabel: UILabel!
    @IBOutlet var finalLabel: UILabel!
    
    @IBOutlet var homeFlagImage: UIImageView!
    @IBOutlet var visitorFlagImage: UIImageView!
    @IBOutlet var thirdPlaceFlagImage: UIImageView!
    @IBOutlet var fourthPlaceFlagImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configure(with: event)
    }
    
    
    private func configureUI() {
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        versusLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfTeamsLabel.translatesAutoresizingMaskIntoConstraints = false
        finalDescriptLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdPlaceDescriptLabel.translatesAutoresizingMaskIntoConstraints = false
        topScorerLabel.translatesAutoresizingMaskIntoConstraints = false
        secondVersusLabel.translatesAutoresizingMaskIntoConstraints = false
        mvpLabel.translatesAutoresizingMaskIntoConstraints = false
        goldenGloveLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        finalLabel.translatesAutoresizingMaskIntoConstraints = false
        homeFlagImage.translatesAutoresizingMaskIntoConstraints = false
        visitorFlagImage.translatesAutoresizingMaskIntoConstraints = false
        thirdPlaceFlagImage.translatesAutoresizingMaskIntoConstraints = false
        fourthPlaceFlagImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: -50),
            yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            numberOfTeamsLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: -10),
            numberOfTeamsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            finalLabel.topAnchor.constraint(equalTo: numberOfTeamsLabel.bottomAnchor, constant: 10),
            finalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            homeFlagImage.topAnchor.constraint(equalTo: finalLabel.bottomAnchor, constant: 10),
            homeFlagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            visitorFlagImage.topAnchor.constraint(equalTo: finalLabel.bottomAnchor, constant: 10),
            visitorFlagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            versusLabel.topAnchor.constraint(equalTo: finalLabel.bottomAnchor, constant: 25),
            versusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            finalDescriptLabel.topAnchor.constraint(equalTo: versusLabel.bottomAnchor, constant: 20),
            finalDescriptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalDescriptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            finalDescriptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            finalDescriptLabel.heightAnchor.constraint(equalToConstant: 60),
            
            thirdPlaceLabel.topAnchor.constraint(equalTo: finalDescriptLabel.bottomAnchor, constant: 20),
            thirdPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdPlaceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            thirdPlaceFlagImage.topAnchor.constraint(equalTo: thirdPlaceLabel.bottomAnchor, constant: 10),
            thirdPlaceFlagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            fourthPlaceFlagImage.topAnchor.constraint(equalTo: thirdPlaceLabel.bottomAnchor, constant: 10),
            fourthPlaceFlagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            secondVersusLabel.topAnchor.constraint(equalTo: thirdPlaceLabel.bottomAnchor, constant: 23),
            secondVersusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdPlaceDescriptLabel.topAnchor.constraint(equalTo: secondVersusLabel.bottomAnchor, constant: 30),
            thirdPlaceDescriptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdPlaceDescriptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            thirdPlaceDescriptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            topScorerLabel.topAnchor.constraint(equalTo: thirdPlaceDescriptLabel.bottomAnchor, constant: 10),
            topScorerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            topScorerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            topScorerLabel.heightAnchor.constraint(equalToConstant: 60),
            
            mvpLabel.bottomAnchor.constraint(equalTo: topScorerLabel.bottomAnchor, constant: 35),
            mvpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            mvpLabel.heightAnchor.constraint(equalToConstant: 40),
            
            goldenGloveLabel.topAnchor.constraint(equalTo: mvpLabel.bottomAnchor, constant: 10),
            goldenGloveLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            goldenGloveLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30)
        ])
    }
    
    
    private func configure(with event: WorldCupYear?) {
        guard let event else { return }
        
        if event.year == "2026 🇨🇦 & 🇲🇽 & 🇺🇸" {
            yearLabel.font = .systemFont(ofSize: 29, weight: .bold)
        } else if event.year == "1974 🇩🇪" {
            finalDescriptLabel.font = .systemFont(ofSize: 23, weight: .medium)
        }
        
        yearLabel.text = event.year
        versusLabel.text = event.versus
        secondVersusLabel.text = event.secondVersus
        numberOfTeamsLabel.text = event.numberOfTeams
        homeFlagImage.image = event.homeFlagImage
        visitorFlagImage.image = event.visitorFlagImage
        thirdPlaceFlagImage.image = event.thirdPlaceFlagImage
        fourthPlaceFlagImage.image = event.fourthPlaceFlagImage
        finalDescriptLabel.text = event.finalDescription
        thirdPlaceDescriptLabel.text = event.thirdPlaceDescription
        topScorerLabel.text = event.topScorer
        mvpLabel.text = event.mvp
        goldenGloveLabel.text = event.goldenGlove
        finalLabel.text = event.finalLabelText
        thirdPlaceLabel.text = event.thirdPlaceLabelText
    }
}
