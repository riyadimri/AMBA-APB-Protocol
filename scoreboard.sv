class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard)
  uvm_analysis_imp #(packet, apb_scoreboard) ap_imp;
  bit [7:0] mem [int];           // reference model

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase );
    super.build_phase(phase);
    ap_imp = new("ap_imp", this);
  endfunction

   function void write(packet tr);
    if (tr.write) begin
      mem[tr.addr] = tr.wdata;
      `uvm_info("scoreboard", $sformatf("write stored :[%0h] =%0h ",tr.addr,tr.wdata),UVM_MEDIUM)
    end
    else begin
      if(mem.exists(tr.addr))begin
        if(mem[tr.addr]!=tr.rdata) begin
          `uvm_error("scoreboard",$sformatf("read mismatch"))
        end else begin
          `uvm_info("scoreboard", $sformatf("read mismatch"),UVM_MEDIUM)
        end     end end 

  endfunction
endclass

    
