import Testing
import ManipulationPlus

@Suite("Manipulation+ tests")
struct ManipulationPlusTests {
    
    @Test("ManipulationPlus")
    func nilCoalescingOperator() async throws {
        var numberOfCalls = 0
        
        class TypeA {
            static var numberOfCalls = 0
            init() {
                Self.numberOfCalls += 1
            }
        }
        
        class TypeB : TypeA {}
        
        let b = TypeB()
        
        #expect((b ??? TypeA()) is TypeB)
        #expect(TypeA.numberOfCalls == 1)
    }
}
