//
//  BaseGetDetailPOILogic
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "AFHTTPRequestOperation.h"
#import "GetDetailPOIRequestDTO.h"
#import "GetDetailPOIResponseDTO.h"
#import "Cache.h"
#import "BaseLogic.h"

#ifndef _ModelGenLog

#ifdef SERVICE_DEBUG
 #define _ModelGenLog(...) NSLog(__VA_ARGS__)
#else
 #define _ModelGenLog(...) do { } while (0)
#endif

#endif // _ModelGenLog

#ifdef CHECK_SSL_CERTIFICATE
 #define AFNETWORKING_PIN_SSL_CERTIFICATES 1
#else
 #define AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES 1
#endif

@interface BaseGetDetailPOILogic : BaseLogic


/**
* Method getDetailPOIAction: Details from Point Of Interest
* @param getDetailPOIRequestDTO Service request
* @returns  Service response
*/
- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetDetailPOIResponseDTO *response))onSucces onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getDetailPOIAction:cacheOptions:onSuccess:onError`");

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onError:(void(^)(NSError *error))onError;

- (GetDetailPOIResponseDTO *)getDetailPOIActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error;

- (void)cleanDefaultGetDetailPOIActionCache;

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode,GetDetailPOIResponseDTO *response))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError __deprecated_msg("Method deprecated. Use `getDetailPOIAction:cacheOptions:onSuccess:onError`");

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSucces onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError;



- (void)sayonaraCache;

@end