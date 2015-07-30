//
//  BaseGetDetailPOIResponseDTO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>


@interface BaseGetDetailPOIResponseDTO : NSObject <NSCopying, NSMutableCopying, NSCoding>


@property (nonatomic, strong) NSString *idPOI;	///<  - Field name on service:id.
@property (nonatomic, strong) NSString *title;	///<  - Field name on service:title.
@property (nonatomic, strong) NSString *address;	///<  - Field name on service:address.
@property (nonatomic, strong) NSString *transport;	///<  - Field name on service:transport.
@property (nonatomic, strong) NSString *email;	///<  - Field name on service:email.
@property (nonatomic, strong) NSString *geocoordinates;	///<  - Field name on service:geocoordinates.
@property (nonatomic, strong) NSString *desc;	///<  - Field name on service:description.
@property (nonatomic, strong) NSString *phone;	///<  - Field name on service:phone.

- (BOOL)isEqualToBaseGetDetailPOIResponseDTO:(BaseGetDetailPOIResponseDTO *)other;

@end