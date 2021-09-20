import Potentials

N = 3
r = Vector{Potentials.Atom}(undef, N)
mass = 38.0

r[1] = Potentials.Atom(mass, [0.0, 1.0, 0.0], zeros(3), :Xe)
r[2] = Potentials.Atom(mass, [-1.0, 0.0, 0.0], zeros(3), :Xe)
r[3] = Potentials.Atom(mass, [1.0, 0.0, 0.0], zeros(3), :Xe)

ϵ = 1.0
σ = 0.5
lj = Potentials.LennardJones(ϵ, σ)
println("Beginning test of LJ implementation")
println("Configuration")
show(stdout, "text/plain", r)
println(" ")
println("Lennard Jones Energy ", Potentials.potential_energy(r, lj))
println("Lennard Jones Forces")
show(stdout, "text/plain", Potentials.force(r, lj))
println(" ")
println("Lennard Jones Virial ", Potentials.virial(r, lj))
println(" ")
println("Lennard Jones Virial Stress Tensor")
show(stdout, "text/plain", Potentials.virial_stress(r, lj))
println(" ")

println("Gradient of Lennard Jones Energy with respect to  ϵ, σ ", Potentials.grad_potential_energy(r, lj))
println("Gradient of Lennard Jones Forces with respect to ϵ, σ")
show(stdout, "text/plain", Potentials.grad_force(r, lj))
println(" ")

println("Gradient of Lennard Jones Virial with respect to ϵ, σ", Potentials.grad_virial(r, lj))
println("End test")

