        identification division.
        program-id. reporte-movimientos.
        author. noe-uriel.
        environment division.
        input-output section.
        file-control.
        select movimientos-file assign to "movimientos.dat"
        organization is line sequential.
        data division.
        file section.
        fd movimientos-file.
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
        77 current-client pic 9(3) value 1.
        77 current-client-balance pic S9(10)V99 value 0.
        77 total-clients-balance pic S9(12)V99 value 0.
        01 ws-movimientos.
            05 ws-no-mts-mts pic 9(13).
            05 ws-no-cte-mts pic 9(10).
            05 ws-cta-chq-mts pic 9(13).
            05 ws-cta-cbe-mts pic 9(20).
            05 ws-tipo-mts pic A(8).
            05 ws-sdo-mts pic S9(10)V99.
            05 ws-fech-mts pic 9(8).
        procedure division.
        inicio-reporte.
            perform limpiar-pantalla
            perform leer-movimientos
            close movimientos-file
            stop run.
        limpiar-pantalla.
            CALL "SYSTEM" USING "clear".
        leer-movimientos.
            move 0 to fin-fichero
            open input movimientos-file
            perform until fin-fichero=1
                read movimientos-file
                    at end move 1 to fin-fichero
                    not at end perform leer-registro
                end-read
            end-perform
            add current-client-balance to total-clients-balance
            display "El cliente " current-client " tiene un saldo de " current-client-balance.
            display "Saldo total de clientes: " total-clients-balance.
        leer-registro.
            move e1-movimientos to ws-movimientos
            if current-client not = ws-no-cte-mts then
                display "El cliente " current-client " tiene un saldo de " current-client-balance
                add current-client-balance to total-clients-balance
                add 1 to current-client
                move 0 to current-client-balance
           end-if
           add ws-sdo-mts to current-client-balance.
