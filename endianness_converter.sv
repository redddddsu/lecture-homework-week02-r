module endianness_converter(
    input wire clk,
    input reg[31:0] word,
    input wire endianness_in,
    input wire endianness_out,
    output reg[31:0] converted_word
);

// 1 is big
// 0 is little

always @ (posedge clk) 
    begin
        case ({endianness_in, endianness_out})
            2'b00: converted_word <= word;
            2'b11: converted_word <= word;
            2'b10: converted_word <= {word[7:0], word[15:8], word[23:16], word[31:24]};
            2'b01: converted_word <= {word[7:0], word[15:8], word[23:16], word[31:24]};
        endcase
    end

endmodule