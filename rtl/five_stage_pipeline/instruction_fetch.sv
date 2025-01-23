////////////////////////////////////////////////////////////////
// Package imports
`include "../interfaces/generic_write_interface.svh"
`include "../interfaces/generic_read_interface.svh"


module instruction_fetch #(

) (
    input clock_i,
    input reset_n_i,
    input interrupt_i,
    input stall_i,
    input flush_i,
    output reg [31:0] instruction_o,
    output reg        valid_o,
    generic_read_interface.B read_B
);
    
    logic [15:0] pc = 16'h0100;
    logic [15:0] pc_next;

    // state to keep track of read requests
    logic [15:0] pc_saved = 16'h0100;
    logic [15:0] pc_saved_next;
    logic request = 0;
    logic request_next;
    logic clear = 0;
    logic clear_next;

    always_comb begin
        pc_next = pc + 4;

        read_B.address = pc;
        read_B.enable = 1; 
        read_B.index  = 15;
        valid_o = read_B.response;

        if(!stall_i) begin
            pc_next = pc;
            read_B.enable = 0;
        end

        if(!flush_i) begin
            pc_next = pc;
            read_B.enable = 0;
        end

        if(!reset_n_i) begin
            pc_next = 16'h0100;
            read_B.enable = 0;
        end

        // logic for read requests tracking

        pc_saved_next = pc;
        if(read_B.enable == 1) begin
            request_next = 1;
        end
        if(read_B.response == 1) begin
            read_request = 0;
            pc_saved_next = pc;
            // response without request?
            // not possible.
        end else begin
            if(request) begin
                pc_next = pc;
            end
        end


    
    end

    always@(posedge clock_i) begin
        pc <= pc_next;
    end

    assign instruction_o = read_B.data;

endmodule