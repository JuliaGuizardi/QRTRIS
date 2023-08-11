---
title: 'QRTRIS.jl: An optimized update to QR factorization'
tags:
  - Julia
  - matrix factorization
  - Levenberg-Marquardt method
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
date: 26 May 2019
bibliography: paper.bib
---

# Abstract

`QRTRIS.jl` is an optimized update to the QR factorization of matrices of the type ``A'A + \lambda I.`` The package update the value of ``\lambda`` in the main diagonal of the matrix ``A'A`` in such manner to gain better results sice it has a low running time and low memory cost. 

# Introduction

Talk about the LM method

# The update

Let $A \in \mathbb{R}^{m\times n},$ with $m \geq n.$ Consider the system 
	\begin{equation}
	(A'A+\lambda I) x = b, 
	\end{equation}
	where $\lambda \in \mathbb{R}^+, I \in \mathbb{R}^{n\times n}$ and $b \in \mathbb{R}^n.$ Setting $A=QR,$ a given $QR$ factorization of $A.$ We operate

$$\overline{Q}^TA_{\lambda} = \begin{bmatrix}
	Q^T & 0\\ 0 & I
	\end{bmatrix}\begin{bmatrix}
	A \\ \sqrt{\lambda} I
	\end{bmatrix}= \begin{bmatrix}
	Q^TA\\\sqrt{\lambda} I
	\end{bmatrix}.$$
	
We define $R' = \left[ R_1' 0 \right],$ then 

$$ \overline{Q}^TA_\lambda = \begin{bmatrix}
	R_1\\ 0\\\sqrt{\lambda} I
\end{bmatrix}.$$

Although $\overline{Q}$ is an orthogonal matrix, we still have to annihilate the $\sqrt{\lambda} $ in the lower main diagonal.

In order to do that we use Givens rotations matrices that can be seen in @golub . Defining $G_ij$ as the Givens matrix that zero the $a_ij$ element of $\left[ R_1, 0, \sqrt{\lambda} I \right].$

$$\left(\prod G_i\right)\overline{Q}^TJ_\lambda = \left(\prod G_i\right)\begin{bmatrix}
	R_1\\ 0\\\lambda I
	\end{bmatrix}$$
	
	$$\Rightarrow Q_{\lambda}^{T}J_\lambda = \begin{bmatrix}
	R_\lambda\\ 0
	\end{bmatrix}$$
	
	$$\Rightarrow J_\lambda = Q_{\lambda}\begin{bmatrix}
	R_\lambda\\ 0
	\end{bmatrix}.$$

	Com isso, o sistema (\ref{pr1}) pode ser visto como
	
	$$J^TJ+\lambda I=\begin{bmatrix}
	J^T &  \lambda I
	\end{bmatrix}\begin{bmatrix}
	J\\ \lambda I
	\end{bmatrix}$$	
		
	$$\Rightarrow J_\lambda^TJ_\lambda x = b $$
	 
	$$\Rightarrow \begin{bmatrix}
	R_{\lambda}^{T}\\0
	\end{bmatrix} Q_{\lambda}^{T} Q_{\lambda}\begin{bmatrix}
	R_\lambda\\0
	\end{bmatrix}x=b$$	
	
	\begin{equation}\label{pr2}
	\Rightarrow (R_{\lambda}^{T}R_{\lambda})x=b.
	\end{equation}

# Functionality

Explain how it store the update

# Installation and usage

Link to the site

# References

