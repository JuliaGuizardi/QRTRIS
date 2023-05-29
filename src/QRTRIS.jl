"""

`QRTRIS.jl` is a Julia package for a fast QR update for A'A + λI matrices.

"""



#dependencies
using LinearAlgebra

#auxiliars functions
include("auxiliars.jl")

"""
    LMFactorization(A, λ0)

Creates a mutable struct containing the QR factorization of 'A' and the value of 'λ0'.

"""
mutable struct LMFactorization
    A
    λ0 ::Float64
    function LMFactorization(A, λ0)
        qr!(A)
        new(A, λ0)
    end
end

"""
    update!(LMFact :: LMFactorization, λ::Float64)

Calculates δ = λ_[k + 1] - λ_k and update the matrix using δ.
"""
update!(LMFact :: LMFactorization, λ::Float64)= 
begin
    if size(LMFact.A, 1) <= 2
        error("ArgumentError : Method does not accept matrices smaller than 3 columns.")
    else
	δ = λ - LMFact.λ0
	delta_update!(LMFact.A, δ) 
	LMFact.λ0 = λ
	return LMFact
    end
end

"""
    LinearAlgebra.ldiv!(LMFact :: LMFactorization, b :: Vector{Float64}, x :: Vector{Float64})

Solves the system A'Ax = b, considering 'A' an upper triangular matrix.
"""
LinearAlgebra.ldiv!(LMFact, b, x)= 
begin
    m, n = size(LMFact.A)
    
    solve_lower!(LMFact.A, b, x, n)
    
    solve_upper!(LMFact.A, x, n)
    
    return x
end

export LMFactorization, update!
