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


module top
#(  
    // Parámetros
    parameter NB_SWITCH = 6,
    parameter NB_INPUT_DATA = 4,
    parameter NB_OPERATION = 6
)
(   
    // Definición de Puertos del módulo
    input wire signed [NB_SWITCH-1:0] in_switch,
    input wire in_boton_1,
    input wire in_boton_2,
    input wire in_boton_3,
    output wire signed [NB_INPUT_DATA:0] out_result
);

    // Señales internas
    reg signed [NB_INPUT_DATA-1:0] data_a;
    reg signed [NB_INPUT_DATA-1:0] data_b;
    reg [NB_OPERATION-1:0] operation;

    // Instancia de la ALU
    alu alu_instance (
        .in_data_a(data_a),
        .in_data_b(data_b),
        .in_operation(operation),
        .out_data(out_result)
    );

    // Lógica de control basada en los botones
    always @(in_boton_1 or in_boton_2 or in_boton_3) begin
        if (in_boton_1) begin
            data_a <= in_switch[NB_INPUT_DATA-1:0];  // Cargar los 4 bits de switch en data_a
        end
        else if (in_boton_2) begin
            data_b <= in_switch[NB_INPUT_DATA-1:0];  // Cargar los 4 bits de switch en data_b
        end
        else if (in_boton_3) begin
            operation <= in_switch[NB_OPERATION-1:0];  // Cargar los 6 bits del switch en operation
        end
    end



endmodule