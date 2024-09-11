`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 21:50:13
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu
#(
    parameter NB_DATA = 4,   //Ancho Bus de datos
    parameter NB_PARAM = 6
)
(
    input wire [NB_DATA-1:0] in_datoA,
    input wire [NB_DATA-1:0] in_datoB,
    input wire [NB_PARAM-1:0] in_opALU,              //Operando de 6 bits
    output wire [NB_DATA-1:0] out_ResLeds,
    output reg [NB_DATA-1:0] out_resltReg
);

always @(*) begin
    case (in_opALU)
        6'b100000: out_resltReg = in_datoA + in_datoB;
        6'b100010: out_resltReg = in_datoA - in_datoB;
        6'b100100: out_resltReg = in_datoA & in_datoB;
        6'b100101: out_resltReg = in_datoA | in_datoB;
        6'b100110: out_resltReg = in_datoA ^ in_datoB;
        6'b000011: out_resltReg = ~(in_datoA | in_datoB);
        6'b000010: out_resltReg = (in_datoA < in_datoB) ? 1 : 0;
        6'b100111: out_resltReg = in_datoA * in_datoB;
    endcase
end

endmodule