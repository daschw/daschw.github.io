# This file was generated, do not modify it. # hide
mw = MyWrapper(cumsum(rand(10)))
plot(mw)
savefig(joinpath(@OUTPUT, "typevector2.svg")) # hide