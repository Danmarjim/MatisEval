//
//  GetPOIActionTask.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPOIRequestDTO.h"
#import "GetPOIResponseDTO.h"
#import "GetPOILogic.h"


@interface GetPOIActionTask : NSObject

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getPOIActionTaskForRequest:(GetPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

@end