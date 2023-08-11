# Theory

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

In order to do that we use Givens rotations matrices that can be seen in [2]. Defining $G_{ij}$ as the Givens matrix that zero the $a_{ij}$ element of $\begin{bmatrix} R_1\\ 0\\\lambda I \end{bmatrix}.$

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

The algorithm receives the matrix $A$ and a starting $\lambda_0=0.0$ to form a struct with the $QR$ factorizarion of $A$ calculated by the `LinearAlgebra` which stores $R$ in the upper part of the matrix. 

Receiving a new value for $\lambda,$ $\lambda_1\geq0,$ the algorithm uses the lower part of the $QR$ factorization matrix, where would have informations about $Q$ that are not needed here, according to what we have studied above, to storage the values used during the calculation of $R_{\lambda_1}.$ 

At this point we can calculate the solution to the following system

$$\Rightarrow (R_{\lambda_1}^{T}R_{\lambda_1})x=b,$$

that is equivalent of 

$$(A^TA+\lambda_1 I) x = b.$$

When a $\lambda_2\geq\lambda_1$ is given, instead of working with the initial $R,$ the algorithm computes a value for $\delta=\lambda_2-\lambda_1.$ Followed by updating $R_{\lambda_1}$ using $\delta$ in order to achieve $R_{\lambda_2}.$

# References

[1] Wright, Stephen J., and Nocedal J. Numerical optimization. Springer Science, 1999.

[2] Golub, Gene H., and Charles F. Van Loan. Matrix computations. JHU press, 2013.

[3] Meyer, Carl D. Matrix analysis and applied linear algebra. Siam, 2000.