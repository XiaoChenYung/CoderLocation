//
//  ViewController.m
//  CoderLocation
//
//  Created by 杨晓晨 on 15/11/3.
//  Copyright © 2015年 杨晓晨. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
- (IBAction)bianma:(UIButton *)sender;

- (IBAction)jiema:(UIButton *)sender;

@property (nonatomic ,strong) CLGeocoder *geoCoder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -   lazy

- (IBAction)bianma:(UIButton *)sender {
    NSString *str = @"北京";
    
    [self.geoCoder geocodeAddressString:str completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *pl in placemarks) {
            CLLocation *loc = pl.location;
            
            NSLog(@"%@---%f-----%f",pl.name,loc.coordinate.latitude,loc.coordinate.longitude);
        }
    }];
}

- (IBAction)jiema:(UIButton *)sender {
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:40.0 longitude:120.0];
    
    [self.geoCoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *pl = [placemarks firstObject];
        NSLog(@"%@",pl.name);
    }];
    
}

- (CLGeocoder *)geoCoder {
    if (_geoCoder == nil) {
        _geoCoder = [[CLGeocoder alloc] init];
    }
    return _geoCoder;
}

@end
