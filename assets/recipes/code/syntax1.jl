# This file was generated, do not modify it. # hide
@recipe function f(r::Result; ε_max = 0.5)
    # set a default value for an attribute with `-->`
    xlabel --> "x"
    ylabel --> "y"
    markershape --> :diamond
    # add a series for an error band
    @series begin
        # force an argument with `:=`
        seriestype := :path
        # ignore series in legend and color cycling
        primary := false
        linecolor := nothing
        fillcolor := :lightgray
        fillalpha := 0.5
        fillrange := r.y .- r.ε
        # ensure no markers are shown for the error band
        markershape := :none
        # return series data
        r.x, r.y .+ r.ε
    end
    # get the seriescolor passed by the user
    c = get(plotattributes, :seriescolor, :auto)
    # highlight big errors, otherwise use the user-defined color
    markercolor := ifelse.(r.ε .> ε_max, :red, c)
    # return data
    r.x, r.y
end