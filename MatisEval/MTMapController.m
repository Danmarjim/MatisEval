//
//  MTMapController.m
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "MTMapController.h"

#import "GetPOIActionTask.h"
#import "GetPOIRequestDTO.h"
#import "PoiDTO.h"
#import "MTDetailController.h"
#import "CustomAnnotation.h"

@interface MTMapController ()

@property (strong, nonatomic) NSMutableArray *arrayPOIs;
@property (strong, nonatomic) PoiDTO *poi;

@end

@implementation MTMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Mapa de POIs";
    [self loadPOIs];
}

- (void)loadPOIs
{
    [GetPOIActionTask getPOIActionTaskForRequest:nil showLoadingView:YES completed:^(NSInteger statusCode, GetPOIResponseDTO *response) {
        self.arrayPOIs = [[NSMutableArray alloc] init];
        NSLog(@"La salida es: %@", response.list);
        for(PoiDTO *item in response.list){
            [self.arrayPOIs addObject:item];
        }
        [self setMapView];
    } error:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)setMapView
{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    for(int i = 0; i < self.arrayPOIs.count; i++)
    {
        PoiDTO *poi = [self.arrayPOIs objectAtIndex:i];
        CLLocationCoordinate2D coord;
        NSArray *listItems = [poi.geocoordinates componentsSeparatedByString:@","];
        coord.latitude = [[listItems objectAtIndex:0] doubleValue];
        coord.longitude = [[listItems objectAtIndex:1] doubleValue];
        CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithTitle:poi.title andCoordinate:coord];
        [self.mapView addAnnotation:annotation];
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 500;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[CustomAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotation"];
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"annotation"];
            pinView.calloutOffset = CGPointMake(0, 32);
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
        
            // Add an image to the left callout.
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"annotation"]];
            pinView.leftCalloutAccessoryView = iconView;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSString *title = ((CustomAnnotation*)view.annotation).title;
    
    for(PoiDTO *item in self.arrayPOIs)
    {
        if([item.title isEqualToString:title]){
            self.poi = item;
        }
    }
    
    [self performSegueWithIdentifier:@"openDetail" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    
    if (currentLocation != nil) {
        region.center.latitude = self.locationManager.location.coordinate.latitude;
        region.center.longitude = self.locationManager.location.coordinate.longitude;
    }
    
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"openDetail"])
    {
        MTDetailController *destinationController = [segue destinationViewController];
        destinationController.idPOI = self.poi.idPOI;
    }
}

@end
