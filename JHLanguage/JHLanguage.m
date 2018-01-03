//
//  JHLanguage.m
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

#import "JHLanguage.h"

@interface JHLanguage()
@property (nonatomic,  strong) NSString *currentLanguage;
@property (nonatomic,  strong) NSBundle *bundle;
@end

@implementation JHLanguage

+ (instancetype)language{
    static JHLanguage *lan = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lan = [[JHLanguage alloc] init];
    });
    return lan;
}

- (instancetype)init{
    if (self = [super init]) {
        _currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:kAppLanguage];
        if (!_currentLanguage) {
            _currentLanguage = kAppLanguage_CH;
        }
        _bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"]];
    }
    return self;
}

- (NSString *)jh_currentLanguage{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kAppLanguage];
}

- (void)jh_setCurrentLanguage:(JHLanguageType)language{
    if (language == JHLanguageType_zh_Hans) {
        _currentLanguage = kAppLanguage_CH;
    }else if (language == JHLanguageType_en){
        _currentLanguage = kAppLanguage_EN;
    }else{
        _currentLanguage = kAppLanguage_CH;
    }
    
    _bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"]];
    
    // 
    [[NSUserDefaults standardUserDefaults] setObject:_currentLanguage forKey:kAppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)jh_stringForKey:(NSString *)key table:(NSString *)table{
    if (_bundle) {
        return NSLocalizedStringFromTableInBundle(key, table, _bundle, nil);
    }
    return NSLocalizedStringFromTable(key, table, nil);
}

@end











