//
//  ViewController.swift
//  WorldCapp
//
//  Created by Maks Vogtman on 22/12/2022.
//

import UIKit

class FirstVC: UITableViewController {
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    let events = EventData.events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: view.safeAreaInsets.top - 180, width: view.frame.width, height: 80))
        titleLabel.text = "WorldCapp"
        titleLabel.font = .systemFont(ofSize: 45, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        descriptionLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.height - 170, width: view.frame.width, height: 60))
        descriptionLabel.text = "The list of all FIFA World Cup tournaments with their host countries"
        descriptionLabel.font = .systemFont(ofSize: 22, weight: .medium)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        
        tableView.contentInset.top = titleLabel.frame.maxY + descriptionLabel.frame.height + 220
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Year", for: indexPath)
        cell.textLabel?.text = events[indexPath.row].year
        cell.textLabel?.font = .systemFont(ofSize: 27, weight: .bold)
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailVC {
            vc.event = events[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
