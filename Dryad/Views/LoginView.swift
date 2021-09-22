import SwiftUI

struct LoginView: View {
    @State private var isShowingDetailView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                 VStack {
                     Image("background")
                         .resizable()
                         .aspectRatio(UIImage(named: "background")!.size, contentMode: .fill)
                     Text("Dryad")
                         .padding()
                         .foregroundColor(Color.green)
                     TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                         .padding()
                         .frame(width: 300, alignment: .center)
                         .border(Color.black, width: 1)
                         .cornerRadius(15)
                         .background(Color.white)
                     TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                         .padding()
                         .frame(width: 300, alignment: .center)
                         .border(Color.black, width: 1)
                         .cornerRadius(15)
                         .background(Color.white)
                     
                     
                     Button(action: {
                         
                     })
                     {
                         Text("Login")
                     }
                     NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
                     Button("Tap to show detail") {
                         self.isShowingDetailView = true
                     }
                 }
                 .navigationTitle("Login")
             }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
