import SwiftUI

struct LoginView: View {
    @State private var isShowingDetailView = false
    @State private var isShowingHomeView = false
    
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
                     
                     NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true).navigationBarHidden(true), isActive: $isShowingHomeView) {
                            EmptyView()
                     }
                     
                     Button(action: {
                         isShowingHomeView = true
                     }) {
                         Text("Login")
                     }
                     NavigationLink(destination: SignInView(), isActive: $isShowingDetailView) {
                            EmptyView()
                         }
                     Button("No account, no problem, click here to create one") {
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
