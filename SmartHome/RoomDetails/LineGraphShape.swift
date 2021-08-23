import SwiftUI

// https://stackoverflow.com/q/64157672
struct LineGraphVector: VectorArithmetic {
    var points: [CGPoint.AnimatableData]
    
    static func + (lhs: LineGraphVector, rhs: LineGraphVector) -> LineGraphVector {
        return add(lhs: lhs, rhs: rhs, +)
    }
    
    static func - (lhs: LineGraphVector, rhs: LineGraphVector) -> LineGraphVector {
        return add(lhs: lhs, rhs: rhs, -)
    }
    
    static func add(lhs: LineGraphVector, rhs: LineGraphVector, _ sign: (CGFloat, CGFloat) -> CGFloat) -> LineGraphVector {
        let maxPoints = max(lhs.points.count, rhs.points.count)
        let leftIndices = lhs.points.indices
        let rightIndices = rhs.points.indices
        
        var newPoints: [CGPoint.AnimatableData] = []
        (0 ..< maxPoints).forEach { index in
            if leftIndices.contains(index) && rightIndices.contains(index) {
                // Merge points
                let lhsPoint = lhs.points[index]
                let rhsPoint = rhs.points[index]
                newPoints.append(
                    .init(
                        sign(lhsPoint.first, rhsPoint.first),
                        sign(lhsPoint.second, rhsPoint.second)
                    )
                )
            } else if rightIndices.contains(index), let lastLeftPoint = lhs.points.last {
                // Right side has more points, collapse to last left point
                let rightPoint = rhs.points[index]
                newPoints.append(
                    .init(
                        sign(lastLeftPoint.first, rightPoint.first),
                        sign(lastLeftPoint.second, rightPoint.second)
                    )
                )
            } else if leftIndices.contains(index), let lastPoint = newPoints.last {
                // Left side has more points, collapse to last known point
                let leftPoint = lhs.points[index]
                newPoints.append(
                    .init(
                        sign(lastPoint.first, leftPoint.first),
                        sign(lastPoint.second, leftPoint.second)
                    )
                )
            }
        }
        
        return .init(points: newPoints)
    }
    
    mutating func scale(by rhs: Double) {
        points.indices.forEach { index in
            self.points[index].scale(by: rhs)
        }
    }
    
    var magnitudeSquared: Double {
        return 1.0
    }
    
    static var zero: LineGraphVector {
        return .init(points: [])
    }
}

struct LineGraphShape: Shape {
    var points: [CGPoint]
    let closePath: Bool
    
    init(points: [CGPoint], closePath: Bool) {
        self.points = points
        self.closePath = closePath
    }
    
    var animatableData: LineGraphVector {
        get { .init(points: points.map { CGPoint.AnimatableData($0.x, $0.y) }) }
        set { points = newValue.points.map { CGPoint(x: $0.first, y: $0.second) } }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: points.first ?? .zero)
            path.addLines(points)
            
            switch (closePath, points.first, points.last) {
            case (true, .some(let firstPoint), .some(let lastPoint)):
                path.addLine(to: .init(x: lastPoint.x, y: rect.height))
                path.addLine(to: .init(x: 0.0, y: rect.height))
                path.addLine(to: .init(x: 0.0, y: firstPoint.y))
                path.closeSubpath()
            default:
                break
            }
        }
    }
}
