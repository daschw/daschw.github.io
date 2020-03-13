# This file was generated, do not modify it. # hide
@recipe function f(::Type{Val{:plotpie}}, plt::AbstractPlot)
    y = plotattributes[:y]
    labels = plotattributes[:x]
    framestyle --> :none
    aspect_ratio --> true
    s = sum(y)
    θ = 0
    for i in 1:length(y)
        θ_new = θ + 2π * y[i] / s
        coords = [(0.0, 0.0); Plots.partialcircle(θ, θ_new, 50)]
        @series begin
            seriestype := :shape
            label --> string(labels[i])
            x := first.(coords)
            y := last.(coords)
        end
        θ = θ_new
    end
end
@shorthands plotpie

plotpie(rand(4, 2), layout = (1, 2))
savefig(joinpath(@OUTPUT, "plotpie.svg")) # hide