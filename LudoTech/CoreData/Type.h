//
//  Type.h
//  LudoTech
//
//  Created by Valentin Bercot on 31/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game;

@interface Type : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *listGame;
@end

@interface Type (CoreDataGeneratedAccessors)

- (void)addListGameObject:(Game *)value;
- (void)removeListGameObject:(Game *)value;
- (void)addListGame:(NSSet *)values;
- (void)removeListGame:(NSSet *)values;

@end
