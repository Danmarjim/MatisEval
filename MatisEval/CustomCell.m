//
//  CustomCell.m
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "CustomCell.h"
#import "UIColor+MyColor.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    //Aplicar Sombra a la View
    self.customView.layer.shadowOffset = CGSizeMake(1, 0);
    self.customView.layer.shadowColor = [[UIColor customShadowColor] CGColor];
    self.customView.layer.shadowRadius = 5;
    self.customView.layer.shadowOpacity = 1.0;
    self.customView.layer.cornerRadius = 5.0;
    
    self.labelTitle.textColor = [UIColor customColor];
    self.labelTitle.font = [UIFont fontWithName:@"Helvetica" size:20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
