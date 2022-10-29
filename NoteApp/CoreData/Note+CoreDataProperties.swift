//
//  Note+CoreDataProperties.swift
//  NoteApp
//
//  Created by Apple on 21/10/2022.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var label: String?

}

extension Note : Identifiable {
    static func insertNewNote(content: String, createdDate: Date, id: String, image:String, label: String) -> Note? {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: AppDelegate.managedObjectContext!) as! Note
        
        note.content = content
        note.createdDate = createdDate
        note.id = id
        note.image = image
        note.label = label
        
        do{
            try AppDelegate.managedObjectContext?.save()
        }catch{
            let nserror = error as NSError
            print("can not insert new note")
            return nil
        }
        print("insert \(note.label) successfull")
        return note
    }
    
    
    static func addNewNote(content: String, createdDate: Date, id: String, image:String, label: String) {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: AppDelegate.managedObjectContext!) as! Note
        
        note.content = content
        note.createdDate = createdDate
        note.id = id
        note.image = image
        note.label = label
        
        do{
            try AppDelegate.managedObjectContext?.save()
        }catch{
            let nserror = error as NSError
            print("can not insert new note")
    
        }
        print("insert \(note.label) successfull")
    }
    
    
    static func getAllNotes() -> [Note]{
        var result = [Note]()
        let moc = AppDelegate.managedObjectContext
        
        do {
            result = try moc?.fetch(Note.fetchRequest()) as! [Note]
        } catch  {
            print(" Can not fetch Note. Error: \(error)")
        }
        return result
        
    }
    
    static func deleteAllNotes() -> Bool{
        let moc = AppDelegate.managedObjectContext
        let notes = Note.getAllNotes()
        for note in notes {
            moc?.delete(note)
        }
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch  {
            let nserror = error as NSError
            print(" Delete all is unsucess fu Error: \(error), \(nserror.userInfo)")
            return false
        }
        return true
    }
    
    static func deleteNoteWithId(id: String) -> Bool{
        let moc = AppDelegate.managedObjectContext
        let noteNeededDelete = Note.getNoteWithId(id: id)
        moc?.delete(noteNeededDelete)

        do {
            try AppDelegate.managedObjectContext?.save()
            
        } catch  {
            let nserror = error as NSError
            print(" Delete \(id) is unsucessful Error: \(error), \(nserror.userInfo)")
            return false
        }
        print(" Delete \(id) is sucessful")
        return true
    }
    static func getNoteWithId(id: String?) -> Note{
        var result:Note =  Note()
        let moc = AppDelegate.managedObjectContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = Note.fetchRequest()
        var subPredicates = [NSPredicate]()
//        if nameContains != nil {
//            let prediacte1 = NSPredicate(format: "label contains[cd] %@", label!) // tim kiem note ma trong label co "nameContains"
//            subPredicates.append(prediacte1)
//
//        }
        
        if id != nil {
            let predicate2 = NSPredicate(format: "id == %@", id!)  // tim chinh xac note co label == nameContains
            subPredicates.append(predicate2)
           
        }
        
        if subPredicates.count > 0 {
            let compoundPredicate = NSCompoundPredicate.init(type: .or, subpredicates: subPredicates)
            fetchRequest.predicate = compoundPredicate
        }
        
        do {
            result = try moc!.fetch(fetchRequest) as! Note
        } catch  {
            print("cam not fetch note \(error)")
            return result
        }
       
        return result
    }
    
    static func updateNote(id:String, label: String, content: String, img: String){
        var note  = getNoteWithId(id: id)
        note.label = label
        note.content = content
        note.image = img
        
        do{
            try AppDelegate.managedObjectContext?.save()
        }catch{
            let nserror = error as NSError
            print("can not update  note")
        }
        print("update \(note.label) successfull")
    }
    static func getNoteWithLabel(label: String?) -> [Note]{
        var result = [Note]()
        let moc = AppDelegate.managedObjectContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = Note.fetchRequest()
        var subPredicates = [NSPredicate]()
//        if nameContains != nil {
//            let prediacte1 = NSPredicate(format: "label contains[cd] %@", label!) // tim kiem note ma trong label co "nameContains"
//            subPredicates.append(prediacte1)
//
//        }
        
        if label != nil {
            let predicate2 = NSPredicate(format: "label == %@", label!)  // tim chinh xac note co label == nameContains
            subPredicates.append(predicate2)
           
        }
        
        if subPredicates.count > 0 {
            let compoundPredicate = NSCompoundPredicate.init(type: .or, subpredicates: subPredicates)
            fetchRequest.predicate = compoundPredicate
        }
        
        do {
            result = try moc!.fetch(fetchRequest) as! [Note]
        } catch  {
            print("cam not fetch note \(error)")
            return result
        }
       
        return result
    }
    
    static func getListNotesWithLabel(label: String?) -> [Note]{
        var result = [Note]()
        let moc = AppDelegate.managedObjectContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = Note.fetchRequest()
        var subPredicates = [NSPredicate]()
        if label != nil {
            let prediacte1 = NSPredicate(format: "label contains[cd] %@", label!) // tim kiem note ma trong label co "nameContains"
            subPredicates.append(prediacte1)

        }
        
//        if label != nil {
//            let predicate2 = NSPredicate(format: "label == %@", label!)  // tim chinh xac note co label == nameContains
//            subPredicates.append(predicate2)
//           
//        }
        
        if subPredicates.count > 0 {
            let compoundPredicate = NSCompoundPredicate.init(type: .or, subpredicates: subPredicates)
            fetchRequest.predicate = compoundPredicate
        }
        
        do {
            result = try moc!.fetch(fetchRequest) as! [Note]
        } catch  {
            print("cam not fetch note \(error)")
            return result
        }
       
        return result
    }
    
    func toString(){
        
    }
}
