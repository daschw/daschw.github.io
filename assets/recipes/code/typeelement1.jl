# This file was generated, do not modify it. # hide
struct MyTime
    h::Int
    m::Int
end

# show e.g. `MyTime(1, 30)` as "01:30"
time_string(mt) = join((lpad(string(c), 2, "0") for c in (mt.h, mt.m)), ":")
# map a `MyTime` object to the number of minutes that have passed since midnight.
# this is the actual data Plots will use.
minutes_since_midnight(mt) = 60 * mt.h + mt.m
# convert the minutes passed since midnight to a nice string showing `MyTime`
formatter(n) = time_string(MyTime(divrem(n, 60)...))

# define the recipe (it must return two functions)
@recipe f(::Type{MyTime}, mt::MyTime) = (minutes_since_midnight, formatter)