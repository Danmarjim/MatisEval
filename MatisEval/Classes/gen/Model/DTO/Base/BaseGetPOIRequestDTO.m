//
//  BaseGetPOIRequestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPOIRequestDTO.h"

@implementation BaseGetPOIRequestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetPOIRequestDTO *copy=[[[self class] alloc] init];
    if(copy) {
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetPOIRequestDTO *copy=[[[self class] alloc] init];
	if(copy) {
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetPOIRequestDTO:(BaseGetPOIRequestDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetPOIRequestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetPOIRequestDTO:(BaseGetPOIRequestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
	return theHash;
}

@end
 