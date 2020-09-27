//
//  ChooseCityViewController.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 27.09.2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import MapKit

final class ChooseCityViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var areaLabel: UILabel!
    
    // MARK: - Props
    var viewModel: ChooseCityViewModel?
    var router: ChooseCityRouterInput?
    
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
        checkLocationServices()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        navigationItem.title = "Choose city"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        areaLabel.text = ""
        
        mapView.delegate = self
        searchBar.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func setupActions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showUserLocation()
        }
    }
}

// MARK: - Actions
extension ChooseCityViewController {
    
    @IBAction
    func myLocationButtonTapped(_ sender: UIButton) {
        showUserLocation()
    }
    
    @IBAction
    func showWeatherButtonTapped(_ sender: UIButton) { }
    
    @IBAction
    func addButtonTapped(_ sender: UIButton) { }
}

// MARK: - Module functions
extension ChooseCityViewController {
    
    private func showUserLocation() {
        
        guard let myLocation = locationManager.location?.coordinate else { return }
        
        let range = MKCoordinateRegion(center: myLocation,
                                       latitudinalMeters: 5000,
                                       longitudinalMeters: 5000)
        mapView.setRegion(range, animated: true)
    }
    
    private func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            router?.showAlert(title: "Location Services are Disabled",
                              message: "To enable it go: Settings -> Privacy -> Location Services and turn On")
        }
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}

// MARK: - MKMapViewDelegate
extension ChooseCityViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let centerLocation = CLLocation(latitude: mapView.centerCoordinate.latitude,
                                        longitude: mapView.centerCoordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(centerLocation) { [weak self] (placemarks, error) in
            
            if let error = error {
                self?.router?.showAlert(title: error.localizedDescription, message: nil)
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            let country = placemark.country
            let city = placemark.locality
            
            if let city = city, let country = country {
                self?.areaLabel.text = city + ", " + country
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension ChooseCityViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
        showUserLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension ChooseCityViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        searchBar.showsCancelButton = false
        
        guard let area = searchBar.text, !area.isEmpty else { return }
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(area) { [weak self] (placemarks, error) in
            
            if error != nil {
                self?.areaLabel.text = "Not found"
                return
            }
            
            guard let placemarks = placemarks else { return }
            print(placemarks)
            guard let location = placemarks.first?.location?.coordinate else { return }
            
            let range = MKCoordinateRegion(center: location,
                                           latitudinalMeters: 5000,
                                           longitudinalMeters: 5000)
            self?.mapView.setRegion(range, animated: true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.showsCancelButton = false
    }
}

