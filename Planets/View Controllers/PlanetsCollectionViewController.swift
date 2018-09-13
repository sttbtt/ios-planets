//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit


class PlanetsCollectionViewController: UICollectionViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    @IBAction func unwindToPlanetCollectionViewController(_ sender: UIStoryboardSegue) { }
    
    // Mark: - Properties
    
    let planetController = PlanetController()
    
    var planets: [Planet] {
        let shouldShowPluto = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
        return shouldShowPluto ? planetController.planetsWithPluto : planetController.planetsWithoutPluto
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! PlanetCollectionViewCell
        
        
        let planet = planets[indexPath.item]
        cell.imageView.image = planet.image
        cell.textLabel.text = planet.name
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
}
