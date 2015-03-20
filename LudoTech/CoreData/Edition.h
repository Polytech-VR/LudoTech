//
//  Edition.h
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Editor, Language, Person, Theme;

@interface Edition : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) Editor *editor;
@property (nonatomic, retain) Language *language;
@property (nonatomic, retain) NSSet *listAuthor;
@property (nonatomic, retain) NSSet *listIllustrator;
@property (nonatomic, retain) Theme *theme;
@end

@interface Edition (CoreDataGeneratedAccessors)

- (void)addListAuthorObject:(Person *)value;
- (void)removeListAuthorObject:(Person *)value;
- (void)addListAuthor:(NSSet *)values;
- (void)removeListAuthor:(NSSet *)values;

- (void)addListIllustratorObject:(Person *)value;
- (void)removeListIllustratorObject:(Person *)value;
- (void)addListIllustrator:(NSSet *)values;
- (void)removeListIllustrator:(NSSet *)values;

@end
