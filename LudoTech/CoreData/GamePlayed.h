//
//  GamePlayed.h
//  LudoTech
//
//  Created by Valentin Bercot on 31/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface GamePlayed : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * nbPlayer;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) Variant *variant;

@end
