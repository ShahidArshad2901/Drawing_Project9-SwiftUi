//
//  ContentView.swift
//  Drawing_Project9
//
//  Created by Dev on 28/02/2023.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let orignalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 3))
            
            let rotatedPetal = orignalPetal.applying(position)
            
            path.addPath(rotatedPetal)
            
        }
        return path
    }
    
}

struct ContentView: View {
    @State private var petalOffset = -40.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .stroke(.yellow, lineWidth: 1)
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40.0...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...300)
                .padding(.horizontal)
        }
        .background(.black)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
