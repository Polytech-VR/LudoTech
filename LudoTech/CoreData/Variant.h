//
//  Variant.h
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Difficulty, Edition, Extension, GamePlayed;

@interface Variant : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Difficulty *difficulty;
@property (nonatomic, retain) NSSet *listEdition;
@property (nonatomic, retain) NSSet *listExtension;
@property (nonatomic, retain) NSSet *listGamePlayed;
@end

@interface Variant (CoreDataGeneratedAccessors)

- (void)addListEditionObject:(Edition *)value;
- (void)removeListEditionObject:(Edition *)value;
- (void)addListEdition:(NSSet *)values;
- (void)removeListEdition:(NSSet *)values;

- (void)addListExtensionObject:(Extension *)value;
- (void)removeListExtensionObject:(Extension *)value;
- (void)addListExtension:(NSSet *)values;
- (void)removeListExtension:(NSSet *)values;

- (void)addListGamePlayedObject:(GamePlayed *)value;
- (void)removeListGamePlayedObject:(GamePlayed *)value;
- (void)addListGamePlayed:(NSSet *)values;
- (void)removeListGamePlayed:(NSSet *)values;

@end
