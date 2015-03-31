//
//  Language.h
//  LudoTech
//
//  Created by Valentin Bercot on 31/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Edition;

@interface Language : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *listEdition;
@end

@interface Language (CoreDataGeneratedAccessors)

- (void)addListEditionObject:(Edition *)value;
- (void)removeListEditionObject:(Edition *)value;
- (void)addListEdition:(NSSet *)values;
- (void)removeListEdition:(NSSet *)values;

@end
