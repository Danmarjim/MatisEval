//
//  BaseGetPOIDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPOIDTO.h"

@implementation BaseGetPOIDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetPOIDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.idPOI=[self.idPOI copyWithZone:zone];
		copy.title=[self.title copyWithZone:zone];
		copy.geocoordinates=[self.geocoordinates copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetPOIDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.idPOI=self.idPOI;
		copy.title=self.title;
		copy.geocoordinates=self.geocoordinates;
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
	self.title = [decoder decodeObjectForKey:@"title"];
	self.geocoordinates = [decoder decodeObjectForKey:@"geocoordinates"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.idPOI forKey:@"idPOI"];
	[encoder encodeObject:self.title forKey:@"title"];
	[encoder encodeObject:self.geocoordinates forKey:@"geocoordinates"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetPOIDTO:(BaseGetPOIDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.idPOI == other.idPOI || [self.idPOI isEqual:other.idPOI]);
    equals = equals && (self.title == other.title || [self.title isEqual:other.title]);
    equals = equals && (self.geocoordinates == other.geocoordinates || [self.geocoordinates isEqual:other.geocoordinates]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetPOIDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetPOIDTO:(BaseGetPOIDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.idPOI hash];
    theHash = theHash ^ [self.title hash];
    theHash = theHash ^ [self.geocoordinates hash];
	return theHash;
}

@end
 