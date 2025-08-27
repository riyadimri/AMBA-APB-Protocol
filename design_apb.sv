//dut
module apb_slave(apb_if.dut_mp apb);

  logic [7:0] mem[0:15];

  always_ff @(posedge apb.PCLK or negedge apb.PRESETn) begin
    if (!apb.PRESETn) begin
      apb.PRDATA <= 0;
      apb.PREADY <= 0;
     end
    else begin
      
      if (apb.PSEL && apb.PENABLE) begin
        apb.PREADY <= 1;

        if (apb.PWRITE) begin
          mem[apb.PADDR[3:0]] <= apb.PWDATA;  // Write operation
        end else begin
          apb.PRDATA <= mem[apb.PADDR[3:0]];  // Read operation
        end
        end 
      else begin 
        apb.PREADY<=0;
        apb.PRDATA<=0;
       end
    end
  end

endmodule
  
  
