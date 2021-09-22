import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(UIImage(named: "background")!.size, contentMode: .fill)
            
            VStack {
                Text("Account Creation")
                    .padding()
                    .foregroundColor(Color.green)
                TextField("First name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 300, alignment: .center)
                    .border(Color.black, width: 1)
                    .cornerRadius(15)
                    .background(Color.white)
                TextField("Last name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 300, alignment: .center)
                    .border(Color.black, width: 1)
                    .cornerRadius(15)
                    .background(Color.white)
                TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: 300, alignment: .center)
                    .border(Color.black, width: 1)
                    .cornerRadius(15)
                    .background(Color.white)
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
                    LoginView()
                }) {
                    Text("Create Account")
                }
                .frame(width: 200, alignment: .center)
                .padding()
                .cornerRadius(15)
                .background(Color(hue: 0.568, saturation: 1.0, brightness: 1.0))
                .foregroundColor(Color.black)
            }
            .padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
