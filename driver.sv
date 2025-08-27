class apb_driver extends uvm_driver #(packet);
  `uvm_component_utils(apb_driver)

  virtual apb_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  virtual task run_phase(uvm_phase phase);
    //packet p;
    forever begin
       packet p;
      seq_item_port.get_next_item(p);
      // Drive signals onto the APB interface
      //set-up phase
       vif.PSEL    <= 1;
       //@(posedge vif.PCLK);
      vif.PADDR   <= p.addr;
      vif.PWDATA  <= p.wdata;
      vif.PWRITE  <= p.write;
     // vif.PSEL    <= 1;
      vif.PENABLE <= 0;
      // access-phase
      @(posedge vif.PCLK);
            vif.PENABLE <= 1;
      //@(posedge vif.PCLK); 
      wait (vif.PREADY);
      @(posedge vif.PCLK); 
      if(!p.write)
        p.rdata=vif.PRDATA;
      `uvm_info("apb_driver",$sformatf("%s @ addr %0h : %0h", p.write? "write":"read", p.addr, p.write? p.wdata:p.rdata),UVM_MEDIUM)
       // @(posedge vif.PCLK);
      // Deassert signals
      vif.PSEL    <= 0;
      vif.PENABLE <= 0;
      vif.PREADY<=0;
       @(posedge vif.PCLK)
      seq_item_port.item_done();
    end
  endtask
endclass
  
//=================
