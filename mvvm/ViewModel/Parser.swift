import Foundation

public class Parser {
    //Create a mechanism to Bind the view to the view's model, will return the data refreshed
    var refreshData = { () -> () in}
    //Data (array)
    var dataArray : [UserDetails] = []{
        
        didSet{
            refreshData()
        }
    }
    
    
    func loadUser(){
        let urlStr = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlStr) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {( data, response, error) in
            guard error == nil, let data = data  else { return }
            
       do{
           self.dataArray = try JSONDecoder().decode([UserDetails].self, from: data)
           
       } catch{
                print("Error",error)
            }
        }
        task.resume()
    }
    

    
} 
