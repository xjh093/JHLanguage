//
//  JHLanguage.m
//  JHKit
//
//  Created by HaoCold on 2017/12/22.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

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
        _currentLanguage = @"zh_Hans";
        _bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"]];
    }
    return self;
}

- (void)jh_setCurrentLanguage:(JHLanguageType)language{
    if (language == JHLanguageType_zh_Hans) {
        _currentLanguage = @"zh_Hans";
    }else if (language == JHLanguageType_en){
        _currentLanguage = @"en";
    }else{
        _currentLanguage = @"zh_Hans";
    }
    _bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"]];
}

- (NSString *)jh_stringForKey:(NSString *)key table:(NSString *)table{
    if (_bundle) {
        return NSLocalizedStringFromTableInBundle(key, table, _bundle, nil);
    }
    return NSLocalizedStringFromTable(key, table, nil);
}

@end











