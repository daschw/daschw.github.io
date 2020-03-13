# This file was generated, do not modify it. # hide
res = Result(1:10, cumsum(rand(10)), cumsum(rand(10)) / 5)

using Plots

# plot the error band as invisible line with fillrange
plot(
    res.x,
    res.y .+ res.ε,
    xlabel = "x",
    ylabel = "y",
    fill = (res.y .- res.ε, :lightgray, 0.5),
    linecolor = nothing,
    primary = false, # no legend entry
)

# add the data to the plots
plot!(res.x, res.y, marker = :diamond)
savefig(joinpath(@OUTPUT, "plotresult.svg")) # hide