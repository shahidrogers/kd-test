struct User {
    //example User struct
}

class NetworkAdapter {
    
    class func getAuthToken(email: String, password: String) -> String? {
        //example of failure
        if email.isEmpty { return nil }
        
        //example of success (if 200)
        return "token"
    }
    
    class func getUserProfile(token: String) -> User? {
        //example of failure
        if(token.isEmpty){
            return nil
        }
        
        //example of success (if 200)
        return User()
    }
    
    class func checkIfUserAvatarChanged(){
    }
}

// ViewController
class ViewController{
    func viewDidLoad(){
        
        // begin by invoking getAuthToken
        if let token = NetworkAdapter.getAuthToken(email: "test@gmail.com", password: "test") {
            //success(200) so continue
            if let user = NetworkAdapter.getUserProfile(token: token) {
                //success(200) so continue
                // use user for something? then continue as instructed..
                NetworkAdapter.checkIfUserAvatarChanged()
            }
        }
    }
}
