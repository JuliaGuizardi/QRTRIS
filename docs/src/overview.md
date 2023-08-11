
# Overview


The package has the aim of solving systems of the type ``(A'A + \lambda I)x = b,`` where ``\lambda > 0`` is a growing value. Mainly with the ideia of solving the Levenberg-Marquardt problem, where ``A`` is the Jacobian of the objective value function.All the code was
made in [Julia language](https://julialang.org), version 1.8.5.

The idea is based on the update to the QR factorization found in [1] with a twist. All the updates of ``\lambda`` are made using a single matrix and no addtional memory, hence the low running time and low memory cost. 
 

## Developed by

This project was developed at the Department of Mathematics, State University of Maringá, Brazil.

* Júlia Guizardi
* Francisco Nogueira Calmon Sobral (Advisor)

This package creators were partially supported by **Fundo Nacional de Desenvolvimento da Educação.**


## Citing this package


