QRTRIS
========================================

This package implements an optimized update to $QR$ factorization of matrices of the type ``A'A + \lambda I.`` The package update the value of ``\lambda`` in the main diagonal of the matrix ``A'A`` in such manner to gain better results since it has a low running time and low memory cost. 


The package was developed with the main motivation of being used in the Levenberg-Marquardt algorithm,  used to solve non-linear least squares problems that needs to solve systems as described above.


## Performance


## Installation
`QRTRIS` is a package registered in the `General repository`. Consequently, in order to install  `QRTRIS` type in `REPL`:

```julia
julia> ] add QRTRIS
```

## Credits

* Júlia Guizardi
* Francisco Nogueira Calmon Sobral (Advisor)

This package creators were partially supported by **Fundo Nacional de Desenvolvimento da Educação.**

General doubts can be sent to `jguizardi@ime.usp.br´.

## References

[1] Wright, Stephen J., and Nocedal J. Numerical optimization. Springer Science, 1999.

[2] Golub, Gene H., and Charles F. Van Loan. Matrix computations. JHU press, 2013.

[3] Meyer, Carl D. Matrix analysis and applied linear algebra. Siam, 2000.