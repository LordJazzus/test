import SwiftUI

var ownername = "Ethan Hunt"
var ownerphoto = "ownerphoto"

var objectname = "Area51"
var objectphoto = "objectphoto"


struct item: Identifiable {
    
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
    let navMenu :  String

}

struct MainMenu: View {

    let items = [
        
        item(title: "Menu 1", image: "img1", imgColor: .orange, navMenu: "Menu1"),
        item(title: "Menu 2", image: "img2", imgColor: .orange, navMenu: "Menu2"),
        item(title: "Menu 3", image: "img3", imgColor: .orange, navMenu: "Menu3"),
    ]
    
    let spacing: CGFloat = 10
    @State private var numbersOfColumns = 3
    
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numbersOfColumns)
        
        VStack {
            HStack {
            personView
            
            objectView
            }
            LazyVGrid(columns: columns, spacing: spacing)   {
                ForEach(items) { item in
                    NavigationLink(destination: Text(item.navMenu)) {
                        ItemView(item: item )
                }
            }
        }
        .navigationTitle("")
    }
    
    var personView: some View {
        VStack {
            Text(ownername)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .medium, design: .rounded))
            Image(ownerphoto)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))

        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
    var objectView: some View {
        VStack {
            Text(objectname)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .medium, design: .rounded))
            Image(objectphoto)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))

        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
}


struct ItemView: View {
    
    let item: item
    
    var body: some View {
        
        GeometryReader { reader in
            let fontSize = min(reader.size.width * 0.2, 28)
            let imageWidth: CGFloat = min(50, reader.size.width * 0.6)
            VStack(spacing: 5) {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.imgColor)
                    .frame(width: 80)
                Text(item.title)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
                
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }
        .frame(height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

