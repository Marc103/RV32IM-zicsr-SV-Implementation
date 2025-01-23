/**
 * Generic simple read interface.
 * 
 */

 interface generic_read_interface #(
    paramter WIDTH = 8,
    parameter DEPTH = 256
 ) (
    input clock
 );
    logic read_clock;
    logic [$clog2(DEPTH)-1:0] read_address;
    logic read_enable;


 endinterface