# This file was generated, do not modify it. # hide
times = MyTime.(0:23, rand(0:59, 24))
vals = log.(1:24)

plot(times, vals)
savefig(joinpath(@OUTPUT, "typeelement2.svg")) # hide