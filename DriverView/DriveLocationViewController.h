//
//  DriveLocationViewController.h
//  DiidyChauffer
//
//  Created by diidy on 12-9-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "DrivePosition.h"
#import "MapAnnotion.h"
#import "CouponDelegate.h"
@interface DriveLocationViewController : UIViewController<BMKMapViewDelegate,BMKSearchDelegate>
{
    BMKMapView* _mapView;
    BMKSearch* _search;
    MapAnnotion * mapAnnon;
    DrivePosition * drivePositin;
    BMKPointAnnotation* item;
    BMKPointAnnotation* driveAnnotation;
    BOOL locationPeson;
    BOOL readonly;
    BOOL firstLoaded;
    
    CLLocationCoordinate2D          location;
      
    NSString * driveName;
    NSString * driverMobile;
    double _long;
    double _lat;
    
    
    //    UIView                          *_markerView;
    //    UIImageView                     *_markerTip;
    //    UIImageView                     *_markerShadow;
    // UILabel *textLabel;
    //UIView                          *_glassMenuView;
}

@property (nonatomic, readwrite) BOOL readonly;
@property(nonatomic,assign)id<CouponDelegate>LocationDelegate;
@property (nonatomic, retain) MapAnnotion *mapAnnon;

- (void) initWithTitle:(NSString *)drive withSubtitle:(NSString *)mobile withLatitude:(double)lat withLongtitude:(double)lng;
-(void)backToTheOriginalPosition;
@end