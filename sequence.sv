class apb_sequence extends uvm_sequence #(packet);
  `uvm_object_utils(apb_sequence)
  function new(string name="apb_sequence");
    super.new(name);
  endfunction
  virtual task body();
    packet p1,p2;
    //write operation
    p1=packet::type_id::create("p1");
    p1.addr=8'h5;
    p1.wdata=8'h10;
    p1.write=1;
    start_item(p1);
    finish_item(p1);
    //read operation
    p2=packet::type_id::create("p2");
    p2.addr=8'h5;
    p2.write=0;
    start_item(p2);
    finish_item(p2);
  endtask
endclass
