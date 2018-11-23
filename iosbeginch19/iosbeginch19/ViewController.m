//
//  ViewController.m
//  iosbeginch19
//
//  Created by annilq on 2018/11/23.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"
#import "Place.h"
@interface ViewController ()
@property (strong,nonatomic)CLLocationManager *locationManger;
@property (strong,nonatomic)CLLocation *previousPoint;
@property (assign,nonatomic)CLLocationDistance totalMovementDistance;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *horAccLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *verAccLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationManger=[[CLLocationManager alloc] init];
    self.locationManger.delegate=self;
    self.locationManger.desiredAccuracy=kCLLocationAccuracyBest;

    [self.locationManger requestWhenInUseAuthorization];//申请定位服务权限
    [self.locationManger startUpdatingLocation];//开启定位服务
    self.mapview.showsUserLocation=NO;
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *newLocation=[locations lastObject];
    NSString *latitudeString=[NSString stringWithFormat:@"%g\u00b0",newLocation.coordinate.latitude];
    self.latitudeLabel.text=latitudeString;
    
    NSString *lontitudeString=[NSString stringWithFormat:@"%g\u00b0",newLocation.coordinate.longitude];
    self.longitudeLabel.text=lontitudeString;
    
    NSString *horAccString=[NSString stringWithFormat:@"%g",newLocation.horizontalAccuracy];
    self.horAccLabel.text=horAccString;
    
    NSString *altitudeString=[NSString stringWithFormat:@"%gm",newLocation.altitude];
    self.altitudeLabel.text=altitudeString;
    
    NSString *verAccString=[NSString stringWithFormat:@"%gm",newLocation.verticalAccuracy];
    self.verAccLabel.text=verAccString;
    
    if(newLocation.verticalAccuracy<0||newLocation.horizontalAccuracy<0){
//        无效精度
        return;
    }
    if(newLocation.horizontalAccuracy>100||newLocation.verticalAccuracy>50){
//        不实用无效精度
        return;
    }
    if(self.previousPoint==nil){
        self.totalMovementDistance=0;
        Place *start=[[Place alloc]init];
        start.coordinate=newLocation.coordinate;
        start.title=@"start point";
        start.subtitle=@"this is where we start";
        [self.mapview addAnnotation:start];
        MKCoordinateRegion regin;
        regin=MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100);
        [self.mapview setRegion:regin animated:YES];
    }else{
        self.totalMovementDistance=[newLocation distanceFromLocation:self.previousPoint];
    }
    self.previousPoint=newLocation;
    
    NSString *distanceString=[NSString stringWithFormat:@"%gm",self.totalMovementDistance];
    self.distanceLabel.text=distanceString;

}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType=(error.code==kCLErrorDenied
                         ?@"Access denied":@"Unknow error");
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:errorType preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:NO completion:nil];
}


@end
