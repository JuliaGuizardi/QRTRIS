module QRTRIS

"""

`QRTRIS.jl` is a Julia package for a fast QR update for A'A + λI matrices.

"""

__precompile__(false)

#dependencies
using LinearAlgebra

#auxiliars functions
include("auxiliars.jl")

"""
    QRupdate(A, λ)

Creates a mutable struct containing the QR factorization of 'A' and the value of 'λ'.

"""
mutable struct QRupdate
    A
    λ ::Float64
    function QRupdate(A, λ)
        qr!(A)
        new(A, λ)
    end
end

"""
    update!(QRup :: QRupdate, λ::Float64)

Calculates δ = λ_[k + 1] - λ_k and update the matrix using δ.
"""
update!(QRup :: QRupdate, λ::Float64)= 
begin
    if size(QRup.A, 1) <= 2
        error("ArgumentError : Method does not accept matrices smaller than 3 columns.")
    else
	δ = λ - QRup.λ
	delta_update!(QRup.A, δ) 
	QRup.λ = λ
	return QRup
    end
end

"""
    LinearAlgebra.ldiv!(QRup, b, x)

Solves the system A'Ax = b, considering 'A' an upper triangular matrix.
"""
LinearAlgebra.ldiv!(QRup, b, x)= 
begin
    m, n = size(QRup.A)
    
    solve_lower!(QRup.A, b, x, n)
    
    solve_upper!(QRup.A, x, n)
    
    return x
end

export QRupdate, update!, ldiv!

end
