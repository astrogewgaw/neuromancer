import Pkg
let
    pkgs = [
        "Revise",
        "IJulia",
        "OhMyREPL",
        "PkgTemplates",
        "BenchmarkTools",
    ]
    for pkg in pkgs
    if Base.find_package(pkg) === nothing
        Pkg.add(pkg)
    end
    end
end

using Revise
using OhMyREPL
using BenchmarkTools
