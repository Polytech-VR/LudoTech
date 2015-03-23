//
//  LudoTechTests.m
//  LudoTechTests
//
//  Created by Valentin Bercot on 19/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Type+DataModel.h"
#import "Difficulty+DataModel.h"
#import "AppDelegate.h"

@interface LudoTechTests : XCTestCase

@property (weak, nonatomic) AppDelegate *appDelegate;

@end

@implementation LudoTechTests

- (void)setUp
{
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self->_appDelegate = [[UIApplication sharedApplication] delegate];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [self->_appDelegate saveContext];
    
    [super tearDown];
}

- (void)testAddType
{
    NSError *fetchError=[[NSError alloc] init];
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Type" inManagedObjectContext:context];
    
    // Create a fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Type"];
    
    // Check if no type exist
    NSArray *result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 0, @"Some type already exists");
    
    // Add types
    Type *type = [Type getObjectWithName:@"Plateau" withEntityDescription:entityDescription inManagedObjectContext:context];
    Type *type2 = [Type getObjectWithName:@"Cartes" withEntityDescription:entityDescription inManagedObjectContext:context];
    Type *type3 = [Type getObjectWithName:@"Des" withEntityDescription:entityDescription inManagedObjectContext:context];
    
    [Type getObjectWithName:@"Role" withEntityDescription:entityDescription inManagedObjectContext:context];
    [Type getObjectWithName:@"Wargame" withEntityDescription:entityDescription inManagedObjectContext:context];
    [Type getObjectWithName:@"Strategie" withEntityDescription:entityDescription inManagedObjectContext:context];
    
    // Check if they are in context
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 6, @"Some type missing");
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Plateau"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Plateau type missing or in more than one exemplary");
    XCTAssertEqual(result[0], type, @"Plateau type not returned");
    XCTAssertEqualObjects(result[0], type, @"Plateau type not returned");
    
    type2 = nil;
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Cartes"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Cartes type missing or in more than one exemplary");
    
    NSLog(@"Type Cartes ? : %@", ((Type *) result[0]).name);
    
    XCTAssertEqual([result[0] name], @"Cartes", @"Cartes type not returned");
    XCTAssertNotEqualObjects(result[0], type2, @"Same object as previously while it was deleted");
    
    // Change one
    type3 = nil;
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Des"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Des type missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"Des", @"Des type not returned");
    
    [(Type *) result[0] setName:@"De"];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Des type missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"Des", @"Des type not returned");
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"De"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertEqual([result count], 1, @"De type missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"De", @"De type not returned");
}

- (void)testAddDifficulty
{
    NSError *fetchError=[[NSError alloc] init];
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Difficulty" inManagedObjectContext:context];
    
    // Create a fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Difficulty"];
    
    // Check if no type exist
    NSArray *result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 0, @"Some Difficulty already exists");
    
    // Add types
    Difficulty *difficulty = [Difficulty getObjectWithName:@"Facile" withEntityDescription:entityDescription inManagedObjectContext:context];
    Difficulty *difficulty2 = [Difficulty getObjectWithName:@"Difficile" withEntityDescription:entityDescription inManagedObjectContext:context];
    Difficulty *difficulty3 = [Difficulty getObjectWithName:@"Expert" withEntityDescription:entityDescription inManagedObjectContext:context];
    
    [Difficulty getObjectWithName:@"Moyen" withEntityDescription:entityDescription inManagedObjectContext:context];
    
    // Check if they are in context
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 4, @"Some Difficulty missing");
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Facile"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Facile Difficulty missing or in more than one exemplary");
    XCTAssertEqual(result[0], difficulty, @"Facile Difficulty not returned");
    XCTAssertEqualObjects(result[0], difficulty, @"Facile Difficulty not returned");
    
    difficulty2 = nil;
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Difficile"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Difficile Difficulty missing or in more than one exemplary");
    
    NSLog(@"Difficulty Difficile ? : %@", ((Difficulty *) result[0]).name);
    
    XCTAssertEqual([result[0] name], @"Difficile", @"Difficile Difficulty not returned");
    XCTAssertNotEqualObjects(result[0], difficulty2, @"Same object as previously while it was deleted");
    
    // Change one
    difficulty3 = nil;
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Expert"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Expert Difficulty missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"Expert", @"Expert Difficulty not returned");
    
    [(Difficulty *) result[0] setName:@"Experts"];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertNotNil(fetchError, @"Fetch Request fails");
    XCTAssertEqual([result count], 1, @"Expert Difficulty missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"Expert", @"Experts Difficulty not returned");
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K == %@", @"name", @"De"]];
    result = [context executeFetchRequest:fetchRequest error:&fetchError];
    
    XCTAssertEqual([result count], 1, @"Experts Difficulty missing or in more than one exemplary");
    XCTAssertEqual([result[0] name], @"Experts", @"Experts Difficulty not returned");
}

@end
