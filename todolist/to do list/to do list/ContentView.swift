//
//  ContentView.swift
//  to do list
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var taskName: String = ""
    @State private var taskNumber: Int = 0
    @State private var alert: Bool = false
    
    var body: some View {
        //helps align or set the title view
        NavigationView{
            //makes the items align vertically
            VStack {
                //lists the number of tasks
                Text("Number of Tasks: \(taskNumber)")
                    //aligns the frame
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //adds padding
                    .padding()
                //Where you put in the text
                TextField("Enter task name", text: $taskName)
                    //adds padding
                    .padding()
                    //creates a border
                    .border(Color.gray, width: 0.5)
                    //sets the frames height and width
                    .frame(width: 375, height: 50)
                    //makes the items align horizontally
                HStack{
                    //add task button
                    Button("add task", action: addTask)
                        //adds padding
                        .padding(10)
                        //makes the text inside white
                        .foregroundColor(.white)
                        //makes it so when text is inputed in the textfield, the background turns blue
                        .background(taskName.isEmpty ? Color.gray : Color.blue)
                        //makes the buttons curved
                        .cornerRadius(6)

                    //alerts when the text trying to be inputted is empty
                    .alert(isPresented: $alert) {
                        //Shows the text for the alert
                        Alert(
                            title: Text("Cannot enter empty task"),
                            message: Text("Please input text inside")
                        )
                    }
                    //button for removing all tasks
                    Button("remove all tasks", action: removeAllTasks)
                        //adds padding
                        .padding(10)
                        //makes it so when text is inputed in the textfield, the background turns red
                        .background(tasks.isEmpty ? Color.gray : Color.red)
                        //makes the corners rounded
                        .cornerRadius(6)
                        //makes the text white
                        .foregroundColor(.white)
                }
                //creates a list
                List{
                    //It displays the text when it's inputed in the textfield
                    ForEach(tasks, id: \.self){ item in
                        Text(item)
                    }
                    //deletes the task
                    .onDelete(perform: deleteItem)
                }
                //makes it so everyhing appears on the top
                Spacer()
                
            }
            //Title
            .navigationBarTitle("To-Do List")

        }

    }
    //preforms the add task button
    func addTask(){
        //if the information inputted is empty, make the alert pop up
        if taskName.isEmpty{
            alert = true
        } else{
            //get the tasks inputted
            tasks.append(taskName)
            //adds 1 to the task number
            taskNumber += 1
            //returns empty after add button is pressed
            taskName = ""
        }
    }
    
    //preforms the deleteitem button
    func deleteItem(offset: IndexSet){
        //removes the item
        tasks.remove(atOffsets: offset)
        //subtracts 1 from the task number
        taskNumber -= 1
    }
    func removeAllTasks(){
        //removes all
        tasks.removeAll()
        //returns the number of tasks back to 0
        taskNumber = 0
    }

}


#Preview {
    ContentView()
}
