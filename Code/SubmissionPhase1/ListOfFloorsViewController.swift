//
//  ListOfFloorsViewController.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class ListOfFloorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, MKMapViewDelegate  {

    @IBOutlet weak var floorsTable: UITableView!
    @IBOutlet weak var map: MKMapView!
    var routeLine:MKPolyline?
    var routeLineView:MKPolylineView?
    
    var sentBuildingName:String?                // comes from ListOfBuildingsViewController
    var sentBuildingAddress:String?             // comes from ListOfBuildingsViewController
    var arrayOFfloors:NSArray?                  // comes from ListOfBuildingsViewController
    var floornum:[Int] = []                     // used to list all the floors in the TableView
    
    let locationManager = CLLocationManager()   // for getting user location

    var cdnates:CLLocationCoordinate2D?
    var userani:MKPointAnnotation?              // annotation used to mark the user's location
    var cdnsArray:[CLLocationCoordinate2D] = [] // array of cordinates which stores the user's coordinates and the building location's coordinates
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cdnates?.latitude = 33.4203671  // default value for Phoenix, Arizona
        cdnates?.longitude = -111.9368981 // default value for Phoenix, Arizona
        
        /*cdnsArray![0] = CLLocationCoordinate2DMake((cdnates?.latitude)!, (cdnates?.longitude)!);
        cdnsArray![1] = CLLocationCoordinate2DMake((cdnates?.latitude)!, (cdnates?.longitude)!);*/
        
        userani = MKPointAnnotation()
        print("sent Building Address is \(sentBuildingAddress)")
       // print("\n\n\nTHE Array you were sent is \(arrayOFfloors)")
        // Do any additional setup after loading the view.
        // call a method that will populate the map
            showLocation(usethis: sentBuildingAddress!)
        // Do any additional setup after loading the view.
        for i in 0..<(arrayOFfloors?.count)!
        {
            var temp:NSDictionary = arrayOFfloors?[i] as! NSDictionary
            floornum.append(temp["number"] as! Int)
        }
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
    }
    
    
    
    func showLocation(usethis: String)
    {
        let addressString:String = usethis;
        let geoCoder = CLGeocoder();
        //let addressString = "699, S. Mill Ave, Tempe, AZ, 85281"
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
            {(placemarks, error) in
                
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                    self.showLocation(usethis: self.sentBuildingName!)
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    print(location)
                    print("COORDINATES : ", coords)
                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                    self.map.setRegion(region, animated: true)
                    let ani = MKPointAnnotation()
                    ani.coordinate = placemark.location!.coordinate
                    ani.title = self.sentBuildingName//placemark.locality
                    ani.subtitle = placemark.subLocality
                    
                    self.map.addAnnotation(ani)
                    self.cdnsArray.append(placemark.location!.coordinate)
                }
        })
    }
    
    
    @IBAction func FindLocation(_ sender: UIButton) // adds annotations, plots a route
    {
        self.map.addAnnotation(userani!)
        print("annotation added")
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: cdnates!, span: span)
        self.map.setRegion(region, animated: true)
        
        let directionRequest = MKDirections.Request()
        
        let sourcePlacemark = MKPlacemark(coordinate: cdnsArray[1], addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: cdnsArray[0], addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        // Calculate the directions
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            print(route)
            self.map.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
            self.map.setRegion(region, animated: true)
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (arrayOFfloors?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath) as! FloorTableViewCell
        cell.layer.borderWidth = 1.0
        cell.FloorNumberLabel.text = "Floor \(floornum[indexPath.row])"
        cell.backgroundColor = UIColor.yellow
       // cell.BuildingImage.image = UIImage(named: "download.jpg")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        showLocation(usethis: sentBuildingAddress!)
        locationManager.requestLocation()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let selectedIndex: IndexPath = self.floorsTable.indexPath(for: sender as! UITableViewCell)!
        let des = segue.destination as! ListOfClassesViewController
        var temp:NSDictionary = arrayOFfloors?[selectedIndex.row] as! NSDictionary
        des.arrayOFclassrooms = temp["classrooms"] as? NSArray
    }
    
    
    
    // delegate methods invoked when location is requested
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            print("\(lat),\(long)")
            userani!.coordinate = (locations.last?.coordinate)!
            cdnates = userani!.coordinate
            self.cdnsArray.append(cdnates!)
            userani!.title = "Current Location"
            // do the map work, annotations, function calls, whatever, here
        } else {
            print("No coordinates")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineWidth = 4.0
        
        return renderer
    }
    

}
