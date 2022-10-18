//
//  ImageFrame.swift
//  Drawings
//
//  Created by Sonja Ek on 18.10.2022.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct Frame: View {
    let frameStyle: String

    var body: some View {
        VStack {
            Group {
                if frameStyle == "Capsule" {
                    Capsule()
                        .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                        .frame(width: 200, height: 300)
                } else {
                    Text("Hello World")
                        .frame(width: 300, height: 300)

                        .if(frameStyle == "Uncropped") { view in
                            view.border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
                        }

                        .if(frameStyle == "Cropped") { view in
                            view.border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
                        }
                }
            }
        }
    }
}

struct WholeImage: View {
    var body: some View {
        Image("Example")
            .resizable()
            .scaledToFit()
    }
}

struct ImageFrame: View {
    @State private var showingFrame = true
    @State private var frameStyle = "Uncropped"

    let frameStyles = ["Uncropped", "Cropped", "Capsule"]

    var body: some View {
        NavigationView {
            VStack {
                Group {
                    if showingFrame {
                        Frame(frameStyle: frameStyle)

                        Picker("Select frame style", selection: $frameStyle){
                            ForEach(frameStyles, id: \.self) {
                                Text($0)
                            }
                        }
                            .pickerStyle(.segmented)
                            .padding()

                    } else {
                        WholeImage()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(showingFrame ? "Image View" : "Frame view") {
                        showingFrame.toggle()
                    }
                }
            }
        }
    }
}

struct ImageFrame_Previews: PreviewProvider {
    static var previews: some View {
        ImageFrame()
    }
}
