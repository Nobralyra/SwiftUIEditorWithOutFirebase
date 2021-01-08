//
//  Repo.swift
//  SwiftUIEditorWithOutFirebase
//
//  Copyright © 2020 Signe. All rights reserved.
//

import Foundation
import SwiftUI


class Repo: ObservableObject
{
    // Tom samling af Note objekter, som er @Published så alle der subscribed til repo,
    // får at vide at der er sket en forandring
    // Man laver et objekt derfor paranteser
    @Published var notes = [Note]()
    
    init()
    {
        //getDocument()
        //getNotes()
        self.notes = exampleNotes()
    }
    
    func exampleNotes() -> [Note]
    {
        // Nødt til at wrappe billede fra UIImage til Image
        let uiImage1 = UIImage(named: "MS")
        if let i = uiImage1
        {
            let image1 = Image(uiImage: i)
            let n1 = Note(title: "Note 1", id: UUID())
            n1.image = image1
            notes.append(n1)
        }
        
        let uiImage2 = UIImage(named: "yellow-vw-bettle")
        if let i = uiImage2
        {
            let image2 = Image(uiImage: i)
            let n2 = Note(title: "Note 2", id: UUID())
            n2.image = image2
            notes.append(n2)
        }
        
        let n3 = Note(title: "Note 3", id: UUID())
        
        notes.append(n3)
        return notes
    }
    
    
    
    func updateExamplesNotes(id: UUID, title: String)
    {
        for n in 0..<notes.count
        {
            print("Er note id:\(notes[n].id) ens med id fra DetailView: \(id)")
            if notes[n].id == id
            {
                print("Er note title:\(notes[n].title) forskellige fra DetailView title: \(title)")
                self.notes[n].title = title
                print("Er note title blevet opdateret: \(notes[n].title)")
                return
            }
        }
        
    }
    
    func deleteExampleNote(id: UUID)
    {
        for n in 0..<notes.count
        {
            print("Er note id:\(notes[n].id) ens med id fra DetailView: \(id)")
            if notes[n].id == id
            {
                notes.remove(at: n)
                return
            }
        }
        
    }

    //    func deleteNote(index:Int) { // Eksample Notes
    //            self.notes.remove(at: index)
    //        }
    //
    //        func deleteNote(id:UUID) { // Eksample Notes
    //            for n in 0..<notes.count {
    //                print("sammenlign n:\(notes[n].id) med id: \(id)")
    //                if notes[n].id == id {
    //                    notes.remove(at: n)
    //                    return
    //                }
    //            }
    //        }
        
//        func findNote(id:UUID) -> Note
//        {
//            // 1. loop igennem listen
//            // 2. returnér objektet med id
//            for n in 0..<notes.count
//            {
//                if notes[n].id == id
//                {
//                    return notes[n]
//                }
//            }
//            return Note(title: "empty", id: UUID())
//        }

    
}
