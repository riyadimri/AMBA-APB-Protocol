class apb_env extends uvm_env;
`uvm_component_utils(apb_env);
      apb_agent agent;
      apb_scoreboard scb;
      
      function new  (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent=apb_agent::type_id::create("agent",this);
    scb=apb_scoreboard::type_id::create("scb",this);
  endfunction 
      
    endclass
    
    
