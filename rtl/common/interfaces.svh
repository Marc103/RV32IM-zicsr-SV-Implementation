/**
 * Generic simple read interface.
 * modified to have 'read_index' component to define
 * until which bit of read_data is valid (behavior of
 * what happens to the rest of the bits is undefined).
 * As well as 'read_response' to check if read completed.
 */

 interface generic_read_interface #(
    paramter WIDTH = 32,
    parameter DEPTH = 65536
 ) (
    input clock
 );
    logic [$clog2(DEPTH)-1:0] address;
    logic                     enable;
    logic [WIDTH-1:0]         data; 
    logic [$clog2(WIDTH)-1:0] index;
    logic                     response;

    modport A(input clock, address, enable, index,
              output response, data);

    modport B(output address, enable, index,
              input clock, response, data);

 endinterface

 /**
 * Generic simple write interface.
 * modified to have 'write_size' component to define
 * until which bit of write_data is to be written (behavior of
 * what happens to the rest of the bits is undefined).
 * As well as 'write_response' to check if write is successful.
 */

 interface generic_write_interface #(
    parameter WIDTH = 32,
    parameter DEPTH = 65536
 ) (
    input clock
 );
    logic [$clog2(DEPTH)-1:0] address;
    logic                     valid;
    logic [WIDTH-1:0]         data;
    logic [$clog2(WIDTH)-1:0] index;
    logic                     response;

    modport A(input clock, address, valid, data, index,
              output response);
    
    modport B(output address, valid, data, index,
              input clock, response);

 endinterface