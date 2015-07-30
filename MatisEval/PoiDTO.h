//
//  PoiDTO.h
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoiDTO : NSObject

@property (strong, nonatomic) NSNumber *idPOI;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *transport;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *geocoordinates;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *phone;

@end
