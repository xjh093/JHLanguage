//
//  JHLanguage.h
//  JHKit
//
//  Created by HaoCold on 2017/12/22.
//  Copyright © 2017年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import <Foundation/Foundation.h>

#define kAppLanguage            @"一丨丿丶乙"
#define kAppLanguage_CH         @"zh-Hans"
#define kAppLanguage_EN         @"en"

#define kJHCurrentLanguage \
[[JHLanguage language] jh_currentLanguage]

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

- (NSString *)jh_currentLanguage;

- (void)jh_setCurrentLanguage:(JHLanguageType)language;

- (NSString *)jh_stringForKey:(NSString *)key table:(NSString *)table;

@end
