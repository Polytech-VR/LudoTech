//
//  Person.h
//  LudoTech
//
//  Created by Valentin Bercot on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Edition;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * nationality;
@property (nonatomic, retain) Edition *editionAuthor;
@property (nonatomic, retain) Edition *editionIllustrator;

@end
