classdef emitester < handle
    %EMITESTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sys;    % Name of the random model
        simulation_data = [];
        my; % Instance of `singleresult`
    end
    
    methods(Static)
        function ret=get_total_emi_variant()
            % Return how many EMI variants would be created
            if cfg.EMI_TESTING
                ret =  cfg.NUM_STATIC_EMI_VARS;
            else
                ret = 0;
            end
            
        end
 
        function ret=get_total_dynamic_emi_variant()
        % Return how many Dynami EMI variants would be created
            if cfg.EMI_TESTING 
                ret = cfg.NUM_DYNAMIC_EMI_VARS;
            else
               ret = 0;
            end
        end
    end
    methods
        function obj = emitester(sys, my)
            % Constructor
            obj.sys =sys;
            obj.my = my;
            
           %obj.simulation_data = mycell(obj.get_total_emi_variant);
            obj.simulation_data = mycell(obj.get_total_dynamic_emi_variant);
        end
       
        function ret = go(obj, diff_tester)
           % go should call both static and dyanmic EMI Vars
           % obj.create_static_emi_vars(diff_tester);
             obj.create_dynamic_emi_vars(diff_tester);
            ret = obj.simulation_data;
        end
        
        function obj = create_static_emi_vars(obj, diff_tester)
            emi_creator = static_emigen(obj.sys);
            
            for i=1:cfg.NUM_STATIC_EMI_VARS
                single_emi_var = emi_creator.create_single();
                try
                    obj.simulation_data.add(obj.get_simulation_data_for_single_var(single_emi_var, diff_tester));
                catch e
                    fatal('Error in simulation data retrieval for EMI variant');
                    e
                end
            end
        end

    function obj = create_dynamic_emi_vars(obj, diff_tester)
           coverage = calculateModelCoverage(obj);
            emi_creator = dynamic_emigen(obj.sys);
            
             for i=1:cfg.NUM_STATIC_EMI_VARS
                single_emi_var = emi_creator.create_single();
                try
                    obj.simulation_data.add(obj.get_simulation_data_for_single_var(single_emi_var, diff_tester));
                catch e
                    getReport(e)
                    fatal('Error in simulation data retrieval for EMI variant');
                    e
                end
            end 
    
      
    end

    function cov = calculateModelCoverage(obj)
             open_system(obj.sys);
            fprintf('MOdel Name  : %s \n', obj.sys); 
      %   if ~ obj.my.is_valid_and_ok(singleresult.NORMAL_SIGLOG) || ~ obj.my.is_valid_and_ok(singleresult.ACC) || ~ obj.my.is_valid_and_ok(singleresult.RACC) 
             testObj = cvtest(obj.sys);
             data = cvsim(testObj);
             disp(data);
            counter=0;
            deadBlocks = [];
             vectorOfBlockHandles = util.get_all_top_level_blocks(obj.sys);
             if isvector(vectorOfBlockHandles)
                 g = sprintf('%s',vectorOfBlockHandles);
                 fprintf('Blocks: %s', g);
             end
             sumOfBlockCoverage = [0 0];
             %for block_handle in vectorOfBlockHandles
             for block_index=1:numel(vectorOfBlockHandles)
                 block_handle = vectorOfBlockHandles(block_index);
                counter=counter+1;
                 fprintf('block_handle: %s\n', block_handle);
                 [cov, desc] = executioninfo(data, block_handle);
                  %g = sprintf('%s', cov);
                 fprintf('\nCoverage : \n');
                disp(cov);
                fprintf('\nDescription : \n');
                disp(desc);
           
                fprintf('\n\n');
                 if isempty(cov)
                  %     fprintf('\nBlocks that have Empty Coverage\n');
                 % do something with blocks that do not have exe.cov info
                else
                    if cov(1)<cov(2)
                        deadBlocks(end+1) = block_handle;
                   end
                 %do something with executed block (calculate coverage)
                 sumOfBlockCoverage = sumOfBlockCoverage + cov;
                end       
            end
            
                    fprintf('Counter : %d \nBlocks: ', counter);
                    disp(sumOfBlockCoverage);
                    if sumOfBlockCoverage(1)< sumOfBlockCoverage(2)
                        fprintf('Some blocks do not have full coverage\n\n');
                    else
                        fprintf('Full Coverage achieved by this model.\n\n');
                    end
                    
                    fprintf(' dead block handles: \n');
                    fprintf('\n size:\n');
                    disp(size(deadBlocks));
                    fprintf('\n');
                    disp(deadBlocks);
                    % call dynamic_emigen to prune blocks
                    dynamicEMIGen = dynamic_emigen(obj.sys);
                    dynamicEMIGen.prune_deadBlocks(deadBlocks);
       %         else
               % Model is not valid
        %         cov = [0 0];
         %       end  
    end
        
        function ret = get_simulation_data_for_single_var(obj, sys, diff_tester)
            ret = diff_tester.get_logged_simulation_data(sys, 'normal', 'off');
            ret = diff_tester.retrieve_sim_data(ret);
        end
        
    end    
    
end

