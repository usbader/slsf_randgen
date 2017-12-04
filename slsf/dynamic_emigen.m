classdef dynamic_emigen < handle
    %DYNAMIC_EMIGEN Generate EMI-Variants statically
    %   Detailed explanation goes here
    
    properties
        sys;
    end
    
    methods
        function obj = dynamic_emigen(sys)
            obj.sys = sys;
        end
        
        
        function ret = create_single(obj)
            % Should create a single EMI variant and return it's name
            ret = obj.sys; %TODO: right now just passes itself. Not creating any different model
        end  
        
        function compile(obj) 
                eval([obj.sys '([],[],[], ''compile'')']);
        end
        
        function terminate(obj)
               eval([obj.sys '([],[],[], ''term'')']);
        end

        function ret = prune_deadBlocks(obj, deadBlocks)      
             % newObj = obj;
             %   save_system(obj.sys, strcat('/home/cyfuzz/workspace/slsf_randgen/slsf/',obj.sys,'_originalModel.slx'));
              open_system(obj.sys);
              
             %  compile(obj);
              
              
              blks = find_system(obj.sys, 'Type', 'block');
              listblks = get_param(blks, 'BlockType') ;


              for j = 1:length(deadBlocks) 
                for i = 1:length(listblks)                     
                     handle = getSimulinkBlockHandle(blks(i));
                   if (deadBlocks(j) == handle)
                   lines = get_param(blks(i),'PortConnectivity');
                   disp(numel(lines));
                   disp(lines);
                   %Get port handles
                   portHandles = get_param(handle,'PortHandles');
                   disp(portHandles);
                   %Get source port
                   for inportHandle=1:numel(portHandles.Inport) 
                       srcSignal = get_param(portHandles.Inport(inportHandle),'Line');
                       srcPort = get_param(srcSignal,'SrcPortHandle');
                       srcBlockHandle = get_param(srcSignal,'SrcBlockHandle');
                       dstBlockHandle = get_param(srcSignal,'DstBlockHandle');
                       display(srcPort);
                       display(srcSignal);
                       display(srcBlockHandle);
                       display(dstBlockHandle);
                       
                    
                       eval([obj.sys, '([],[],[],''compile'');'])
                       port = get(srcPort);
                 
                       disp(port);
                       disp(port.PortType);
                           
                        eval([obj.sys, '([],[],[],''term'');'])
                       
                       display(obj.sys);
                     
                                           
                       
                       %Get Destination port
                       fprintf('porthandles,Outport:\n');
                       disp(size(portHandles.Outport));
                       
                        delete_line(srcSignal);
                      
                       for outportHandle=1:numel(portHandles.Outport)
                       
                       destSignal = get_param(portHandles.Outport(outportHandle),'Line');
                       display(destSignal);
                       if(destSignal == -1)
                           break;
                       end
                       destPort = get_param(destSignal,'DstPortHandle');
                       display(destPort);                  
                       lastElementDstPort = destPort(end);
                       %Remove
                       delete_line(destSignal);
                       
                       %Reconnect
                       add_line(obj.sys,srcPort,lastElementDstPort)
                       newPortHandles = get_param(srcBlockHandle,'PortHandles');
                           for outportPrint=1:numel(newPortHandles.Outport)
                              
                              srcSignal1 = get_param(newPortHandles.Outport(outportPrint),'Line');
                              srcBlockHandle1 = get_param(srcSignal1,'SrcBlockHandle');
                              dstBlockHandle1 = get_param(srcSignal1,'DstBlockHandle');
                               if (srcBlockHandle == srcBlockHandle1)
                              display(srcBlockHandle1);
                              fprintf('dstBlockHandle1:\n');
                              display(dstBlockHandle1(end));
                              end
                           end
                     
                       end
                   end
                   delete_block(blks(i));
                   end
                 end
              end
            %delete_block(deadBlocks(i));
            % To test how many blocks there after pruning dead ones
            counter = 0;
            BlockHandles = util.get_all_top_level_blocks(obj.sys);
            for block_index=1:numel(BlockHandles)
                 block_handle = BlockHandles(block_index);
                counter=counter+1;
            end
            disp('count in dynamic:');
            disp(counter);
            if(cfg.SAVE_EMI_VAR == true)
              %      save_system(obj.sys, '/home/cyfuzz/workspace/slsf_randgen/slsf/EMI_VAR.slx');
           save_system(obj.sys, strcat('/home/cyfuzz/workspace/slsf_randgen/slsf/',obj.sys,'_EMI_Var.slx'));
           
        %   terminate(obj);
                
            end
            ret = obj; 
        end
       
    end   
end

