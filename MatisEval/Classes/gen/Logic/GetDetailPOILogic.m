//
//  BaseGetDetailPOI.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetDetailPOILogic.h"

#import "GenDefines.h"
#import "BaseGetDetailPOILogic.h"
#import "GetDetailPOIRequestDTO.h"
#import "GetDetailPOIResponseDTO.h"


@implementation GetDetailPOILogic


// Get the shared instance and create it if necessary.
+ (GetDetailPOILogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetDetailPOILogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 