//
//  ContentView.swift
//  SwiftUIEditorWithOutFirebase

//  Created by admin on 11/09/2020.
//  Copyright © 2020 Signe. All rights reserved.


import SwiftUI

struct ContentView: View
{
    // Er subsribed til Repo(), så den bliver informeret når Repo() ændre sig
    @ObservedObject var repo: Repo = Repo() // 2-way binding
    
    var body: some View
    {
        // Skifter hele viewet ud med et nyt
        NavigationView
        {
            VStack
            {
                // kunne tilføje en ny note på repo objektet
                // Da den er subscribed til Repo klassen
                // Aflevere et nyt view tilbage med to closures
                // Action og Text er 2 metoder
                List
                {
                    // note in er hver objekt i listen
                    ForEach(self.repo.notes)
                    {
                        note in
                        // Er DetailViews constrocter vi har fat i
                        //NavigationLink(destination: DetailView(text: note.title, currentImage: note.image, currentID: note.id, repo: self.repo, currentNote: note))
                        NavigationLink(destination: DetailView(text: note.title, repo: self.repo, currentNote: note))
                        {
                            Text(note.title)
                            // kunne klikke på hvert objekt
                            // vis denne note i DetailView
                            
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Button ( action:
            {
                self.repo.notes.append(Note(title: "New Note", id: UUID()))
    
                print("Button press")
            })
            {
                Image(systemName: "plus").imageScale(.large)
            })
            
            .navigationBarTitle(Text("Notes"))
            // Ser ud til, at @Published kun fungerer, når ContentView bliver vist, som .onAppear() får til at ske med de 2 metoder
            .onAppear(){
                print("onappear")
                self.repo.notes.append(Note(title: "", id: UUID())) // tilføj
                self.repo.notes.remove(at: self.repo.notes.count-1) // slet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

