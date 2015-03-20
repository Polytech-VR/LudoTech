//
//  Game.h
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Type, Variant;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *listVariant;
@property (nonatomic, retain) Type *type;
@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addListVariantObject:(Variant *)value;
- (void)removeListVariantObject:(Variant *)value;
- (void)addListVariant:(NSSet *)values;
- (void)removeListVariant:(NSSet *)values;

@end
