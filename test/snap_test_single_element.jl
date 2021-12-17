using AtomsBase
using InteratomicPotentials
using StaticArrays
using Unitful
using UnitfulAtomic

include("./lammps_snap/bispectrum_functions.jl")
position1 = @SVector [0.0, 0.0, 0.0] 
position2 = @SVector [0.5, .40, 0.30]


atoms = [StaticAtom(position1 * 1u"Å", :Ar), StaticAtom(position2 * 1u"Å", :Ar)]

box = [[-5.0, 5.0], [-5.0, 5.0]]
system   = FlexibleSystem(box * 1u"Å", [Periodic(), Periodic()], atoms)

snap = SNAPParams(2, 4, [:Ar], [1.5], 0.00, 0.989, [1.0])
B, dB, W = compute_sna(system, snap)


show(stdout, "text/plain", B)
println(" ")


show(stdout, "text/plain", A)
println(" ")

@test norm(A[:, 1] - B[1]) < 1e-5

@test norm(A[:, 2] - B[2]) < 1e-5
