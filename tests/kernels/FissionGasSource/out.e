CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_nod_ns1       num_nod_var       num_info  1         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         out.e      maximum_name_length                    
time_whole                            j   	eb_status                                eb_prop1               name      ID                 	ns_status         	                       ns_prop1      	         name      ID                 	ss_status         
                        ss_prop1      
         name      ID              $   coordx                      @      (   coordy                      @      h   coordz                      @      �   eb_names                       $      �   ns_names      	                 $         ss_names      
                 $      0   
coor_names                         d      T   node_num_map                           �   connect1                  	elem_type         HEX8                 �   elem_num_map                          �   elem_ss1                          �   side_ss1                          	   node_ns1                           	,   vals_nod_var1                          @      j   vals_nod_var2                          @      j\   name_nod_var                       D      	L   info_records                      `�      	�                  ��      ��      ��      ��      ?�      ?�      ?�      ?�      ��      ��      ?�      ?�      ��      ��      ?�      ?�      ?�      ��      ��      ?�      ?�      ��      ��      ?�                                                                                                                                                                                                                                                                                                                                     fission_rate                     gas                                ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               FissionGasSource_test.i                                                                                                                                           ### Version Info ###                                                             Framework Information:                                                           MOOSE version:           svn revision 30248                                      PETSc Version:           3.4.3                                                   Current Time:            Mon Nov  3 15:22:58 2014                                Executable Timestamp:    Mon Nov  3 15:02:38 2014                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 block                          = INVALID                                         coord_type                     = XYZ                                             fe_cache                       = 0                                               kernel_coverage_check          = 1                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       use_legacy_uo_aux_computation  = INVALID                                         use_legacy_uo_initialization   = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            active_bcs                     = INVALID                                         active_kernels                 = INVALID                                         inactive_bcs                   = INVALID                                         inactive_kernels               = INVALID                                         start                          = 0                                               dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               long_name                      =                                                 solve                          = 1                                               use_nonlinear                  = 1                                             []                                                                                                                                                                [AuxKernels]                                                                                                                                                        [./fissionrate]                                                                    type                         = FissionRateAux                                    block                        = INVALID                                           boundary                     = INVALID                                           execute_on                   = residual                                          function                     =                                                   long_name                    = AuxKernels/fissionrate                            seed                         = 0                                                 use_displaced_mesh           = 0                                                 value                        = 1                                                 variable                     = fission_rate                                    [../]                                                                          []                                                                                                                                                                [AuxVariables]                                                                                                                                                      [./fission_rate]                                                                   block                        = INVALID                                           family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             initial_from_file_timestep   = 2                                                 initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       l_abs_step_tol                 = -1                                              l_max_its                      = 100                                             l_tol                          = 1e-05                                           line_search                    = none                                            nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-10                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 100                                             nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = -snes_ksp_ew                                    petsc_options_iname            = -ksp_gmres_restart                              petsc_options_value            = 101                                             solve_type                     = PJFNK                                           abort_on_solve_fail            = 0                                               dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           end_time                       = 100                                             long_name                      = Executioner                                     n_startup_steps                = 0                                               num_steps                      = 4294967295                                      picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           predictor_scale                = INVALID                                         reset_dt                       = 0                                               restart_file_base              =                                                 scheme                         = implicit-euler                                  splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7f8675800000                                []                                                                                                                                                                [Kernels]                                                                                                                                                           [./gas_time]                                                                       type                         = TimeDerivative                                    block                        = INVALID                                           diag_save_in                 = INVALID                                           long_name                    = Kernels/gas_time                                  lumping                      = 0                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = gas                                             [../]                                                                                                                                                             [./source]                                                                         type                         = FGSource                                          block                        = INVALID                                           diag_save_in                 = INVALID                                           fission_rate                 = fission_rate                                      long_name                    = Kernels/source                                    save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = gas                                               yield                        = 1                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               type                           = FileMesh                                        uniform_refine                 = 0                                               centroid_partitioner_direction = INVALID                                         dim                            = 3                                               distribution                   = DEFAULT                                         file                           = 1x1x1cube.e                                     long_name                      = Mesh                                            nemesis                        = 0                                               partitioner                    = default                                         patch_update_strategy          = never                                           skip_partitioning              = 0                                             []                                                                                                                                                                [Outputs]                                                                          checkpoint                     = 0                                               color                          = 1                                               console                        = 0                                               csv                            = 0                                               exodus                         = 0                                               file_base                      = out                                             gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 10                                              nemesis                        = 0                                               output_final                   = 0                                               output_if_base_contains        = INVALID                                         output_initial                 = 1                                               output_intermediate            = 1                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                                                                                                                [./console]                                                                        type                         = Console                                           all_variable_norms           = 0                                                 append_displaced             = 0                                                 append_restart               = 0                                                 end_time                     = INVALID                                           file_base                    = out                                               fit_mode                     = ENVIRONMENT                                       hide                         = INVALID                                           interval                     = 10                                                linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 1                                                 long_name                    = Outputs/console                                   max_rows                     = 15                                                nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 1                                                 outlier_multiplier           = '0.8 2'                                           outlier_variable_norms       = 1                                                 output_failed                = 1                                                 output_file                  = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_input                 = 0                                                 output_intermediate          = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 output_screen                = 1                                                 output_system_information    = 1                                                 padding                      = 4                                                 perf_header                  = INVALID                                           perf_log                     = 1                                                 scientific_time              = 0                                                 sequence                     = INVALID                                           setup_log                    = INVALID                                           setup_log_early              = 0                                                 show                         = INVALID                                           show_multiapp_name           = 0                                                 solve_log                    = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_precision               = INVALID                                           time_tolerance               = 1e-14                                             use_displaced                = 0                                                 verbose                      = 0                                               [../]                                                                                                                                                             [./exodus]                                                                         type                         = Exodus                                            append_displaced             = 0                                                 append_oversample            = 0                                                 elemental_as_nodal           = 1                                                 end_time                     = INVALID                                           file                         = INVALID                                           file_base                    = out                                               hide                         = INVALID                                           interval                     = 10                                                linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 0                                                 long_name                    = Outputs/exodus                                    nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 0                                                 output_elemental_variables   = 1                                                 output_failed                = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_input                 = 1                                                 output_intermediate          = 1                                                 output_material_properties   = 0                                                 output_nodal_variables       = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 oversample                   = 0                                                 padding                      = 3                                                 position                     = INVALID                                           refinements                  = 0                                                 scalar_as_nodal              = 0                                                 sequence                     = INVALID                                           show                         = INVALID                                           show_material_properties     = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_tolerance               = 1e-14                                             use_displaced                = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./gas]                                                                            block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                                                                          @$      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @#������@#������@#������@#������@#������@#������@#������@#������@4      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @4   ɜ@4   ɓ@4   ɕ@4   ɑ@4   Ɍ@4   ɟ@4   ɖ@4   ɠ@>      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @>   &��@>   &��@>   &��@>   &��@>   &��@>   &��@>   &��@>   &��@D      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @D   P�@D   P�@D   P�@D   P�@D   P�@D   P�@D   P�@D   P�@I      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @H����-x@H����-n@H����-q@H����-l@H����-g@H����-z@H����-p@H����-z@N      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @M���ۻ�@M���ۻ�@M���ۻ�@M���ۻ�@M���ۻ�@M���ۻ�@M���ۻ�@M���ۻ�@Q�     ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @Q���7�@Q���7�@Q���7�@Q���7�@Q���7�@Q���7�@Q���7�@Q���7�@T      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @S�����@S�����@S�����@S�����@S�����@S�����@S�����@S�����@V�     ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @V����@V����@V����@V����@V����@V����@V����@V����@Y      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @X����B@X����:@X����=@X����9@X����6@X����D@X����;@X����E