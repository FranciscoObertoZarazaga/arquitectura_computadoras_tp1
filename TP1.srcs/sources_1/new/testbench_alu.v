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
    parameter NB_INPUT_DATA = 4,   //Ancho Bus de datos de entrada
    parameter NB_OUTPUT_DATA = NB_INPUT_DATA,   //Ancho Bus de datos de salida
    parameter NB_OPERATION = 6  //Ancho Bus de operaciones
)
(
    output wire signed [NB_OUTPUT_DATA-1:0] testbench_out_data
);
    
    
    // Definición de Puertos del módulo
    integer i;
    integer num_tests = 1000;
    
    // Declaración de señales internas del módulo
    reg signed [NB_INPUT_DATA-1:0] testbench_in_data_a;
    reg signed [NB_INPUT_DATA-1:0] testbench_in_data_b;
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
        
        i = 0;
        while (i < num_tests) begin
            $display("Iteracion:", i);
            // Estímulos
    
            // Probar Suma (6'b100000)
            testbench_in_data_a = $random % 16;
            testbench_in_data_b = $random % 16;
            
            // Probar Suma (6'b100000)
            testbench_in_operation = 6'b100000;  // Suma
            #10;  // Esperar 10 unidades de tiempo
            if (testbench_out_data !== (testbench_in_data_a + testbench_in_data_b)) begin
                $display("ERROR: La suma es incorrecta en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         (testbench_in_data_a + testbench_in_data_b), testbench_out_data);
                $finish;
            end

            // Probar Resta (6'b100010)
            testbench_in_operation = 6'b100010;  // Resta
            #10;
            if (testbench_out_data !== (testbench_in_data_a - testbench_in_data_b)) begin
                $display("ERROR: La resta es incorrecta en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         (testbench_in_data_a - testbench_in_data_b), testbench_out_data);
                $finish;
            end
    
            // Probar AND (6'b100100)
            testbench_in_operation = 6'b100100;  // AND
            #10;
            if (testbench_out_data !== (testbench_in_data_a & testbench_in_data_b)) begin
                $display("ERROR: El AND es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         (testbench_in_data_a & testbench_in_data_b), testbench_out_data);
                $finish;
            end
    
            // Probar OR (6'b100101)
            testbench_in_operation = 6'b100101;  // OR
            #10;
            if (testbench_out_data !== (testbench_in_data_a | testbench_in_data_b)) begin
                $display("ERROR: El OR es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         (testbench_in_data_a | testbench_in_data_b), testbench_out_data);
                $finish;
            end
    
            // Probar XOR (6'b100110)
            testbench_in_operation = 6'b100110;  // XOR
            #10;
            if (testbench_out_data !== (testbench_in_data_a ^ testbench_in_data_b)) begin
                $display("ERROR: El XOR es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         (testbench_in_data_a ^ testbench_in_data_b), testbench_out_data);
                $finish;
            end
    
            // Probar NOR (6'b100111)
            testbench_in_operation = 6'b100111;  // NOR
            #10;
            if (testbench_out_data !== ~(testbench_in_data_a | testbench_in_data_b)) begin
                $display("ERROR: El NOR es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, in_data_b: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, testbench_in_data_b, 
                         ~(testbench_in_data_a | testbench_in_data_b), testbench_out_data);
                $finish;
            end
    
            // Probar SRA (6'b000011)
            testbench_in_operation = 6'b000011;  // SRA
            #10;
            if (testbench_out_data !== (testbench_in_data_a >>> testbench_in_data_b)) begin
                $display("ERROR: El SRA es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, (testbench_in_data_a >>> 1), testbench_out_data);
                $finish;
            end
    
            // Probar SRL (6'b000010)
            testbench_in_operation = 6'b000010;  // SRL
            #10;
            if (testbench_out_data !== (testbench_in_data_a >> testbench_in_data_b)) begin
                $display("ERROR: El SRL es incorrecto en el tiempo %0d", $time);
                $display("  in_data_a: %d, esperado: %d, obtenido: %d",
                         testbench_in_data_a, (testbench_in_data_a >> 1), testbench_out_data);
                $finish;
            end
            
            i = i + 1;
        end

        // Finalizar la simulación
        $finish;
    end
endmodule
