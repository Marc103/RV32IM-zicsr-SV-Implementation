/**
 * Generic simple write interface.
 * modified to have 'wr_size' component to define
 * how many of bits of wr_data is to be written (behavior of
 * what happens to the rest of the bits is undefined).
 * As well as 'wr_response' to check if write is successful.
 */

 interface generic_write_interface #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
 ) (
    input clock
 );
    logic                     write_clock;
    logic [$clog2(DEPTH)-1:0] write_address;
    logic                     write_valid;
    logic [WIDTH-1:0]         write_data;
    logic [$clog2(WIDTH)-1:0] write_size;
    logic                     write_response;

    modport A(input clock, write_clock, write_address, write_valid, write_data, write_size,
              output write_response);
    
    modport B(output write_clock, write_address, write_valid, write_data, write_size,
              input clock, write_response);

 endinterface