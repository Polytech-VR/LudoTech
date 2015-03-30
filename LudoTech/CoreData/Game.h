//
//  Game.h
//  LudoTech
//
//  Created by Valentin Bercot on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Type, Variant;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Type *type;
@property (nonatomic, retain) NSSet *listVariant;
@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addListVariantObject:(Variant *)value;
- (void)removeListVariantObject:(Variant *)value;
- (void)addListVariant:(NSSet *)values;
- (void)removeListVariant:(NSSet *)values;

@end
