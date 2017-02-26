//
//  CoreDataStore.swift
//  CodPol
//
//  Created by Juan Carlos Samboní Ramírez on 24/02/17.
//  Copyright © 2017 DigitalCroma. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStore {
    static let sharedInstance = CoreDataStore()
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CodPol")
        var persistentStoreDescriptions: NSPersistentStoreDescription
        let directory = NSPersistentContainer.defaultDirectoryURL()
        let storeUrl = [directory.appendingPathComponent("CodPol.sqlite"),
                        directory.appendingPathComponent("CodPol.sqlite-shm"),
                        directory.appendingPathComponent("CodPol.sqlite-wal")]
        if !FileManager.default.fileExists(atPath: (storeUrl[0].path)) {
            
            let seededDataUrl = [Bundle.main.url(forResource: "db_codpol", withExtension: "sqlite"),
                                 Bundle.main.url(forResource: "db_codpol", withExtension: "sqlite-shm"),
                                 Bundle.main.url(forResource: "db_codpol", withExtension: "sqlite-wal")]
            for index in 0 ..< seededDataUrl.count {
                do {
                    try FileManager.default.copyItem(at: seededDataUrl[index]!, to: storeUrl[index])
                } catch let error as NSError {
                    print("Error: \(error.domain)")
                }
            }
        }
        
        let description = NSPersistentStoreDescription()
        description.url = storeUrl[0]
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        print(container.persistentStoreDescriptions)
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataStore: DBStoreProtocol {
    func fetchPoliceCode(completionHandler: (PoliceCode, Error?) -> Void) {
        let managedContext = persistentContainer.viewContext
        
        do {
            let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
            let booksMO = try managedContext.fetch(fetchRequest)
            var books:[PoliceCode.Book] = []
            
            for bookInfo: Book in booksMO {
                var titles:[PoliceCode.Title] = []
                
                for titleInfo in bookInfo.titles?.array as! [Title] {
                    var chapters:[PoliceCode.Chapter] = []
                    
                    for chapterInfo in titleInfo.chapters?.array as! [Chapter] {
                        var articles:[PoliceCode.Article] = []
                        
                        for articleInfo in chapterInfo.articles?.array as! [Article] {
                            let article = PoliceCode.Article(text: articleInfo.text ?? "")
                            articles.append(article)
                        }
                        
                        chapters.append(PoliceCode.Chapter(name: chapterInfo.name ?? "", information: chapterInfo.information ?? "", articles: articles))
                    }
                    
                    titles.append(PoliceCode.Title(name: titleInfo.name ?? "", information: titleInfo.information ?? "", chapters: chapters))
                }
                
                books.append(PoliceCode.Book(name: bookInfo.name ?? "", information: bookInfo.information ?? "", titles: titles))
            }
            
            completionHandler(PoliceCode(books: books), nil)
            return
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            completionHandler(PoliceCode(books: []), error)
            return
        }
    }
}
