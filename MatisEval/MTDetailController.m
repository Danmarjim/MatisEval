//
//  MTDetailController.m
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "MTDetailController.h"

#import "GetDetailPOIActionTask.h"
#import "GetDetailPOIRequestDTO.h"
#import "PoiDTO.h"
#import "UIColor+MyColor.h"

@interface MTDetailController ()

@end

@implementation MTDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Detalles";
    [self loadDetails];
    
    [self createView];
}

- (void)loadDetails
{
    GetDetailPOIRequestDTO *request = [GetDetailPOIRequestDTO new];
    request.idPOI = self.idPOI;
    
    [GetDetailPOIActionTask getDetailPOIActionTaskForRequest:request showLoadingView:YES completed:^(NSInteger statusCode, GetDetailPOIResponseDTO *response) {
        NSLog(@"La salida es: %@", response);
        PoiDTO *poi = response;
        
        //Asignar los datos obtenidos
        self.infoName.text = poi.title;
        self.infoAddress.text = poi.address;
        self.infoTrans.text = poi.transport;
        self.infoEmail.text = poi.email;
        self.infoPhone.text = poi.phone;
        self.infoDesc.text = poi.desc;
        
        [self.infoDesc sizeToFit];
        
    } error:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)createView
{
    self.labelName.text = @"Titulo";
    self.labelAddress.text = @"Dirección";
    self.labelTrans.text = @"Transporte";
    self.labelEmail.text = @"Email";
    self.labelPhone.text = @"Teléfono";
    self.labelDesc.text = @"Descripción";
    
    [self.infoDesc setScrollEnabled:NO];
    
    //Lineas justo debajo de los textfield depiendo del dispositivo
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if(iOSDeviceScreenSize.width == 320){
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 53, 280, 2)];
        lineView.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 154, 280, 2)];
        lineView2.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView2];
        
        UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(20, 259, 280, 2)];
        lineView3.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView3];
        
        UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(20, 359, 280, 2)];
        lineView4.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView4];
        
        UIView *lineView5 = [[UIView alloc] initWithFrame:CGRectMake(20, 435, 280, 2)];
        lineView5.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView5];
        
        UIView *lineView6 = [[UIView alloc] initWithFrame:CGRectMake(20, 511, 280, 2)];
        lineView6.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView6];
        
        self.scrollView.contentSize = CGSizeMake(320, 1100);
    } else {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 53, 335, 2)];
        lineView.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 154, 335, 2)];
        lineView2.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView2];
        
        UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(20, 259, 335, 2)];
        lineView3.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView3];
        
        UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(20, 359, 335, 2)];
        lineView4.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView4];
        
        UIView *lineView5 = [[UIView alloc] initWithFrame:CGRectMake(20, 435, 335, 2)];
        lineView5.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView5];
        
        UIView *lineView6 = [[UIView alloc] initWithFrame:CGRectMake(20, 511, 335, 2)];
        lineView6.backgroundColor = [UIColor customColor];
        [self.scrollView addSubview:lineView6];
        
        self.scrollView.contentSize = CGSizeMake(375, 900);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
