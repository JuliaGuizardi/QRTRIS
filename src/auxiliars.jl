"""
    cos_sin(a, b)
    
Compute the value of the cossin and sin to make the Givens rotation.
    
"""
cos_sin(a, b)=
begin
    c = a / (sqrt(a ^2 + b^2))
    s = - b / (sqrt(a ^2 + b^2))
    return c, s
end

"""
    givens_rotations(row, aux1, aux2)

It rotates the 'row' and the 'aux1' in order to annihilate the first element of 'aux1' using the Givens rotations.

"""
givens_rotations!(row, aux1, aux2)=
begin    
    c, s = cos_sin(row[1], aux1[1])
    aux2 .= aux1
    aux1 .= row .* s .+ c .* aux1
    row .= row .* c .- s .* aux2
    return c, s
end


"""
    delta_update!(A, λ)

Computes the  A_λ. It uses Givens rotations to zero the elements of the attached matrix, λI, using the matrix 'A'.

"""
delta_update!(A, λ)=
begin
    m, n = size(A) 
    rl = sqrt(λ)

    c, s = cos_sin(A[1, 1], rl)
    aux1 = @view A[2 : n, 1]
    row = @view A[1, 2 : n]
        aux1 .= row .* s
        row .= row .* c
        A[1, 1] = A[1, 1] * c - s * rl
   

    c, s = cos_sin(A[2, 2], aux1[1])
    aux2 = @view A[3 : n, 2]
    aux2 .= aux1[2 : n - 1]
    row = @view A[2, 3 : n]
        aux1[2 : n - 1] .= row .* s .+ c .* aux1[2 : n - 1]
        row .= row .* c .- s .* aux2
        A[2, 2] = A[2, 2] * c - s * aux1[1]
    
    
    for i = 3 : n
        givens_rotations!(@view(A[i, i : n]), @view(aux1[i - 1 : n - 1]), @view(aux2[i - 2 : n - 2]))
    end
    
    for k = 2 : n
        
        c, s = c, s = cos_sin(A[k, k], rl) 
        row = @view A[k, k + 1 : n]
            aux1[k : n - 1] .= row .* s
            row .= row .* c
            A[k, k] = A[k, k] * c - s * rl
    

        for j = k + 1 : n    
            givens_rotations!(@view(A[j, j : n]), @view(aux1[j - 1 : n - 1]), @view(aux2[1 : n - j + 1]))
        end
    end
      
    return A
    
end

"""
    solve_upper!(A, x, n)

Solves the system Ax* = x assuming that 'A' is an upper triangular matrix and overscripting x* in 'x'. 'n' is the size of 'A'.

"""
solve_upper!(A, x, n)=
begin
    for k = n : - 1 : 1 
        s = 0
        for i = n : - 1 : k + 1
            s = s + x[i] * A[k, i]
        end
        
        x[k] = (x[k] - s) / A[k, k]
    end
end

"""
    solve_upper!(A, b, x, n)

Solves the system A^Tx = b using 'A' an upper triangular matrix. 'n' is the size of 'A'.

"""
solve_lower!(A, b, x, n)=
begin
    for k = 1 : n
        s = 0 
        for i = 1 : k - 1
            s = s + x[i] * A[i, k]
        end
        
        x[k] = (b[k] - s) / A[k, k]
    end
end
