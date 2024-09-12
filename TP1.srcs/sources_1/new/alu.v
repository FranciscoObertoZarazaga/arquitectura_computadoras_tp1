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
    // Parámetros
    parameter NB_INPUT_DATA = 4,   //Ancho Bus de datos de entrada
    parameter NB_OUTPUT_DATA = NB_INPUT_DATA + 1,   //Ancho Bus de datos de salida
    parameter NB_OPERATION = 6  //Ancho Bus de operaciones
)
(   
    // Definición de Puertos del módulo
    input wire signed [NB_INPUT_DATA-1:0] in_data_a,  //Dato de 4 bits
    input wire signed [NB_INPUT_DATA-1:0] in_data_b,  //Dato de 4 bits
    input wire [NB_OPERATION-1:0] in_operation,  //Operando de 6 bits
    output wire signed [NB_OUTPUT_DATA-1:0] out_data  //Resultado de 4 bits
);

// Declaración de señales internas del módulo
reg [NB_OUTPUT_DATA-1:0] tmp;

always @(*) begin
    case (in_operation)
        6'b100000: tmp = in_data_a + in_data_b;  // SUMA (+)
        6'b100010: tmp = in_data_a - in_data_b;  // RESTA (-)
        6'b100100: tmp = in_data_a & in_data_b;  // AND (&)
        6'b100101: tmp = in_data_a | in_data_b;  // OR (|)
        6'b100110: tmp = in_data_a ^ in_data_b;  // XOR ~ EXCLUSIVE OR (^)
        6'b000011: tmp = in_data_a >>> in_data_b;  // SRA ~ Slide Rigth Arithmetical (>>>)
        6'b000010: tmp = in_data_a >> in_data_b; // SRL ~ Slide Rigth Logical (>>)
        6'b100111: tmp = ~(in_data_a | in_data_b);  // NOR (~|)
        default:   tmp = {NB_OUTPUT_DATA{1'b1}};  // Todos los bits en 1
    endcase
end

assign out_data = tmp;

endmodule