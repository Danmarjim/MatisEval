//
//  BaseGetDetailPOIRequestDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetDetailPOIRequestDTO.h"

@implementation BaseGetDetailPOIRequestDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetDetailPOIRequestDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.idPOI=[self.idPOI copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetDetailPOIRequestDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.idPOI=self.idPOI;
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.idPOI = [decoder decodeObjectForKey:@"idPOI"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.idPOI forKey:@"idPOI"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetDetailPOIRequestDTO:(BaseGetDetailPOIRequestDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.idPOI == other.idPOI || [self.idPOI isEqual:other.idPOI]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetDetailPOIRequestDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetDetailPOIRequestDTO:(BaseGetDetailPOIRequestDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.idPOI hash];
	return theHash;
}

@end
 