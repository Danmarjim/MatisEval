//
//  BaseGetPOI.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetPOILogic.h"

#import "GenDefines.h"
#import "BaseGetPOILogic.h"
#import "GetPOIRequestDTO.h"
#import "GetPOIResponseDTO.h"


@implementation GetPOILogic


// Get the shared instance and create it if necessary.
+ (GetPOILogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPOILogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

@end

 