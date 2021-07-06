//
//  ContentView.swift
//  Heroes
//
//  Created by Ridoan Wibisono on 06/07/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            Home()
                .navigationTitle("Hero List")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    @StateObject var model = heroModel()
    
    var body: some View{
        VStack{
            List{
                ForEach(model.hero, id: \.objectID){ obj in
                    Text(model.getHero(obj: obj))
                        .onTapGesture {
                            model.openUpdateView(obj: obj)
                        }
                }
                .onDelete(perform: model.deleteHero(indexSet:))
            }
            
            .listStyle(InsetGroupedListStyle())
            
            HStack(spacing: 15){
                TextField("Insert Name", text:$model.txt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: model.writeHero){
                    Text("Save")
                }
            }
            .padding()
        }
        .sheet(isPresented: $model.isUpdate){
            UpdateView(model: model)
            
        }
    }
}

struct UpdateView : View {
    @ObservedObject var model : heroModel
    
    var body: some View{
        VStack(spacing: 20){
            TextField("Update Here", text: $model.updateTxt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: model.updateHero){
                Text("Update")
            }
        
        }
        .padding()
        
    }
    
}


class heroModel : ObservableObject {
    @Published var hero : [NSManagedObject] = []
    @Published var txt = ""
    @Published var isUpdate = false
    @Published var updateTxt = ""
    @Published var selectedObj = NSManagedObject()
    let context = persistentContainer.viewContext
    
    init() {
        readHero()
    }
    
    func readHero(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "HeroEntity")
        do {
            let results = try context.fetch(request)
            self.hero = results as! [NSManagedObject]
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func writeHero(){
        let entity = NSEntityDescription.insertNewObject(forEntityName: "HeroEntity", into: context)
        entity.setValue(txt, forKey: "name")
        
        do {
            try context.save()
            self.hero.append(entity)
            txt = ""
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteHero(indexSet : IndexSet){
        for index in indexSet {
            do {
                let obj = hero[index]
                context.delete(obj)
                try context.save()
                let index = hero.firstIndex(of: obj)
                hero.remove(at: index!)
                
            } catch  {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func updateHero(){
        
        let index = hero.firstIndex(of: selectedObj)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "HeroEntity")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            let obj = results.first{ (obj) -> Bool in
                if obj == selectedObj{return true}
                else{return false}
            }
            obj?.setValue(updateTxt, forKey: "name")
            try context.save()
            
            hero[index!] = obj!
            isUpdate.toggle()
            updateTxt = ""
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getHero(obj: NSManagedObject)->String{
        return obj.value(forKey: "name") as! String
    }
    
    func openUpdateView(obj:NSManagedObject){
        selectedObj = obj
        isUpdate.toggle()
    }
}
