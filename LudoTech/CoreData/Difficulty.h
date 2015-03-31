//
//  Difficulty.h
//  LudoTech
//
//  Created by Valentin Bercot on 31/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface Difficulty : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *listVariant;
@end

@interface Difficulty (CoreDataGeneratedAccessors)

- (void)addListVariantObject:(Variant *)value;
- (void)removeListVariantObject:(Variant *)value;
- (void)addListVariant:(NSSet *)values;
- (void)removeListVariant:(NSSet *)values;

@end
