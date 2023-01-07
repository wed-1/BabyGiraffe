//
//  BabyToyView.swift
//  BabyGiraffe
//
//  Created by WadiahAlbuhairi on 09/06/1444 AH.
//
import SwiftUI

struct BabyToyView: View {
    
    
    @StateObject private var viewModel = ToyViewModel()
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location) }
        
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmWhereToyWasDropped()} }
        
        
    }
    
    
    var body: some View {
        ZStack {
            Color("BG").ignoresSafeArea(.all)
            
            Image("My project (8)")
                .resizable()
                .frame(width: 895 , height: 500)
                .offset(x:0 , y: -500)
            
            Text("Help Giraffe to choose the correct color")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.largeTitle)
                .offset(x:0 , y: -500)
            
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.toyContainers, id: \.id) { toy in
                    ToyContainer(
                        toy: toy,
                        viewModel: viewModel
                    )
                }
            }
            if let currentToy = viewModel.currentToy {
                DraggableToy(
                    toy: currentToy,
                    position: viewModel.currentPosition,
                    gesture: drag)
                .opacity(viewModel.draggableToyOpacity)
            }
            Image("GR")
                .resizable()
                .frame(width: 383.23, height: 381)
                .offset(x:300, y:400)
        }
        
        .onAppear {
            viewModel.setNextToy()
        }
        .alert(
            
            Text("Congratulations, you won! 🎉"),
            isPresented: $viewModel.isGameOver,
            actions: {
                Button("Close") {
                    withAnimation {
                        viewModel.generateNewGame()}
                }
            },
            message: {
                Text("Number of attemps: \(viewModel.attempts)")
            }
            
        )
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}
