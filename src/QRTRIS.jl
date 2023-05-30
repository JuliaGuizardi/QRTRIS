"""

`QRTRIS.jl` is a Julia package for a fast QR update for A'A + λI matrices.

"""



#dependencies
using LinearAlgebra

#auxiliars functions
include("auxiliars.jl")

"""
    QRupdate(A, λ0)

Creates a mutable struct containing the QR factorization of 'A' and the value of 'λ0'.

"""
mutable struct QRupdate
    A
    λ0 ::Float64
    function QRupdate(A, λ0)
        qr!(A)
        new(A, λ0)
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
	δ = λ - QRup.λ0
	delta_update!(QRup.A, δ) 
	QRup.λ0 = λ
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

export QRupdate, update!
