//
//  GetDetailPOIActionTask.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetDetailPOIRequestDTO.h"
#import "GetDetailPOIResponseDTO.h"
#import "GetDetailPOILogic.h"


@interface GetDetailPOIActionTask : NSObject

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock;

@end