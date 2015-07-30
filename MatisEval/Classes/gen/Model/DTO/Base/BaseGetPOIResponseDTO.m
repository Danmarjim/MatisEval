//
//  BaseGetPOIResponseDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPOIResponseDTO.h"

@implementation BaseGetPOIResponseDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetPOIResponseDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.list=[self.list copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetPOIResponseDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.list=[self.list mutableCopyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
	
	self.list = [decoder decodeObjectForKey:@"list"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.list forKey:@"list"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetPOIResponseDTO:(BaseGetPOIResponseDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.list == other.list || [self.list isEqual:other.list]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetPOIResponseDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetPOIResponseDTO:(BaseGetPOIResponseDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.list hash];
	return theHash;
}

@end
 