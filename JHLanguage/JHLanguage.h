//
//  JHLanguage.h
//  JHKit
//
//  Created by HaoCold on 2017/12/22.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAppLanguage            @"一丨丿丶乙"
#define kAppLanguage_CH         @"zh_Hans"
#define kAppLanguage_EN         @"en"

#define kJHSetLanguage(lan) \
[[JHLanguage language] jh_setCurrentLanguage:lan]

#define kJHLocalizedString(key,tab) \
[[JHLanguage language] jh_stringForKey:key table:tab]

typedef NS_ENUM(NSUInteger, JHLanguageType) {
    JHLanguageType_zh_Hans,
    JHLanguageType_en
};

@interface JHLanguage : NSObject

+ (instancetype)language;

- (void)jh_setCurrentLanguage:(JHLanguageType)language;

- (NSString *)jh_stringForKey:(NSString *)key table:(NSString *)table;

@end
