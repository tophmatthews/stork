## Tests material model MechUC for the calculation of thermal expansion
#
#  The test is a single element unit cube that is heated from 300 to 1500 K.
#  The linear coefficient of thermal expansion is found using the function in 
#  MaterialUC, and is linear with respect to temperature:
#
#  alpha = a + bT [K]
#
#  The analytical solution for the x displacement is:
#
#  disp_x = exp[a*(T-T0) + b/2*(T^2-T0^2)] - 1
# 
#  The following compares the analytical values to BUCK's calculated values:
#
# Temp [K]  x_disp (BUCK) x_disp (EXCEL)  % diff
# 300       0             0 
# 420       1.2597E-03    1.2597E-03      1.7443E-04
# 540       2.5380E-03    2.5380E-03      2.3014E-04
# 660       3.8347E-03    3.8347E-03      2.1496E-04
# 780       5.1501E-03    5.1501E-03      2.2706E-04
# 900       6.4841E-03    6.4841E-03      2.2289E-04
# 1020      7.8370E-03    7.8369E-03      2.2640E-04
# 1140      9.2086E-03    9.2086E-03      2.2532E-04
# 1260      1.0599E-02    1.0599E-02      2.6044E-04
# 1380      1.2009E-02    1.2009E-02      2.1145E-04
# 1500      1.3437E-02    1.3437E-02      2.4656E-04


[GlobalParams]
  density = 12267.0
  disp_x = disp_x
  disp_y = disp_y
  disp_z = disp_z
[]

[Mesh]
  file = patch.e
  displacements = 'disp_x disp_y disp_z'
[]

[Variables]
  [./disp_x]
  [../]
  [./disp_y]
  [../]
  [./disp_z]
  [../]
  [./temp]
    initial_condition = 300.0
  [../]
[]

[Kernels]
  [./heat]
    type = HeatConduction
    variable = temp
  [../]
  [./heat_ie]
    type = HeatConductionTimeDerivative
    variable = temp
  [../]
[]

[Functions]
  [./temp_ramp]
    type = PiecewiseLinear
    x = '0.0 1e10'
    y = '300 1500'
  [../]
[]

[SolidMechanics]
  [./solid]
  [../]
[]

[BCs]
  [./bottom_fix_y]
    type = DirichletBC
    variable = disp_y
    boundary = 9
    value = 0.0
  [../]
  [./fix_z]
    type = DirichletBC
    variable = disp_z
    boundary = 14
    value = 0.0
  [../]
  [./fix_x]
    type = DirichletBC
    variable = disp_x
    boundary = 10
    value = 0.0
  [../]
  [./heatup]
     type = FunctionDirichletBC
     boundary = 15
     variable = temp
     function = temp_ramp
   [../]
[]


[Materials]
  [./mech]
    type = MechUC
    block = '1 2 3 4 5 6 7'
    temp = temp
    porosity = 0
    fission_rate = 0
    youngs_modulus = 2.e11
    poissons_ratio = .3
    thermal_expansion = 0
    calc_elastic_modulus = false
    model_creep = false
    calc_alpha = true
    model_swelling = false
  [../]
  [./thermal]
    type = HeatConductionMaterial
    block = '1 2 3 4 5 6 7'
    specific_heat = 1   
    thermal_conductivity = 100
  [../]
  [./density]
    type = Density
    block = '1 2 3 4 5 6 7'
  [../]
[]


[Executioner]

  type = Transient

  solve_type = PJFNK

  petsc_options = '-snes_ksp_ew'
  petsc_options_iname = '-ksp_gmres_restart'
  petsc_options_value = '101'

  line_search = 'none'

  l_max_its = 100
  nl_max_its = 100
  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-8
  l_tol = 1e-5
  start_time = 0.0
  dt = 1e9
  end_time = 1e10
[]

[Postprocessors]
 [./temperature (K)]
   type = ElementAverageValue
   block = 1
   variable = temp
 [../]
 [./node_x]
   type = NodalVariableValue
   nodeid = 4
   variable = disp_x
 [../]
[]


[Outputs]
  file_base = thermal_expansion_out
  output_initial = true
  csv = false
  interval = 1
  [./exodus]
    type = Exodus
    elemental_as_nodal = true
  [../]
  [./console]
    type = Console
    perf_log = true
    linear_residuals = true
  [../]
[]
