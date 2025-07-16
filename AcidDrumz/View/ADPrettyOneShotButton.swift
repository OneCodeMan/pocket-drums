//
//  ADPrettyOneShotButton.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-16.
//

/**
 
 USAGE:
 
 BrutoCircleButton(text: .constant("OK"))
         .frame(width: 80)
         .font(.system(size: 30))
         .fontWeight(.black)
 
 */

import SwiftUI

struct BrutoButtonStyle: ButtonStyle {
    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct BrutoButton: View {
    
    // Public
    @Binding var text: String
    
    @State var backgroundColor: Color
    @State var accentColor: Color
    @State var shadowOpacity: CGFloat
    @State var strokeWidth: CGFloat
    var action: () -> Void
    
    // Private
    private let offset: CGFloat = 4
    @State private var tapped = false
    
    init(text: Binding<String>,
         backgroundColor: Color = .red,
         accentColor: Color = .primary,
         shadowOpacity: CGFloat = 1,
         strokeWidth: CGFloat = 6,
         action: @escaping () -> Void = {}) {
        _text = text
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.shadowOpacity = shadowOpacity
        self.strokeWidth = strokeWidth
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Rectangle()
                .background(backgroundColor).opacity(shadowOpacity)
                .cornerRadius(5)
                .offset(x: tapped ? 0 : offset, y: tapped ? 0 : offset)
                .overlay(
                    ZStack {
                        Rectangle()
                            .stroke(accentColor, lineWidth: strokeWidth)
                            .background(backgroundColor)
                            .cornerRadius(5)
                        
                        Text(text)
                            .foregroundColor(accentColor)
                    }
                    
                )
                .offset(x: tapped ? offset : 0, y: tapped ? offset : 0)
        }
        .buttonStyle(BrutoButtonStyle())
        ._onButtonGesture { _ in
            // Haptic.shared.selectionChanged()
            tapped.toggle()
        } perform: {
            // Haptic.shared.selectionChanged()
        }
    }
}

struct BrutoButton_Previews: PreviewProvider {
    static var previews: some View {
        BrutoButton(text: .constant("33"),
                    backgroundColor: .white,
                    strokeWidth: 8)
        .frame(maxWidth: 80, maxHeight: 80)
        .font(.system(.title, design: .rounded, weight: .black))
    }
}

struct BrutoImageButton: View {
    
    // Public
    @State var image: Image
    @State var imagePrimaryColor: Color
    @State var imageSecondaryColor: Color
    @Binding var text: String
    @State var backgroundColor: Color
    @State var accentColor: Color
    @State var shadowOpacity: CGFloat
    @State var strokeWidth: CGFloat
    var action: () -> Void
    
    // Private
    private let offset: CGFloat = 4
    @State private var tapped = false
    
    init(image: Image,
         imagePrimaryColor: Color = .primary,
         imageSecondaryColor: Color = .secondary,
         text: Binding<String>,
         backgroundColor: Color = .blue,
         accentColor: Color = .primary,
         shadowOpacity: CGFloat = 1,
         strokeWidth: CGFloat = 6,
         action: @escaping () -> Void = {}) {
        self.image = image
        self.imagePrimaryColor = imagePrimaryColor
        self.imageSecondaryColor = imageSecondaryColor
        _text = text
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.shadowOpacity = shadowOpacity
        self.strokeWidth = strokeWidth
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Rectangle()
                .background(backgroundColor).opacity(shadowOpacity)
                .cornerRadius(5)
                .offset(x: tapped ? 0 : offset, y: tapped ? 0 : offset)
                .overlay(
                    ZStack {
                        Rectangle()
                            .stroke(accentColor, lineWidth: strokeWidth)
                            .background(backgroundColor)
                            .cornerRadius(5)
                        
                        HStack(spacing: 8) {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 30, maxHeight: 30)
                                .fontWeight(.medium)
                                .foregroundStyle(imagePrimaryColor, imageSecondaryColor)
                            
                            Text(text)
                                .foregroundColor(accentColor)
                        }
                        .padding(.horizontal)
                    }
                    
                )
                .offset(x: tapped ? offset : 0, y: tapped ? offset : 0)
        }
        .buttonStyle(BrutoButtonStyle())
        ._onButtonGesture { _ in
            // Haptic.shared.selectionChanged()
            tapped.toggle()
        } perform: {
            // Haptic.shared.selectionChanged()
        }
    }
}

#Preview {
    BrutoImageButton(image: .init(systemName: "apple.logo"), text: .constant("Button with Image"))
        .frame(width: 250, height: 50)
        .font(.system(.title3, design: .rounded, weight: .bold))
}

// TODO: Make this square
struct BrutoCircleButton: View {
    
    // Public
    @Binding var text: String?
    @Binding var image: Image?
    @State var backgroundColor: Color
    @State var accentColor: Color
    @State var shadowOpacity: CGFloat
    @State var strokeWidth: CGFloat
    var action: () -> Void
    
    // Private
    private let offset: CGFloat = 3
    @State private var tapped = false
    
    init(text: Binding<String?> = .constant(nil),
         image: Binding<Image?> = .constant(nil),
         backgroundColor: Color = .blue,
         accentColor: Color = .primary,
         shadowOpacity: CGFloat = 1,
         strokeWidth: CGFloat = 5,
         action: @escaping () -> Void = {}) {
        _text = text
        _image = image
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.shadowOpacity = shadowOpacity
        self.strokeWidth = strokeWidth
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .fill(accentColor.opacity(shadowOpacity))
                .offset(x: tapped ? 0 : offset, y: tapped ? 0 : offset)
            
                .overlay(
                    ZStack {
                        Circle()
                            .fill(backgroundColor)
                            .overlay{
                                Circle()
                                    .stroke(accentColor, lineWidth: strokeWidth)
                            }
                        
                        if let image {
                            image
                                .fontWeight(.medium)
                        } else if let text {
                            Text(text)
                                .foregroundColor(accentColor)
                        }
                    }
                )
                .offset(x: tapped ? offset : 0, y: tapped ? offset : 0)
        }
        .padding(.vertical, 6)
        .buttonStyle(BrutoButtonStyle())
        ._onButtonGesture { _ in
            // Haptic.shared.selectionChanged()
            tapped.toggle()
        } perform: {
            print("perform clause gone into")
            // Haptic.shared.selectionChanged()
        }
    }
}
