//
//  BaseGetDetailPOIResponseDTO.m
//  
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetDetailPOIResponseDTO.h"

@implementation BaseGetDetailPOIResponseDTO

#pragma mark - NSCopying
// Creates a non-mutable copy of this DTO Object
-(id)copyWithZone:(NSZone *)zone {

	BaseGetDetailPOIResponseDTO *copy=[[[self class] alloc] init];
    if(copy) {
		copy.idPOI=[self.idPOI copyWithZone:zone];
		copy.title=[self.title copyWithZone:zone];
		copy.address=[self.address copyWithZone:zone];
		copy.transport=[self.transport copyWithZone:zone];
		copy.email=[self.email copyWithZone:zone];
		copy.geocoordinates=[self.geocoordinates copyWithZone:zone];
		copy.desc=[self.desc copyWithZone:zone];
		copy.phone=[self.phone copyWithZone:zone];
	}
	return copy;
}

#pragma mark - NSMutableCopying
// Creates a mutable copy of this DTO Object
-(id)mutableCopyWithZone:(NSZone *)zone {

	BaseGetDetailPOIResponseDTO *copy=[[[self class] alloc] init];
	if(copy) {
		copy.idPOI=self.idPOI;
		copy.title=self.title;
		copy.address=self.address;
		copy.transport=self.transport;
		copy.email=self.email;
		copy.geocoordinates=self.geocoordinates;
		copy.desc=self.desc;
		copy.phone=self.phone;
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
	self.address = [decoder decodeObjectForKey:@"address"];
	self.transport = [decoder decodeObjectForKey:@"transport"];
	self.email = [decoder decodeObjectForKey:@"email"];
	self.geocoordinates = [decoder decodeObjectForKey:@"geocoordinates"];
	self.desc = [decoder decodeObjectForKey:@"desc"];
	self.phone = [decoder decodeObjectForKey:@"phone"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:self.idPOI forKey:@"idPOI"];
	[encoder encodeObject:self.title forKey:@"title"];
	[encoder encodeObject:self.address forKey:@"address"];
	[encoder encodeObject:self.transport forKey:@"transport"];
	[encoder encodeObject:self.email forKey:@"email"];
	[encoder encodeObject:self.geocoordinates forKey:@"geocoordinates"];
	[encoder encodeObject:self.desc forKey:@"desc"];
	[encoder encodeObject:self.phone forKey:@"phone"];
}

#pragma mark - Equality

- (BOOL)isEqualToBaseGetDetailPOIResponseDTO:(BaseGetDetailPOIResponseDTO *)other {
	if (!other) {
		return NO;
	}
	BOOL equals = YES;
    equals = equals && (self.idPOI == other.idPOI || [self.idPOI isEqual:other.idPOI]);
    equals = equals && (self.title == other.title || [self.title isEqual:other.title]);
    equals = equals && (self.address == other.address || [self.address isEqual:other.address]);
    equals = equals && (self.transport == other.transport || [self.transport isEqual:other.transport]);
    equals = equals && (self.email == other.email || [self.email isEqual:other.email]);
    equals = equals && (self.geocoordinates == other.geocoordinates || [self.geocoordinates isEqual:other.geocoordinates]);
    equals = equals && (self.desc == other.desc || [self.desc isEqual:other.desc]);
    equals = equals && (self.phone == other.phone || [self.phone isEqual:other.phone]);
	return equals;
}

- (BOOL)isEqual:(id)anObject {
	if (self == anObject) {
		return YES;
	}
	if (![anObject isKindOfClass:[BaseGetDetailPOIResponseDTO class]]) {
		return NO;
	}
	return [self isEqualToBaseGetDetailPOIResponseDTO:(BaseGetDetailPOIResponseDTO *)anObject];
}

- (NSUInteger)hash {
	NSUInteger theHash = 0;
    theHash = theHash ^ [self.idPOI hash];
    theHash = theHash ^ [self.title hash];
    theHash = theHash ^ [self.address hash];
    theHash = theHash ^ [self.transport hash];
    theHash = theHash ^ [self.email hash];
    theHash = theHash ^ [self.geocoordinates hash];
    theHash = theHash ^ [self.desc hash];
    theHash = theHash ^ [self.phone hash];
	return theHash;
}

@end
 