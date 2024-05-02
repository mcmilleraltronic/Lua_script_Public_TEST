----------------------------
-- Digital Output Function --
-- Output_Terminal = Terminal Board Number For Digital Output
-- Output_Number = Output Number For The Digital Output
-- Input = Variable Name Used In Master Script Logic
----------------------------
function DigitalOutput_OneShot(Output_Terminal,Output_Number,Input)
    local Name = tostring(Output_Terminal)..tostring(Output_Number) 
    if not get_sVirt("_"..Name.."_FS") then
        set_sVirt("_"..Name.."_FS",1)
    end

    local Terminal = Output_Terminal
    local Output = Output_Number
    local DO_Cmd = Input

    -- Opened/Closed Control 
    if DO_Cmd ~= get_sVirt("_"..Name.."_Cmd_Last") then 
        set_sVirt("_"..Name.."_Output",DO_Cmd)
        set_sVirt("_"..Name.."_Cmd_Last",DO_Cmd)
    end

    set_do_val(Terminal,Output,get_sVirt("_"..Name.."_Output",0))
end


DigitalOutput_OneShot(1,3,Bypass_Output_Cmd) -- Example  1 = Output Terminal, 3 = Output Number, Bypass_Output_Cmd = Variable Name Used In Master Script Logic




