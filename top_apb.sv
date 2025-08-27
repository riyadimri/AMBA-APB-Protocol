    `include "uvm_macros.svh"
    import uvm_pkg::*;
    module apb_tb;
      logic PCLK;
      logic PRESETn;
      
      apb_if apb_if_inst(PCLK,PRESETn);
      apb_slave dut (.apb(apb_if_inst));
      
      initial begin
        PCLK=0;
        forever #5 PCLK=~PCLK;
      end
      initial begin
       
         PRESETn=1;
      end
      
      initial begin
        $dumpfile("apb_wave.vcd");
        $dumpvars(0,apb_tb);
        $monitor("t= %0t |PSEL= %0b|PENABLE= %0b|PREADY= %0b |PWRITE= %0b |PADDR=%0h |PWDATA= %0h |PRDATA= %0h",$time,apb_if_inst. PSEL, apb_if_inst.PENABLE, apb_if_inst.PREADY, apb_if_inst.PWRITE,apb_if_inst.PADDR,apb_if_inst.PWDATA,apb_if_inst.PRDATA);
        uvm_config_db #(virtual apb_if)::set(null,"*","vif",apb_if_inst);
        run_test("apb_test");
      end
    endmodule
      
      
