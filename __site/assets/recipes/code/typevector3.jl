# This file was generated, do not modify it. # hide
struct MyOtherWrapper
    w
end

@recipe f(::Type{MyOtherWrapper}, mow::MyOtherWrapper) = mow.w

mow = MyOtherWrapper(mw)
plot(mow)
savefig(joinpath(@OUTPUT, "typevector3.svg")) # hide