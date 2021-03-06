classdef analyze_complexity_cfg < handle
    %ANALYZE_COMPLEXITY_CFG Configure analyze_complexity_script
    %   Detailed explanation goes here
    
    properties(Constant = true)
        % Models
    end
    
    properties
        bp_render;  % Which box plots to render

        % sldemo_mdlref_counter_bus causing issues in getAlgebraicLoops
%         examples = {'sldemo_mdlref_variants_enum', 'sldemo_mdlref_bus','sldemo_mdlref_conversion','sldemo_mdlref_counter_datamngt','sldemo_mdlref_dsm','sldemo_mdlref_dsm_bot','sldemo_mdlref_dsm_bot2','sldemo_mdlref_F2C','ex_algebraic_loop'};
%         examples = {'sldemo_mdlref_variants_enum','sldemo_mdlref_bus','sldemo_mdlref_conversion','sldemo_mdlref_counter_bus','sldemo_mdlref_counter_datamngt','sldemo_mdlref_dsm','sldemo_mdlref_dsm_bot','sldemo_mdlref_dsm_bot2','sldemo_mdlref_F2C'};
%         examples = {'aeroblk_HL20'};
        examples = {'sldemo_mdlref_variants_enum', 'sldemo_mdlref_bus','sldemo_mdlref_conversion','sldemo_mdlref_counter_datamngt'};
%         examples = {'sldemo_mdlref_basic'};
%         examples = {'untitled1'};
        github = {'aeroblk_self_cond_cntr'};
        
        github_complex = {};
        
%         matlab_central = { 'ACTimeOvercurrentRelayBlock',  'Engine_Testrig',  'Fuel_Eco_TEST',  'HPW',  'HVDC_system',  'LF_AC29bus_HVDCdemo_V2_1',  'Link_A',  'Link_B',  'MAXPID_modelisation_multi_physique_MATLAB_2015a_Ivan_Liebgott',  'UPFC_1',  'Vehicle_Dynamics_Testrig',  'complex_multiply_example',  'downsample_upsample_example',  'enabled_subsystem_example',  'fir_filter_example',  'pvwindupfc11',  'realtime_pacer_lib',  'stateflow_example',  'sync_subsystem_example',  'view_wave_example',  'BB2',  'DMM',  'HVDC',  'MA_Model',  'MinorStepLib',  'OCR',  'PDQuadrotor',  'SimpleBounce',  'VFT',  'VU_NXTWay',  'VU_NXTWay_Simple',  'VU_lineFollow',  'VU_lineFollow1',  'VU_lineFollow1b',  'VU_lineFollow2',  'VU_motorSpdCtrl',  'VU_testBtTxRx',  'VU_testSoundTone1',  'VU_testSoundTone2',  'VU_testSoundTone3',  'VU_testUsbTxRx',  'Vehicle_Dynamics_Testrig',  'Wind_PMSG',  'lego_nxt_lib',  'lorenz3d',  'm3dscope_new',  'm3dscope_old',  'matrixFtse',  'microturbine_rectifierconverter',  'my_model',  'realtime_pacer_example',  'rev_pow_ckt_new4'  };
        
        research = {};
        
        simple = {};
        complex = {};
        
%         cyfuzz = {'untitled6'};
        
        cyfuzz = {'sampleModel1000', 'sampleModel1002', 'sampleModel1004', 'sampleModel1012', 'sampleModel1018', 'sampleModel1024', 'sampleModel1028', 'sampleModel1032', 'sampleModel1033', 'sampleModel1034', 'sampleModel1035', 'sampleModel904', 'sampleModel908', 'sampleModel917', 'sampleModel925', 'sampleModel928', 'sampleModel930', 'sampleModel937', 'sampleModel938', 'sampleModel941', 'sampleModel944', 'sampleModel945', 'sampleModel946', 'sampleModel947', 'sampleModel950', 'sampleModel953', 'sampleModel962', 'sampleModel964', 'sampleModel965', 'sampleModel967', 'sampleModel970', 'sampleModel971', 'sampleModel973', 'sampleModel974', 'sampleModel975', 'sampleModel977', 'sampleModel978', 'sampleModel979', 'sampleModel980', 'sampleModel984', 'sampleModel986', 'sampleModel988', 'sampleModel989', 'sampleModel990', 'sampleModel995', 'sampleModel996'};
        old_cyfuzz = {'sampleModel1', 'sampleModel10', 'sampleModel100', 'sampleModel11', 'sampleModel12', 'sampleModel13', 'sampleModel14', 'sampleModel15', 'sampleModel16', 'sampleModel17', 'sampleModel18', 'sampleModel19', 'sampleModel2', 'sampleModel21', 'sampleModel22', 'sampleModel23', 'sampleModel24', 'sampleModel25', 'sampleModel26', 'sampleModel27', 'sampleModel28', 'sampleModel3', 'sampleModel30', 'sampleModel31', 'sampleModel32', 'sampleModel33', 'sampleModel34', 'sampleModel35', 'sampleModel37', 'sampleModel38', 'sampleModel39', 'sampleModel4', 'sampleModel40', 'sampleModel41', 'sampleModel42', 'sampleModel44', 'sampleModel45', 'sampleModel46', 'sampleModel47', 'sampleModel48', 'sampleModel49', 'sampleModel5', 'sampleModel50', 'sampleModel51', 'sampleModel52', 'sampleModel53', 'sampleModel54', 'sampleModel55', 'sampleModel56', 'sampleModel57', 'sampleModel58', 'sampleModel59', 'sampleModel6', 'sampleModel60', 'sampleModel61', 'sampleModel62', 'sampleModel63', 'sampleModel64', 'sampleModel65', 'sampleModel66', 'sampleModel67', 'sampleModel68', 'sampleModel69', 'sampleModel7', 'sampleModel70', 'sampleModel71', 'sampleModel72', 'sampleModel74', 'sampleModel75', 'sampleModel76', 'sampleModel77', 'sampleModel78', 'sampleModel79', 'sampleModel8', 'sampleModel80', 'sampleModel81', 'sampleModel82', 'sampleModel83', 'sampleModel84', 'sampleModel85', 'sampleModel86', 'sampleModel87', 'sampleModel89', 'sampleModel9', 'sampleModel90', 'sampleModel91', 'sampleModel92', 'sampleModel94', 'sampleModel95', 'sampleModel97', 'sampleModel98', 'sampleModel99'};
        
        mc_complex_e = { 'EXTENSION1',  'EXTENSIONnewwithfuzzy',  'EXTENSIONwithfuellcell', 'Detailed_PMSG_one_machine', 'microgrid_Finalcircutperfect', 'Three_Phase_ACDCAC_PWMconverter',...
            'HVDC_system', 'LF_AC29bus_HVDCdemo_V2_1'};
        
        mc_complex = {'OSWEC',    'RM3','sldemo_drivecycle', 'VU_lineFollow',  'VU_lineFollow1',  'VU_lineFollow1b',  'VU_lineFollow2',  'VU_motorSpdCtrl',  'VU_testBtTxRx',  'VU_testSoundTone1',  'VU_testSoundTone2',  'VU_testSoundTone3',  'VU_testUsbTxRx',  'VU_NXTWay',  'VU_NXTWay_Simple',...
            'DFIGPI_by_indraneel_saki',  'connectwithoutmech_by_indraneel_saki',  'windturbinemod', 'complex_multiply_example',  'downsample_upsample_example',  'enabled_subsystem_example',  'fir_filter_example',  'stateflow_example',  'sync_subsystem_example',  'view_wave_example',...
            'rev_pow_ckt_new4',  'OCR', 'ssc_Probes_test_all_16b',  'ssc_dc_motor',  'ssc_three_phase', 'Dual_Clutch_Trans', 'Vehicle_Dynamics_Testrig',  'Dual_Clutch_Trans_SDO',...
            'Vehicle_Dynamics_Tests', 'bad_idea',  'motion_example1',  'motion_example2',  'motion_example3',  'ref4_rt',  'ref4_xy',...
            'ab',  'AircraftB', 'ACTimeOvercurrentRelayBlock', 'quad_control', 'HPW', 'FDI_SVM_WT',  'FDI_measures', 'MAXPID_modelisation_multi_physique_MATLAB_2015a_Ivan_Liebgott',...
            'singele_phase_to_3phase_svpwm_IM', 'EXTENSION', 'Actuated_Pioneer3DXAssembly',  'Controller_Pioneer3DXAssembly',  'MotionConstraints_Pioneer3DXAssembly',  'Pioneer3DXAssembly',  'SL3DAnim_Pioneer3DXAssembly',  'main_demo_real_robot',...
            'HEV_SeriesParallel',  'HEV_Battery_Testrig_v1',  'HEV_Battery_Testrig_v2',  'Engine_Testrig', 'PV_panel', 'PVarray_Grid_IncCondReg_det',  'PVarray_Grid_PandO_avg',...
            'Wind_Turbine', 'Wind_Turbine_Flexible_Blades', 'Wind_Testrig', 'Geartrain_Testrig', 'Generator_Testrig', 'Turbine_State_Machine_Testrig', 'Pitch_Control_Ideal_Testrig', 'Yaw_Gearbox_Testrig',...
            'Wind_PMSG', 'youBot_Arm',  'youBot',  'youBot_damping', 'youBot_STEP_URDF', 'main1', 'inverter_pwm2', 'singele_phase_to_3phase_svpwm_IM_VF_PI', 'IM', ...
            'ssc_lithium_battery_1CellMultiplied',  'ssc_lithium_battery_80Cells',  'ssc_lithium_cell_1RC',  'ssc_lithium_cell_1RC_estim',  'ssc_lithium_cell_2RC', 'pvwindupfc11', 'Buck_PWM',  'zerocross', 'mybldc_mdl2', 'CONTROLLER_MOD',  'changer',  'cont_lower',  'cont_modifed',...
            'LLR_equivalent', 'UPFC_1', 'microturbine_rectifierconverter', 'VFT',...
            'hyperloop_arc',  'sl2ge_hyperloop',...
            'ec_concept',  'ec_datadict_buses',  'ec_fixed_config_subsys',  'ec_fixed_eml_simple',  'ec_fixed_lct_tb1',  'ec_fixed_packngo',  'ec_fixed_slm_16bit_tb1',  'ec_fixed_slm_hardcode',  'ec_fixed_slm_structures',  'ec_fixed_slm_verify',  'ec_fixed_slm_with_bypass',  'ec_fixed_slm_with_bypass_reset',  'ec_fixed_slp_brute_force',  'ec_fixed_slp_fb_better',  'ec_fixed_slp_sb',  'ec_fixed_slp_sb_autoscaled',  'ec_fixed_slp_sb_with_mask',  'ec_single_vs_fixed',  'ec_single_vs_fixed_autoscale',  'ec_single_vs_fixed_old',  'ec_using_config',...
            'BackgroundEst',  'OpticalFlow',  'vipabandonedobj_bayer_abstract',  'Pre_SysGen_Post_embedded',  'vipabandonedobj_bayer_1800_frames',  'vipabandonedobj_bayer_1800_noframes',  'vipabandonedobj_bayer_3400_frames',  'vipabandonedobj_bayer_ml506_frames',  'Pre_SysGen_Post_sh_fifo_nohwcs',  'vipabandonedobj_bayer_hwcs_noframes',  'vipabandonedobj_bayer_hwcs_replaced_inputs',  'vipabandonedobj_bayer_hwcs_replaced_inputs_outputs',  'vipabandonedobj_bayer_sg',...
            };
        
        
        mc_simple = {'lorenz3d',  'm3dscope_new',  'm3dscope_old', 'serialRunOnPC', 'serialRunOnArduino', 'my_model',...
            'SimpleBounce',  'sim1',  'sim_tutorial',  'sim_tutorial2',  'sim_tutorial3',  'simrotor1',  'simrotor3a',  'statetest',...
            'realtime_pacer_example', 'dcIntrocomplete'}
        mc_rest = {'PDQuadrotor', 'GearSelect_Testrig', 'PV_MPPT', 'PV_model_Param', 'PV_module'}
        
%         scripts_to_run = {};
        scripts_to_run = {'InitializeCSTHDisturbedStdOp1', 'InitializeCSTHDisturbedStdOp2', 'install_3dscope', 'startup_DCT_Model', 'Machine_Parameters_new'};
    end
    
    methods
        
        function obj = analyze_complexity_cfg()
            obj.populate();
            
            obj.bp_render = zeros(analyze_complexity.NUM_METRICS);
            % Set true to those metrics which you wish to render
            obj.bp_render(analyze_complexity.METRIC_COMPILE_TIME) = true;
        end
        
        function obj = populate(obj)
            examples_a = {'sldemo_fuelsys', 'sldemo_auto_climatecontrol', 'sldemo_autotrans', 'sldemo_auto_carelec', 'sldemo_suspn', 'sldemo_auto_climate_elec',...
                'sldemo_absbrake', 'sldemo_enginewc', 'sldemo_engine', 'sldemo_fuelsys_dd', 'sldemo_clutch', 'sldemo_clutch_if'};
            examples_b = {'aero_guidance', 'sldemo_radar_eml', 'aero_atc', 'slexAircraftPitchControlExample', 'aero_six_dof', 'aero_dap3dof',...
                'slexAircraftExample', 'aero_guidance_airframe'};
            examples_c = {'sldemo_antiwindup', 'sldemo_pid2dof', 'sldemo_bumpless'};
            examples_d = {'aeroblk_wf_3dof', 'asbdhc2', 'asbswarm', 'aeroblk_HL20', 'asbQuatEML', 'aeroblk_indicated', 'aeroblk_six_dof',...
                'asbGravWPrec', 'aeroblk_calibrated', 'aeroblk_self_cond_cntr',};
            examples_e = {'sldemo_mdlref_variants_enum', 'sldemo_mdlref_bus','sldemo_mdlref_conversion','sldemo_mdlref_counter_datamngt','sldemo_mdlref_dsm','sldemo_mdlref_dsm_bot','sldemo_mdlref_dsm_bot2','sldemo_mdlref_F2C'};

            obj.examples = [examples_a, examples_b, examples_c, examples_d, examples_e];
%             obj.examples = examples_e;
%             obj.examples = {'sldemo_mdlref_counter_datamngt'};


            
            % Research
            
            research_a = {'Blending_Challenge', 'CSTHDisturbedStdOp1', 'CSTHDisturbedStdOp2', 'wind_turbine2'};
            research_b = {'fir8_03', 'fir12_03', 'pct_03', 'pid_03', 'pid_02', 'fir16tap', 'iir_biquad', 'pct', 'ACS', 'ALS',...
                'Boiler_MIMOControl_PID12', 'Boiler_SISOControl_PID12', };
            research_c = {'benchmark_no_taylor', 'benchmark'};
            research_d = {'slsf_buck', 'flyback_openloop', 'forward_conv', 'forward_conv_hyst', 'fwr', 'buck_hvoltage2', 'pll'};
%             research_e = {'AbstractFuelControl_M1', 'AbstractFuelControl_M2', 'AbstractFuelControl_M3'};
            research_f = {'SimplifiedWTModel', 'testHarness', 'AbstractFuelControl_M1_Aquino'};
            
            obj.research = [research_a, research_b, research_c, research_d research_f];
            
%             obj.research = research_e;
            
            % GitHub
            
            gh_a = {'AC_Quadcopter_Simulation', 'PC_Quadcopter_Simulation', 'Team37_Quadcopter_Simulation'};
            gh_b = {'GasTurbine_Dyn_Template', 'Plant_GasTurbine', 'GasTurbine_SS_Template', 'JT9D_Model_Dyn', 'JT9D_Model_SS', 'JT9D_SS_Cantera_Template', ...
                'NewtonRaphson_Equation_Solver', 'TTECTrA_example', 'qpsktxrx', 'ModeS_FixPt_Pipelined_ADI', 'ModeS_Simulink_libiio', 'JT9D_Model_Lin',  'JT9D_Model_PWLin'};
            gh_c = {'fourBar', 'hackrf_simple_tx_demo', 'hackrf_spectrum_scope_demo', 'HEV', 'motorcontroller'};
            gh_d = { 'ATWS',  'DCMotor',  'DEVICE1',  'LQR',  'OCA_2_Prop',  'OCA_SUB',  'OCA_SUB_modified',  'Orientation',  'PID',  'PR9',  'QTM2SI',  'Transmitter',  'XC',  'aa',  'analogicalgates',  'bianpinx1',  'danxiangjiangya',  'danxiangtiaoya',  'demostration09',  'demostration1',  'enginecontroller',  'feedforward1',  'feedforward2',  'jieyue',  'measurement',  'modello',  'nibian',  'pdcontrol',  'picpicpic',  'pidmodel',  'powercontroller',  'prog2',  'proj',  'quadtestmodel',  'rasberry',  'rester',  'robotjointmodel',  'shengyazhanbo',  'simone',  'simulation',  'test',  'testmodel',  'transmissioncontroller',  'u2pwm',  'untitled1_slx',  'vehiclecontroller',  'zh2fsk',  'zhengliu',  'Ackermann',  'Arrays1',  'Arrays2',  'Arrays3_0',  'Arrays3_1',  'Counter_with_prop',  'CruiseControl3',  'Early1',  'Events1',  'Events2',  'Events3',  'Events3Out',  'Events4',  'Events5',  'Events6',  'Events7',  'Flowchart1',  'Flowchart10',  'Flowchart2',  'Flowchart3',  'Flowchart4',  'Flowchart5',  'Flowchart6',  'Flowchart7',  'Flowchart8',  'Flowchart9',  'GraphFun1',  'Hierarchy1',  'Hierarchy2',  'Hierarchy3',  'Hierarchy4',  'History1',  'Iek1',  'Iek2',  'Inner1',  'Inner2',  'Inner3',  'Inner4',  'Junctions1',  'Junctions2',  'Junctions3',  'Junctions4',  'Junctions5',  'Junctions6',  'Junctions7',  'Junctions8',  'Junctions9',  'Loops1',  'Loops10',  'Loops2',  'Loops3',  'Loops4',  'Loops5',  'Loops6',  'Loops7',  'Loops8',  'Loops9',  'Nonterm1',  'On1',  'Outer1',  'Parallel1',  'Parallel2',  'Parallel3',  'Parallel4',  'Parallel5',  'ROSACE_VA_control',  'ROSACE_VA_control_simu',  'SetReset',  'SetResetOut',  'SetResetWait',  'SetResetWaitOut',  'SfSecurity',  'Single1',  'Stopwatch1',  'Stopwatch2',  'Subsys1',  'Super1',  'Super10',  'Super11',  'Super12',  'Super13',  'Super2',  'Super2Out',  'Super3',  'Super4',  'Super5',  'Super6',  'Super7',  'Super8',  'Super9',  'Temporal1',  'Twochart1'  };


%             obj.github = gh_d; %g1
%             obj.github_complex = [gh_a, gh_b, gh_c]; %g2


            obj.simple = [obj.mc_simple, gh_d];
            obj.complex = [obj.mc_complex_e, obj.mc_rest, obj.mc_complex, gh_a, gh_b, gh_c];
        end
    end
    
    methods(Static)
        
        function get_cf_models()
            target_dir = 'success';
            cur_path = ['publicmodels' filesep 'collection' filesep target_dir]
            addpath(genpath(cur_path));
            
            slx_files = dir([cur_path filesep 'sampleModel*.slx']);
            for i=1:numel(slx_files)
                x = strsplit(slx_files(i).name, '.slx');
                assert(numel(x) == 2)
                fprintf('''%s'', ', x{1});
%                 all_files.add(x{1});
            end
            fprintf('\n');
        end
        
        function ret = get_models(loc, prelist)
            
            if nargin == 1
                prelist = [];
            end
            
            block_count_threshold = 100;
            
            base_dir = 'publicmodels';
            full_loc = [base_dir filesep loc];
            
            
            all_files = mycell();
            children = mymap();
            final_ret = mycell();
            
            addpath(genpath(full_loc));
            
            all_path = genpath(full_loc);
            all_path=  strsplit(all_path, ';');
            
            for a_i = 1:numel(all_path)
                cur_path = all_path{a_i};
                
                if isempty(cur_path)
                    continue;
                end
                
                fprintf('Exploring path %s\n', cur_path);
                
                slx_files = dir([cur_path filesep '*.slx']);
                for i=1:numel(slx_files)
                    x = strsplit(slx_files(i).name, '.slx');
                    assert(numel(x) == 2)
                    
                    if util.starts_with(x{1}, 'Lib_') || util.starts_with(x{1}, 'lib_')
                        continue;
                    end
                    
                    all_files.add(x{1});
                end

                mdl_files = dir([cur_path filesep '*.mdl']);
                for i=1:numel(mdl_files)
                    x = strsplit(mdl_files(i).name, '.mdl');
                    assert(numel(x) == 2)
                    
                    if util.starts_with(x{1}, 'Lib_') || util.starts_with(x{1}, 'lib_')
                        continue;
                    end

                    
                    all_files.add(x{1});
                end
            end
            
            for i=1:all_files.len
%                 fprintf('Analyzing %s\n', all_files.get(i));
                try
                    [mDep,~] = find_mdlrefs(all_files.get(i));
                catch
                    continue;
                end
                
                

                for j = 1:length(mDep)
%                     fprintf('Found children %s\n', mDep{j});
                    if ~ strcmp(all_files.get(i), mDep{j})
                        children.put(mDep{j}, 1);
                    end
                end
            end
            
            strbuf = '{';
            
            open_models = true;
            
            for i=1:all_files.len
                cur = all_files.get(i);
                if ~ children.contains(cur)

                    if open_models
                        try
                            open_system(cur);
                        catch
                            continue;
                        end
                        
                        try
                             close_system(cur);
                        catch
                        end
                    end
                    
                    if ~isempty(prelist) && ~ util.cell_str_in(prelist, cur)
                        fprintf('Skipping %s\n', cur);
                        continue;
                    end
                    
                    if mdlrefCountBlocks(cur) < block_count_threshold
                        fprintf('Skipping %s; %d \n', cur, mdlrefCountBlocks(cur));
                        continue;
                    end
                    
                    fprintf('\t\t** %s **\n', cur);
                    final_ret.add(cur);
                    strbuf = [strbuf ' ''' cur ''', '];
                    
                end
            end
            
            ret = final_ret.data;
            strbuf = [strbuf ' };']
            
            fprintf('Found %d children ||| %d models \n', children.len_keys(), final_ret.len);
        end
        
        
        function parse_github_repos()
            gh_data_file = 'github_data';
            load(gh_data_file);
            global github_repos;
            
            target_dir = ['publicmodels' filesep 'gms' filesep];
            
            num_reps = 0;
            
            for i=1:numel(github_repos)
                
                c = github_repos{i};
                
                if isempty(c)
                    continue;
                end
                
                c = strip(c);
                
                num_reps = num_reps + 1;
                
                repo_parts = strsplit(c, '/');
                
                system(['git clone ' c ' ' target_dir repo_parts{end}])
            end
        end
        
        function print_models_for_excel()
            acc = analyze_complexity_cfg();
            cat = sort(acc.examples);
            for i=1:numel(cat)
                fprintf('%s\n', cat{i});
            end
            fprintf('--- Done (%d) ---- \n', numel(cat));
        end
        
    end
    
end

