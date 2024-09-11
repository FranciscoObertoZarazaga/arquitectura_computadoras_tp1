`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 00:23:01
// Design Name: 
// Module Name: testbench_alu
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


module testbench_alu

#(
    // Parámetros
    parameter NB_DATA = 4,
    parameter NB_OPERATION = 6
)
(
    // Definición de Puertos del módulo
    wire signed [NB_DATA-1:0] testbench_out_data
);
    
    // Declaración de señales internas del módulo
    reg signed [NB_DATA-1:0] testbench_in_data_a;
    reg signed [NB_DATA-1:0] testbench_in_data_b;
    reg [NB_OPERATION-1:0] testbench_in_operation;
    
    // Instancia del módulo ALU (DUT)
    alu uut (  // UUT ~ Unit Under Test
        .in_data_a(testbench_in_data_a),
        .in_data_b(testbench_in_data_b),
        .in_operation(testbench_in_operation),
        .out_data(testbench_out_data)
    );


    // Proceso inicial para generar los estímulos
    initial begin
        // Monitor para observar las señales
        $monitor(
        "time=%0d, in_data_a=%d, in_data_b=%d, in_operation=%b, out_data=%d",
         $time, testbench_in_data_a, testbench_in_data_b, testbench_in_operation, testbench_out_data
        );

        // Estímulos

        // Probar Suma (6'b100000)
        testbench_in_data_a = 4'b0011;  // 3
        testbench_in_data_b = 4'b0001;  // 1
        testbench_in_operation = 6'b100000;  // Suma
        #10;  // Esperar 10 unidades de tiempo

        // Probar Resta (6'b100010)
        testbench_in_operation = 6'b100010;  // Resta
        #10;

        // Probar AND (6'b100100)
        testbench_in_operation = 6'b100100;  // AND
        #10;

        // Probar OR (6'b100101)
        testbench_in_operation = 6'b100101;  // OR
        #10;

        // Probar XOR (6'b100110)
        testbench_in_operation = 6'b100110;  // XOR
        #10;

        // Probar NOR (6'b100111)
        testbench_in_operation = 6'b100111;  // NOR
        #10;

        // Probar SRA (revisado)
        //tb_in_data_a = 4'b1100;  // -4 (en complemento a dos)
        //tb_in_data_b = 4'b0001;  // No se usa
        //tb_in_operation = 6'b000011;  // Desplazamiento aritmético a la derecha
        //#10;

        // Probar SRL (revisado)
        //tb_in_data_a = 4'b1100;  // -4
        //tb_in_operation = 6'b000010;  // Desplazamiento lógico a la derecha
        //#10;

        // Finalizar la simulación
        $finish;
    end
endmodule
