class packet extends uvm_sequence_item;
  rand bit[31:0] addr;
  rand bit [7:0] wdata;
  rand bit  write;
   bit [7:0] rdata;
  rand bit psel;
  rand  bit penable;
  bit pready;
  bit pslverr;
  
  `uvm_object_utils_begin(packet) //factory registration
  `uvm_field_int(addr,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(wdata,UVM_ALL_ON|UVM_HEX)
  `uvm_field_int(write,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(rdata,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(psel,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(penable,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(pready,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(pslverr,UVM_ALL_ON|UVM_DEC)
  `uvm_object_utils_end 
  
  function new (string name="packet");
    super.new(name);
  endfunction
endclass
