//
//  Extension.h
//  LudoTech
//
//  Created by Valentin Bercot on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Variant.h"

@class Variant;

@interface Extension : Variant

@property (nonatomic, retain) NSNumber * playAlone;
@property (nonatomic, retain) Variant *variant;

@end
