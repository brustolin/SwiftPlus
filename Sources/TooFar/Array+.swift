public typealias 📚<TYPE> = Array<TYPE>


public extension 📚 {

    func 🗺️<T>(transform: (Element) throws -> T) rethrows -> [T] {
        try self.map(transform)
    }

}
