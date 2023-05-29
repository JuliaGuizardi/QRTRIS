@testset "test qrtris" begin
    
    A = [2.0 -1 5.0; 3 -4 1.0; 7 -9 4]
    λ = 4.0    
    A1 = transpose(A) * A + λ * Matrix(I(3))
    b = [2.0, 4, -1]
    x = zeros(3)
    LMFact = LMFactorization(A, 0.0)
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 3
        @test x[i] ≈ y[i]
    end
    
    A = [2.0 -1 5.0; 3 -4 1.0; 7 -9 4]
    λ = 5.0
    A1 = transpose(A) * A + λ * Matrix(I(3))
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 3
        @test x[i] ≈ y[i]
    end
    
    
    
    A = [-1 7.0 23 56; -3 4 1 -9; -2 4 2 0; -3 32 1 5]
    λ = 1.0    
    A1 = transpose(A) * A + λ * Matrix(I(4))
    b = [2.5, -3, 41, -1]
    x = zeros(4)
    LMFact = LMFactorization(A, 0.0)
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 4
        @test x[i] ≈ y[i]
    end
    
    A = [-1 7.0 23 56; -3 4 1 -9; -2 4 2 0; -3 32 1 5]
    λ = 3.5
    A1 = transpose(A) * A + λ * Matrix(I(4))
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 4
        @test x[i] ≈ y[i]
    end
    
    A = [-1 7.0 23 56; -3 4 1 -9; -2 4 2 0; -3 32 1 5]
    λ = 4.5
    A1 = transpose(A) * A + λ * Matrix(I(4))
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 4
        @test x[i] ≈ y[i]
    end
    
    A = [-1 7.0 23 56; -3 4 1 -9; -2 4 2 0; -3 32 1 5]
    λ = 5.0
    A1 = transpose(A) * A + λ * Matrix(I(4))
    update!(LMFact, λ)
    ldiv!(LMFact, b, x)
    y = A1 \ b
    
    for i = 1 : 4
        @test x[i] ≈ y[i]
    end  
end