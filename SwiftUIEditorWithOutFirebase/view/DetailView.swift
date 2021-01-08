//
//  DetailView.swift
//  SwiftUIEditorWithOutFirebase
//
//  Created by admin on 02/10/2020.
//

import SwiftUI

struct DetailView: View {
    @State var text:String
//    var currentID:UUID
    var repo:Repo
    var currentNote:Note
    
    var body: some View {
        VStack {
            MyTextView(text: $text)
            if let img = currentNote.image {
                img.resizable()
            }
            Button(action:{
                //self.repo.findNote(id: self.currentNote.id).title = self.text
                self.repo.updateExamplesNotes(id: currentNote.id, title: text)
            }){
                Text("Save")
            }
            Button(action:{
                self.repo.deleteExampleNote(id: currentNote.id)
            }){
                Text("Delete document")
            }
        }.onDisappear(){
            // her vil det gemmes automatisk
        }
    }
}
