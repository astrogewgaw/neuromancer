import Pkg
let
    pkgs = [
        "Revise",
        "IJulia",
        "Profile",
        "Cthulhu",
        "OhMyREPL",
        "ProfileView",
        "PkgTemplates",
        "BenchmarkTools",
        "LanguageServer",
        "InteractiveCodeSearch",
    ]
    for pkg in pkgs
        if Base.find_package(pkg) === nothing
            Pkg.add(pkg)
        end
    end
end

if Base.isinteractive() && (
    local REPL = get(
        Base.loaded_modules,
        Base.PkgId(Base.UUID("3fa0cd96-eef1-5676-8a61-b3b8758bbffb"), "REPL"),
        nothing,
    );
    REPL !== nothing
)
    using Revise
    using OhMyREPL

    # Add vim-like bindings: ":q" quits Julia, and ":r" restarts it.
    # Copied very shamelessly from Fredrik Ekre's Julia configuration,
    # available on Github: https://github.com/fredrikekre/.dotfiles.
    pushfirst!(
        REPL.repl_ast_transforms,
        function (ast::Union{Expr,Nothing})
            function topquotenode(ast, s)
                return (
                    (Meta.isexpr(ast, :toplevel, 2) && ast.args[2] === QuoteNode(s)) ||
                    (Meta.isexpr(ast, :toplevel) && any(x -> topquotenode(x, s), ast.args))
                )
            end
            topquotenode(ast, :q) && exit()
            if topquotenode(ast, :r)
                opts = Base.JLOptions()
                argv = Base.julia_cmd().exec
                opts.project != C_NULL && push!(argv, "--project=$(unsafe_string(opts.project))")
                opts.nthreads != 0 && push!(argv, "--threads=$(opts.nthreads)")
                ccall(:execv, Cint, (Cstring, Ref{Cstring}), argv[1], argv)
            end
            return ast
        end,
    )

    # Load tools automatically on demand, such as:
    #   * Profile.jl, when I type in @profile.
    #   * ProfileView.jl, when I type in @profview.
    #   * BenchmarkTools.jl, if I type in @btime or @benchmark.
    #   * Test.jl, when I type in @test, @testset, @test_xxx, and so on.
    #   * Cthulhu.jl when I type in @descend, @descend_code_type, or @descend_code_warntype.
    #   * InteractiveCodeSearch.jl, when I type in @search, @searchmethods, or @searchhistory.
    # Copied very shamelessly from Fredrik Ekre's Julia configuration, available on Github:
    # https://github.com/fredrikekre/.dotfiles.

    local tools = Dict{Symbol,Vector{Symbol}}(
        :Profile => Symbol.(["@profile"]),
        :ProfileView => Symbol.(["@profview"]),
        :BenchmarkTools => Symbol.(["@btime", "@benchmark"]),
        :Cthulhu => Symbol.(["@descend", "@descend_code_typed", "@descend_code_warntype"]),
        :InteractiveCodeSearch => Symbol.(["@search", "@searchmethods", "@searchhistory"]),
        :Test => Symbol.([
            "@test",
            "@testset",
            "@test_logs",
            "@test_skip",
            "@test_warn",
            "@test_throws",
            "@test_nowarn",
            "@test_broken",
            "@test_deprecated",
        ]),
    )

    pushfirst!(
        REPL.repl_ast_transforms,
        function (ast::Union{Expr,Nothing})
            function hasmacro(ast, m)
                return ast isa Expr && (
                    (Meta.isexpr(ast, :macrocall) && ast.args[1] === m) ||
                    any(x -> hasmacro(x, m), ast.args)
                )
            end
            for (mod, macros) in tools
                if any(hasmacro(ast, s) for s in macros) && !isdefined(Main, mod)
                    @info "Loading $mod ..."
                    try
                        Core.eval(Main, :(using $mod))
                    catch err
                        @info "Failed to automatically load $mod" exception = err
                    end
                end
            end
            return ast
        end,
    )
end
