interface apb_if(input logic PCLK , input logic PRESETn);
  logic PSEL;
  logic PENABLE;
  logic PWRITE;
  logic [31:0] PADDR;
  logic [7:0] PWDATA;
  logic  [7:0] PRDATA;
  logic PREADY;
  logic PSLVERR;
  modport dut_mp(input PCLK,PRESETn,PSEL,PENABLE, PADDR,PWDATA,PWRITE,
                 output PRDATA,PREADY,PSLVERR);
  
endinterface
