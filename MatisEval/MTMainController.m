//
//  MTMainController.m
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "MTMainController.h"
#import "UIColor+MyColor.h"

#import "GetPOIActionTask.h"
#import "GetPOIRequestDTO.h"

#import "GetDetailPOIActionTask.h"
#import "GetDetailPOIRequestDTO.h"

#import "PoiDTO.h"

@interface MTMainController ()

@property (strong, nonatomic) NSMutableArray *arrayPOI;

@end

@implementation MTMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Bienvenido";    
    [self createView];
    
//    self.arrayPOI = [[NSMutableArray alloc] init];
//    
//    // Do any additional setup after loading the view from its nib.
//    [GetPOIActionTask getPOIActionTaskForRequest:nil showLoadingView:NO completed:^(NSInteger statusCode, GetPOIResponseDTO *response) {
//        NSLog(@"LA salida es: %@", response.list);
//        for(PoiDTO *item in response.list){
//            [self.arrayPOI addObject:item];
//        }
//    } error:^(NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//
//    GetDetailPOIRequestDTO *request = [GetDetailPOIRequestDTO new];
//    request.idPOI = [NSNumber numberWithInt:1];
//    
//    [GetDetailPOIActionTask getDetailPOIActionTaskForRequest:request showLoadingView:NO completed:^(NSInteger statusCode, GetDetailPOIResponseDTO *response) {
//        NSLog(@"LA salida es: %@", response);
//        PoiDTO *poi = response;
//    } error:^(NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

- (IBAction)openMap
{
    [self performSegueWithIdentifier:@"openMap" sender:nil];
}

- (IBAction)openList
{
    [self performSegueWithIdentifier:@"openList" sender:nil];
}

- (void)createView
{
    self.buttonMap.layer.borderWidth = 3.f;
    self.buttonMap.layer.cornerRadius = 40;
    self.buttonMap.clipsToBounds = YES;
    [self.buttonMap setTintColor:[UIColor customColor]];
    self.buttonMap.layer.borderColor = [[UIColor customColor]CGColor];
    [self.buttonMap setTitle:@"ACCEDER AL MAPA" forState:UIControlStateNormal];
    
    self.buttonList.layer.borderWidth = 3.f;
    self.buttonList.layer.cornerRadius = 40;
    self.buttonList.clipsToBounds = YES;
    [self.buttonList setTintColor:[UIColor customColor]];
    self.buttonList.layer.borderColor = [[UIColor customColor]CGColor];
    [self.buttonList setTitle:@"ACCEDER A LA LISTA" forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageNamed: @"logoMatis"];
    [self.imageLogo setImage:image];
}

//MODIFICA EL COMPORTAMIENTO DEL BOTON CUANDO SE PULSA Y SE DEJA DE PULSAR
-(IBAction) buttonTouchDown:(id)sender
{
    if(sender == self.buttonList){
        self.buttonList.backgroundColor = [UIColor customColor];
        [self.buttonList setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonList.layer.borderColor = [UIColor customColor].CGColor;
    } else {
        self.buttonMap.backgroundColor = [UIColor customColor];
        [self.buttonMap setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonMap.layer.borderColor = [UIColor customColor].CGColor;
    }
}

-(IBAction) buttonTouchUpOutside:(id)sender
{
    if(sender == self.buttonList){
        self.buttonList.backgroundColor = [UIColor whiteColor];
        [self.buttonList setTitleColor:[UIColor customColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonList.layer.borderColor = [UIColor customColor].CGColor;
    } else {
        self.buttonMap.backgroundColor = [UIColor whiteColor];
        [self.buttonMap setTitleColor:[UIColor customColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonMap.layer.borderColor = [UIColor customColor].CGColor;
    }
}

-(IBAction) buttonTouchUpInside:(id)sender
{
    if(sender == self.buttonList){
        self.buttonList.backgroundColor = [UIColor whiteColor];
        [self.buttonList setTitleColor:[UIColor customColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonList.layer.borderColor = [UIColor customColor].CGColor;
    } else {
        self.buttonMap.backgroundColor = [UIColor whiteColor];
        [self.buttonMap setTitleColor:[UIColor customColor] forState:UIControlStateHighlighted & UIControlStateSelected];
        self.buttonMap.layer.borderColor = [UIColor customColor].CGColor;
    }
}


@end