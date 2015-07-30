//
//  BaseGetPOIDTO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetPOIDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *idPOI;	///<  - Field name on service:id.
@property (nonatomic, strong) NSString *title;	///<  - Field name on service:title.
@property (nonatomic, strong) NSString *geocoordinates;	///<  - Field name on service:geocoordinates.

- (BOOL)isEqualToBaseGetPOIDTO:(BaseGetPOIDTO *)other;

@end