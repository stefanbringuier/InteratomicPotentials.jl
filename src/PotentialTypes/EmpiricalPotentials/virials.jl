#############################################################################
############################## Simple Virial ################################
#############################################################################
function virial(r::Vector{<:Real}, p::EmpiricalPotential)
    f = force(r, p)
    return f[1] * r[1] + f[2] * r[2] + f[3] * r[3]
end


function virial_stress(r::Vector{<:Real}, p::EmpiricalPotential)
    f = force(r, p)
    vi = r * f'
    return [vi[1, 1], vi[2, 2], vi[3, 3], vi[2, 3], vi[1, 3], vi[1,2]]
end