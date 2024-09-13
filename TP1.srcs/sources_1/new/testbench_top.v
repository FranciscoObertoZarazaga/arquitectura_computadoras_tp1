`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024
// Design Name: 
// Module Name: testbench_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench para el módulo 'top'.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module testbench_top
#(
    // Parámetros
    parameter NB_SWITCH = 6,
    parameter NB_INPUT_DATA = 4,
    parameter NB_OPERATION = 6
)
(
    output wire signed [NB_INPUT_DATA:0] test_result  // Resultado de la ALU (salida)
);

    // Señales internas
    reg [NB_SWITCH-1:0] test_switch;  // Switch de entrada
    reg test_boton_1, test_boton_2, test_boton_3;  // Botones de entrada

    // Instanciación del módulo 'top'
    top uut (
        .in_switch(test_switch),
        .in_boton_1(test_boton_1),
        .in_boton_2(test_boton_2),
        .in_boton_3(test_boton_3),
        .out_result(test_result)
    );

    // Proceso inicial para generar los estímulos
    initial begin
        // Monitor para observar las señales
        $monitor(
        "time=%0d, switch=%b, boton_1=%b, boton_2=%b, boton_3=%b, result=%d",
         $time, test_switch, test_boton_1, test_boton_2, test_boton_3, test_result
        );

        // Inicialización
        test_switch = 0;
        test_boton_1 = 0;
        test_boton_2 = 0;
        test_boton_3 = 0;
        #10;

        // Paso 1: Dar valor al switch y simular la pulsación del botón 1 (data_a)
        test_switch = 4'b0011;  // Valor para data_a (3 en decimal)
        test_boton_1 = 1;  // Presionar botón 1
        #10;  // Esperar 10 unidades de tiempo
        test_boton_1 = 0;  // Soltar botón 1
        #10;

        // Paso 2: Dar nuevo valor al switch y simular la pulsación del botón 2 (data_b)
        test_switch = 4'b0101;  // Valor para data_b (5 en decimal)
        test_boton_2 = 1;  // Presionar botón 2
        #10;  // Esperar 10 unidades de tiempo
        test_boton_2 = 0;  // Soltar botón 2
        #10;

        // Paso 3: Dar código de operación en el switch y simular la pulsación del botón 3 (operación)
        test_switch = 6'b100000;  // Código de operación para suma
        test_boton_3 = 1;  // Presionar botón 3
        #10;  // Esperar 10 unidades de tiempo
        test_boton_3 = 0;  // Soltar botón 3
        #10;

        // Comprobar el resultado de la operación
        if (test_result !== 8) begin
            $display("ERROR: La suma es incorrecta. Esperado: 8, Obtenido: %d", test_result);
        end else begin
            $display("Suma correcta: %d", test_result);
        end

        // Paso 4: Probar otra operación (por ejemplo, resta)
        test_switch = 6'b100010;  // Código de operación para resta
        test_boton_3 = 1;  // Presionar botón 3
        #10;
        test_boton_3 = 0;  // Soltar botón 3
        #10;

        // Comprobar el resultado de la operación de resta
        if (test_result !== -2) begin
            $display("ERROR: La resta es incorrecta. Esperado: -2, Obtenido: %d", test_result);
        end else begin
            $display("Resta correcta: %d", test_result);
        end

        // Fin de la simulación
        $finish;
    end

endmodule
