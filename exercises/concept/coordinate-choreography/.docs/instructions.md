# Instructions

Your design team is moving from CSS transforms to Factor for some of
its layout work. To keep the rest of the team happy, you'll build
small, reusable transformations as quotations that take a 2D point
and return a 2D point.

A point is a 2-array `{ x y }`.

## 1. Translate the coordinates

Define `translate-2d` to take two values `dx` and `dy` off the stack
and return a quotation that translates a point by `(dx, dy)`.

```factor
{ 4 8 } 2 0 translate-2d call( p -- p' ) .
! => { 6 8 }
```

## 2. Scale the coordinates

Define `scale-2d` the same way, returning a quotation that scales a
point by `(sx, sy)`.

```factor
{ 6 -3 } 2 2 scale-2d call( p -- p' ) .
! => { 12 -6 }
```

## 3. Compose two transformations

Define `compose-transformations` to take two transformation
quotations `f` and `g` and return a single quotation that applies
`f` first and then `g`.

```factor
{ 0 1 } 2 0 translate-2d 2 2 scale-2d compose-transformations
call( p -- p' ) .
! => { 4 2 }
```

## 4. Apply a transformation

Define `apply-transformation` to take a point and a transformation
quotation off the stack and return the transformed point.

```factor
{ 4 8 } 2 0 translate-2d apply-transformation .
! => { 6 8 }
```

## 5. Affine transform

Define `affine-2d` to take four values `a`, `b`, `c`, `d` off the
stack and return a quotation that maps the point `{ x y }` to
`{ a*x+b*y c*x+d*y }`.

```factor
{ 1 2 } 1 2 3 4 affine-2d apply-transformation .
! => { 5 11 }
```

`affine-2d` captures four separate values into the returned
quotation. Try writing it with chained `curry` and you'll see why
*fry quotations* — `'[ … ]` with `_` placeholders — are the standard
tool for this job.

## 6. Transform many points at once

Define `transform-points` to take an array of points and a
transformation quotation, and return the array of transformed points.

```factor
{ { 0 0 } { 1 1 } { 2 2 } } 1 0 translate-2d transform-points .
! => { { 1 0 } { 2 1 } { 3 2 } }
```
