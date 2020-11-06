import Foundation

/// This is the element for the sources compilation build phase.
public final class PBXSourcesBuildPhase: PBXBuildPhase {
    override public var buildPhase: BuildPhase {
        .sources
    }

    override func isEqual(to object: Any?) -> Bool {
        guard let rhs = object as? PBXSourcesBuildPhase else { return false }
        return _isEqual(to: rhs)
    }
}

extension PBXSourcesBuildPhase: PlistSerializable {
    // MARK: - PlistSerializable

    func plistKeyAndValue(proj: PBXProj, reference: String) throws -> (key: CommentedString, value: PlistValue) {
        var dictionary: [CommentedString: PlistValue] = try plistValues(proj: proj, reference: reference)
        dictionary["isa"] = .string(CommentedString(PBXSourcesBuildPhase.isa))
        return (key: CommentedString(reference, comment: "Sources"), value: .dictionary(dictionary))
    }
}
