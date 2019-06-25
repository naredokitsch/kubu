        identification division.
        program-id. e1-pgmmov.
        author. noe-uriel.
        environment division.
        input-output section.
        file-control.
        select movimientos-output-file assign to "movimientos.dat"
        organization is line sequential.
        data division.
        file section.
        fd movimientos-output-file.
        01 e1-movimientos.
            05 e1-no-mts-mts pic 9(13).
            05 e1-no-cte-mts pic 9(10).
            05 e1-cta-chq-mts pic 9(13).
            05 e1-cta-cbe-mts pic 9(20).
            05 e1-tipo-mts pic A(8).
            05 e1-sdo-mts pic S9(10)V99.
            05 e1-fech-mts pic 9(8).
        working-storage section.
        77 fin-fichero pic 9 value 0.
        77 inv-ws-sdo-mts pic S9(10)V99.
        01 ws-movimientos.
            05 ws-no-mts-mts pic 9(13).
            05 ws-no-cte-mts pic 9(10).
            05 ws-cta-chq-mts pic 9(13).
            05 ws-cta-cbe-mts pic 9(20).
            05 ws-tipo-mts pic A(8).
            05 ws-sdo-mts pic S9(10)V99.
            05 ws-fech-mts pic 9(8).
        procedure division.
        inicio-reg.
            open output movimientos-output-file
            perform 1 times
                perform limpiar-pantalla
                perform agregar
            end-perform
            perform leer-movimientos
            close movimientos-output-file
            stop run.
        agregar.
            display "Numero de movimiento(13): "with no advancing
            accept ws-no-mts-mts
            display "Numero de cliente(10): "with no advancing
            accept ws-no-cte-mts
            display "Numero de cuenta(13): "with no advancing
            accept ws-cta-chq-mts
            display "CLABE(20): "with no advancing
            accept ws-cta-cbe-mts           
            display "Tipo de movimiento A(8): "with no advancing
            accept ws-tipo-mts
            display "Monto movimiento S9(10)V99: "with no advancing
            accept ws-sdo-mts
            display "Fecha movimiento(ddmmaaaa): "with no advancing
            accept ws-fech-mts
            if ws-tipo-mts = "RETIRO  " then
                 subtract ws-sdo-mts from 0 giving inv-ws-sdo-mts
                 move inv-ws-sdo-mts to ws-sdo-mts
            end-if
            move ws-movimientos to e1-movimientos
            write e1-movimientos.
        limpiar-pantalla.
            CALL "SYSTEM" USING "clear".
        leer-movimientos.
            move 0 to fin-fichero
            close movimientos-output-file
            open input movimientos-output-file
            perform until fin-fichero=1
                read movimientos-output-file
                    at end move 1 to fin-fichero
                    not at end perform leer-registro
                end-read
            end-perform.
        leer-registro.
            display e1-sdo-mts
            display e1-movimientos.
