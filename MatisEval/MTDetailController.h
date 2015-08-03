//
//  MTDetailController.h
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTDetailController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSNumber *idPOI;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelAddress;
@property (strong, nonatomic) IBOutlet UILabel *labelTrans;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;
@property (strong, nonatomic) IBOutlet UILabel *labelPhone;
@property (strong, nonatomic) IBOutlet UILabel *labelDesc;

@property (strong, nonatomic) IBOutlet UILabel *infoName;
@property (strong, nonatomic) IBOutlet UILabel *infoAddress;
@property (strong, nonatomic) IBOutlet UILabel *infoTrans;
@property (strong, nonatomic) IBOutlet UILabel *infoEmail;
@property (strong, nonatomic) IBOutlet UILabel *infoPhone;
@property (strong, nonatomic) IBOutlet UITextView *infoDesc;

@end
