# This file was generated, do not modify it. # hide
# defines mutable struct `UserPie` and sets shorthands `userpie` and `userpie!`
@userplot UserPie
@recipe function f(up::UserPie)
    y = up.args[end] # extract y from the args
    # if we are passed two args, we use the first as labels
    labels = length(up.args) == 2 ? up.args[1] : eachindex(y)
    framestyle --> :none
    aspect_ratio --> true
    s = sum(y)
    θ = 0
    # add a shape for each piece of pie
    for i in 1:length(y)
        # determine the angle until we stop
        θ_new = θ + 2π * y[i] / s
        # calculate the coordinates
        coords = [(0.0, 0.0); Plots.partialcircle(θ, θ_new, 50)]
        @series begin
            seriestype := :shape
            label --> string(labels[i])
            coords
        end
        θ = θ_new
    end
    # we already added all shapes in @series so we don't want to return a series
    # here. (Technically we are returning an empty series which is not added to
    # the legend.)
    primary := false
    ()
end