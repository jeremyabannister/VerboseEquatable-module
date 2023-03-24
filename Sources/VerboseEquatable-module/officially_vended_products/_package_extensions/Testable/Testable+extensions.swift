//
//  Testable+extensions.swift
//  
//
//  Created by Jeremy Bannister on 3/24/23.
//

///
extension Testable where Self: VerboseEquatable {
    
    ///
    @discardableResult
    public func assertVerboseEqualTo
        (_ value: ()->Self)
    throws -> Self {
        
        ///
        try self.assertVerboseEqual(to: value())
    }
    
    ///
    @discardableResult
    public func assertVerboseEqual
        (to other: Self)
    throws -> Self {
        
        ///
        try verboseCompare(self, to: other)
        
        ///
        return self
    }
}

///
fileprivate extension Testable {
    
    ///
    func verboseCompare
        <Value: VerboseEquatable>
        (_ lhs: Value,
         to rhs: Value)
    throws {
        
        ///
        do {
            
            ///
            try lhs.verboseEquals(rhs)
            
        ///
        } catch let error as VerboseEqualityError {
            
            ///
            throw ErrorMessage("Not equal: [\n\(error.discrepancies.reduce(into: "") { $0 += "\\.\($1.keyPath.joined(separator: ".")): (\($1.lhsDescription), \($1.rhsDescription))\n" })]")
            
        ///
        } catch {
            
            ///
            throw ErrorMessage("Not equal: (\(lhs), \(rhs))")
        }
    }
}

///
extension Testable {
    
    ///
    @discardableResult
    public func assert
        <Value: VerboseEquatable>
        (_ keyPath: KeyPath<Self, Value>,
         verboseEquals value: Value)
    throws -> Self {
        
        ///
        try verboseCompare(self[keyPath: keyPath], to: value)
        
        ///
        return self
    }
}
