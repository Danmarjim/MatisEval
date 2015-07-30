//
//  BaseGetDetailPOIRequestDTO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetDetailPOIRequestDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSNumber *idPOI;	///<  - Field name on service:id.

- (BOOL)isEqualToBaseGetDetailPOIRequestDTO:(BaseGetDetailPOIRequestDTO *)other;

@end