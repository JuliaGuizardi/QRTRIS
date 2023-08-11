# Tutorial

```@setup docrepl
```
## Installation

This package is supported just for Julia version 1.0. Consequently, 
it uses package 3.0. Currently `RAFF` is registered in [General Julia Registers](https://github.com/JuliaRegistries), so the 
package can be installed using the Julia package manager.
From the Julia REPL, type `]` to enter into Pkg REPL mode and run:

```
pkg> add QRTRIS
```

At next, we show the three programs that are avaiable in the `QRTRIS` package and how to use them.

## Create the object

First we set up 

```@repl docrepl
using QRTRIS
``` 
The package supports matrices tyoe ``m \times n`` with ``m \geq n >2.`` We define a matrix ``A`` and a starting ``\lambda \geq 0.``

```@repl docrepl
A = [ 1.0  -5.0   4.3
      2.5   10.0 -1.0
     -7.5   3.0   2.5
      6.0   5.2   4.5
      0.0  -3.0   9.5
     -4.0  -7.0  -0.8]
```

Now, we set ``\lambda = 0.0`` and run:

```@repl docrepl
object = QRupdate(A, 0.0)
```

This creates an object of the type `QRupdate`. We call 

```@repl docrepl
object.A
```

and 

```@repl docrepl
object.λ
```

In the first moment we obtain the QR factorization of ``A`` calculated by `LinearAlgebra` and the current value of ``\lambda.``  

## Update the matrix

With the goal of update the value of ``\lambda`` in ``A'A + \lambda I``. More of the mathmatic behind the program can be seen in [Theory section](theory.md).

```@repl docrepl
update!(object, 0.5)
```

```@repl docrepl
model(x, θ) = θ[1] * x[1] + θ[2] * x[2] + θ[3]
```

Now the upper part of the matrix `object.A` contains ``R``, such that solving  ``(A'A + \lambda I)x = b`` is equivalent to ``R'R x = b``. Moreover `object.λ` contains the last value of ``\lambda,`` in this case ``.5.``

## Solve the system

Now we compute the value of ``b.`` Naturally it needs to be a vector of size ``n.``

```@repl docrepl
b = [ 10.0 
      4.5
     -9.5]
```

As much we need a vector ``x`` to storage the solution of the system so we keep ``b`` intact.

```@repl docrepl
x = zeros(3)
```

```@repl docrepl
ldiv!(object, b, x)
```

## Updating the $\lambda$

To solve the system with a new value of ``\lambda`` we need to update the matrix and then solve the system.

```@repl docrepl
update!(object, 1.0)
```

```@repl docrepl
ldiv!(object, b, x)
```