//
//  BaseGetPOIResponseDTO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
@class GetPOIDTO;


@interface BaseGetPOIResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSArray *list;	///<  - Field name on service:list.

- (BOOL)isEqualToBaseGetPOIResponseDTO:(BaseGetPOIResponseDTO *)other;

@end