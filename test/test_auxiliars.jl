@testset "test auxiliars" begin
   
    @test cos_sin(0.0, 1.0) == (0.0, -1.0) 
    @test cos_sin(7.0, -0.5)[1] ≈ 0.99745869
    @test cos_sin(7.0, -0.5)[2] ≈ 0.0712470499
    @test cos_sin(-4.0, 81.0)[1] ≈ -0.0493226123
    @test cos_sin(-4.0, 81.0)[2] ≈ -0.99878289
    
    row = [1.0, 0, 0]
    aux1 = [12.0, 0, 0]
    aux2 = [0.0, 0, 0]
    givens_rotations!(row, aux1, aux2)
    @test row[2] == 0.0
    @test row[3] == 0.0
    @test aux1[1] ≈ 1.11022302462e-16
    @test aux1[2] == 0.0
    @test aux1[3] == 0.0
    
    row = [1.0, 5, 3]
    aux1 = [0.0, 8, -1]
    aux2 = [0.0, 0, 0]
    givens_rotations!(row, aux1, aux2)
    @test row == [1.0, 5, 3]
    @test aux1 == [0.0, 8, -1]
    
    A = [1.0 0.0; 0 1.0]
    x = [2.0, 12]
    solve_upper!(A, x, 2)
    @test x == [2.0, 12]
    
    A = [2.0 -1 0.0; 0 -3 1.0; 1 2 4]
    x = [1.0, 3, -2]
    solve_upper!(A, x, 3)
    @test x[1] ≈ -0.08333333333
    @test x[2] ≈ -1.166666666
    @test x[3] == -0.5
    
    A = [1.0 0.0; 0 1.0]
    b = [2.0, 12]
    x = [0.0, 0]
    solve_lower!(A, b, x, 2)
    @test x == [2.0, 12]
    
    A = [2.0 -1 0.0; 0 -3 1.0; 1 2 4]
    b = [1.0, 3, -2]
    x = [0.0, 0, 0]
    solve_lower!(A',b, x, 3)
    @test x == [0.5, -1, -0.125]
    
    A = [2.0 -1 0.0; 0 -4 1.0; 0 0 4]
    A_1 = copy(A)
    delta_update!(A, 0.0)
    for i = 1 : 3
        for j = 1 : 3
        @test abs(A[i, j]) == abs(A_1[i, j])
        end
    end 
    
    A = [1 0.0 0; 0 1 0; 0 0 1]
    delta_update!(A, 1.0)
    for i = 1 : 3
        @test A[i, i] ≈ 1.414213562
    end   
end

