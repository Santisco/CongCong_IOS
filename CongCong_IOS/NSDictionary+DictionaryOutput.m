//
//  NSDictionary+DictionaryOutput.m
//  CongCong_IOS
//
//  Created by 吴冠龙 on 16/5/25.
//  Copyright © 2016年 吴冠龙. All rights reserved.
//

#import "NSDictionary+DictionaryOutput.h"

@implementation NSDictionary (DictionaryOutput)
- (NSString*)my_description {
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
