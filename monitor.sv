class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)
  virtual apb_if vif;
      uvm_analysis_port #(packet) ap;
    
      function new(string name, uvm_component parent);
    super.new(name, parent);
        ap=new("ap",this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction
      
      virtual task run_phase(uvm_phase phase);
  packet p;
    forever begin
      @(posedge vif.PCLK);
      if(vif.PSEL && vif.PENABLE && vif.PREADY )
        begin
          p= packet::type_id::create("q");
          p.addr= vif. PADDR;
          p.wdata= vif. PWDATA;
          p.write= vif. PWRITE;
          p.rdata= vif. PRDATA;
          ap.write(p);
          `uvm_info("apb_monitor",$sformatf(" monitor saw %s at addr %0h :% 0h", p.write? "write":"read", p.addr, p.write? p.wdata:p.rdata),UVM_MEDIUM)        
        end
    end
    endtask
    endclass
