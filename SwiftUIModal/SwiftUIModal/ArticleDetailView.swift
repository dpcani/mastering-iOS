import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay (
                        HStack {
                            Spacer()
                            VStack {
                                Button {
                                    self.showAlert = true
                                } label: {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 20)
                                .padding(.top, 40)
                                Spacer()
                            }
                        }
                    )
                    .alert("Reminder", isPresented: $showAlert, actions: {
                        Button {
                            dismiss()
                        } label: {
                            Text("Yes")
                        }
                        Button(role: .cancel) {
                            
                        } label: {
                            Text("No")
                        }
                    }, message: {
                        Text("Are you sure are fisnished reading the article?")
                    })
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}

