//
//  Note.swift
//  SwiftUIEditorWithOutFirebase

//  Created by admin on 11/09/2020.
//  Copyright © 2020 Signe. All rights reserved.
//

import SwiftUI

// Man skal kunne genkende noter på deres id
class Note: Identifiable
{
    // Automatisk unik genereret id med UUID
    // Er et swift objekt så derfor er der paranteser
    var id = UUID()
    var title: String
    var image: Image?
    
    
    init(title: String, image: Image? = nil, id:UUID)
    {
        self.title = title
        self.image = image
        self.id = id
    }
}

