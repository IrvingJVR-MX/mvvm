import XCTest
@testable import mvvm
class mvvmTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    
    func testUSerFormModel_canCreateInstance(){
        let instance = UserDetails (userId: 0, id: 1, title: "Making unit test", body: "unit test")
        //XCTAssertNotNil(instance)
        XCTAssertEqual(1, instance.userId)
    }
    

   
    
}
