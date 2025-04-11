import SwiftUI

struct DefaultButton: View {
    
    var action: () -> Void = {}
    var isFill: Bool = true
    var title: String = ""
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isFill ? Color("TextColor") : Color(UIColor.clear))
                .foregroundStyle(isFill ? Color("BackgroundColor") : Color("TextColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isFill ? Color.clear : Color("TextColor"), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 50)
                .padding(10)
        }
    }
}

#Preview {
    DefaultButton(action: {
        //
    }, isFill: true, title: "Привет")
} 