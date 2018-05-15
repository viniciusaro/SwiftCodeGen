import Foundation

extension Sequence {
    func groupBy<Key: Hashable>(_ groupClosure: (Element) -> Key) -> [Key: [Element]] {
        var map: [Key: [Element]] = [:]
        for element in self {
            let key = groupClosure(element)
            var group = map[key] ?? []
            group.append(element)
            map[key] = group
        }
        return map
    }
}

extension Sequence where Element: Equatable {
    func subarrayAfterSeparatatorIfPresent(_ separator: Element) -> [Element] {
        var new: [Element] = []
        var found = false
        for element in self {
            if found {
                new.append(element)
            }
            if element == separator {
                found = true
            }
        }

        if found {
            return new
        }
        return Array(self)
    }
}
