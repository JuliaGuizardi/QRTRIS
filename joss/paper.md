---
title: 'QRTRIS.jl: An optimized update to QR factorization'
tags:
  - Julia
  - matrix factorization
  - Levenberg-Marquardt method
  - QR factorization
authors:
  - name: Júlia Guizardi
    orcid: 0009-0009-6393-7881
    affiliation: 1
  - name: Francisco N. C. Sobral
    orcid: 0000-0003-4963-0946
    affiliation: 1
affiliations:
 - name: Department of Mathematics, State University of Maringá, Paraná, Brazil
   index: 1
date: 11 August 2023
bibliography: paper.bib
---

# Abstract

`QRTRIS.jl` is an optimized update to the QR factorization of matrices of the type $A'A + \lambda I.$ The package update the value of $\lambda$ in the main diagonal of the matrix $A'A$ in such manner to gain better results sice it has a low running time and low memory cost. 

# Introduction

Talk about the LM method.

# The update

Let $A \in \mathbb{R}^{m\times n},$ with $m \geq n.$ Consider the system 

$$(A^TA+\lambda I) x = b,$$

where $\lambda \in \mathbb{R}^+, I \in \mathbb{R}^{n\times n}$ and $b \in \mathbb{R}^n.$ Setting $A=QR$ as a given $QR$ factorization of $A.$ We operate

$$\overline{Q}^TA_{\lambda} = \begin{bmatrix}
	Q^T & 0\\ 0 & I
	\end{bmatrix}\begin{bmatrix}
	A \\ \sqrt{\lambda} I
	\end{bmatrix}= \begin{bmatrix}
	Q^TA\\\sqrt{\lambda} I
	\end{bmatrix}.$$
	
We define $R^T = \left[ R_1^T \,\, 0 \right],$ then 

$$\overline{Q}^TA_\lambda = \begin{bmatrix}
	R_1\\ 0\\\sqrt{\lambda} I
\end{bmatrix}.$$

Although $\overline{Q}$ is an orthogonal matrix, we still have to annihilate $\sqrt{\lambda}$ in the lower main diagonal.

In order to do that we use Givens rotations matrices that can be seen in \cite{golub}. Defining $G_{ij}$ as the Givens matrix that zero the $a_{ij}$ element of $\begin{bmatrix} R_1\\ 0\\\lambda I \end{bmatrix}.$

$$\left(\prod G_i\right)\overline{Q}^TA_\lambda = \left(\prod G_i\right)\begin{bmatrix}
	R_1\\ 0\\\lambda I
	\end{bmatrix}$$

$$\Rightarrow A_\lambda = Q_{\lambda}\begin{bmatrix}
	R_\lambda\\ 0
	\end{bmatrix}.$$

We rewrite the first equation as
	
$$\begin{bmatrix}
	A^T &  \sqrt{\lambda} I
	\end{bmatrix}\begin{bmatrix}
	A\\ \sqrt{\lambda} I
	\end{bmatrix} x = b$$	
		

$$\Rightarrow A_\lambda^TA_\lambda x = b$$
	 

$$\Rightarrow \begin{bmatrix}
	R_{\lambda}^{T}\\0
	\end{bmatrix} Q_{\lambda}^{T} Q_{\lambda}\begin{bmatrix}
	R_\lambda\\0
	\end{bmatrix}x=b$$	
	

$$\Rightarrow (R_{\lambda}^{T}R_{\lambda})x=b.$$
    
	
Hence, we solve the lower triangular system $R_{\lambda}^{T}y=b$ and the upper triangular system  $R_{\lambda}x=y$ to solve the initial system.

Notice that it is not needed to factorize $A$ again, at every new value of $\lambda$ we just calculate the Givens rotations matrices.


# Functionality

Explain how it store the update

# Installation and usage

Link to the site

# References

\nocite{golub}
\nocite{meyer}
\nocite{nocedal}