# This file was generated, do not modify it. # hide
@recipe function f(::Type{Val{:yscaleseries}}, x, y, z)
    layout := (1, 2)
    for (i, scale) in enumerate((:linear, :log))
        @series begin
            title --> string(scale, " scale")
            seriestype := :path
            subplot := i
            yscale := scale
        end
    end
end
@shorthands yscaleseries