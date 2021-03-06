//
//  SoftwareItem.m
//  ShortcutKeyBook
//
//  Created by lichunwang on 16/7/2.
//  Copyright © 2016年 springcome. All rights reserved.
//

#import "SoftwareItem.h"
#import "JSONModel.h"

@implementation SoftwareItem

- (instancetype)initWithJsonData:(NSDictionary *)jsonData
{
    self = [super init];
    if (self) {
        self.softwareId = ((NSNumber *)jsonData[@"id"]).integerValue;
        self.createAccount = jsonData[@"create_account"];
        self.userNickName = jsonData[@"user_nickname"];
        self.userHeaderID = jsonData[@"headerID"];
        self.softwareName = [jsonData[@"name"] stringByDecodingURIComponent];
        self.commentCount = ((NSNumber *)jsonData[@"comment_count"]).integerValue;
        self.likeCount = ((NSNumber *)jsonData[@"like_count"]).integerValue;
        self.browseCount = ((NSNumber *)jsonData[@"browse_count"]).integerValue;
        self.addTime = jsonData[@"add_time"];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.softwareName = [aDecoder decodeObjectForKey:@"softwareName"];
        self.createAccount = [aDecoder decodeObjectForKey:@"createAccount"];
        self.userNickName = [aDecoder decodeObjectForKey:@"userNickname"];
        self.userHeaderID = [aDecoder decodeObjectForKey:@"userHeaderID"];
        self.softwareId = [aDecoder decodeIntegerForKey:@"softwareId"];
        self.commentCount = [aDecoder decodeIntegerForKey:@"commentCount"];
        self.likeCount = [aDecoder decodeIntegerForKey:@"likeCount"];
        self.browseCount = [aDecoder decodeIntegerForKey:@"browseCount"];
        self.addTime = [aDecoder decodeObjectForKey:@"add_time"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.softwareId forKey:@"softwareId"];
    [aCoder encodeObject:self.createAccount forKey:@"createAccount"];
    [aCoder encodeObject:self.userNickName forKey:@"userNickname"];
    [aCoder encodeObject:self.userHeaderID forKey:@"userHeaderID"];
    [aCoder encodeObject:self.softwareName forKey:@"softwareName"];
    [aCoder encodeInteger:self.commentCount forKey:@"commentCount"];
    [aCoder encodeInteger:self.likeCount forKey:@"likeCount"];
    [aCoder encodeInteger:self.browseCount forKey:@"browseCount"];
    [aCoder encodeObject:self.addTime forKey:@"addTime"];
}

@end
