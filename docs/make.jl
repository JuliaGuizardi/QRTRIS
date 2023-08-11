using Documenter, QRTRIS

#push!(LOAD_PATH, "../test/scripts/")

makedocs(
    assets = ["assets/favicon.ico"],
    sitename = "QRTRIS.jl",
    pages = ["Overview" => "index.md",
         "Theory" => "theory.md",
	     "Tutorial"=> "tutorial.md",
         "API" => "api.md"],
    modules = [QRTRIS],
    format = Documenter.HTML(prettyurls=false)
	)
	
deploydocs(
	repo = "github.com/JuliaGuizardi/QRTRIS"
	)