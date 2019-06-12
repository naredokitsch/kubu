        identification division.
        program-id. e1-pgmcta.
        author. noe-uriel.
        environment division.
        input-output section.
        file-control.
        select clientes-output-file assign to "clientes.dat"
        organization is line sequential.
        data division.
        file section.
        fd clientes-output-file.
        01 e1-clientes.
            05 e1-no-cte pic 9(10).
            05 e1-nom-cte. 
                10 e1-1nom-cte pic X(20).
                10 e1-2nom-cte pic X(20).
                10 e1-apat-cte pic X(20).
                10 e1-amat-cte pic X(20).
            05 e1-rfc-cte pic X(13).
            05 e1-eda-cte pic 9(3).
            05 e1-fec-nac-cte.
                10 e1-dia-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 e1-mes-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 e1-year-nac-cte pic 9(4).
            05 e1-sex-cte pic X(1).
            05 e1-dom-cte.
                10 e1-cal-cte pic X(30).
                10 e1-no-ext-cte pic 9(8).
                10 e1-no-int-cte pic 9(8).
                10 e1-mun-cte pic X(30).
                10 e1-edo-cte pic X(30).
                10 e1-pais-cte pic X(30).
        working-storage section.
        77 fin-fichero pic 9 value 0.
        01 ws-clientes.
            05 ws-no-cte pic 9(10).
            05 ws-nom-cte. 
                10 ws-1nom-cte pic X(20).
                10 ws-2nom-cte pic X(20).
                10 ws-apat-cte pic X(20).
                10 ws-amat-cte pic X(20).
            05 ws-rfc-cte pic X(13).
            05 ws-eda-cte pic 9(3).
            05 ws-fec-nac-cte.
                10 ws-dia-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 ws-mes-nac-cte pic 9(2).
                10 filler pic X value '/'.
                10 ws-year-nac-cte pic 9(4).
            05 ws-sex-cte pic X(1).
            05 ws-dom-cte.
                10 ws-cal-cte pic X(30).
                10 ws-no-ext-cte pic 9(8).
                10 ws-no-int-cte pic 9(8).
                10 ws-mun-cte pic X(30).
                10 ws-edo-cte pic X(30).
                10 ws-pais-cte pic X(30).
        procedure division.
        inicio.
            open output clientes-output-file
            perform 1 times
                perform limpiar-pantalla
                perform agregar
            end-perform
            perform leer-clientes
            close clientes-output-file
            stop run.
        agregar.
            display "Introducir numero de cliente: "with no advancing
            accept ws-no-cte
            display "NOMBRE"
            display "   Primer Nombre: "with no advancing
            accept ws-1nom-cte           
            display "   Segundo Nombre: "with no advancing
            accept ws-2nom-cte
            display "   Apellido Paterno: "with no advancing
            accept ws-apat-cte           
            display "   Apellido Materno: "with no advancing
            accept ws-amat-cte
            display "Introducir RFC de cliente: "with no advancing
            accept ws-rfc-cte
            display "Introducir edad de cliente: "with no advancing
            accept ws-eda-cte
            display "Introducir fecha de nacimiento de cliente (dd/mm/aaaa): "with no advancing
            accept ws-fec-nac-cte
            display "Introducir sexo de cliente: "with no advancing
            accept ws-sex-cte
            display "DOMICILIO"
            display "   Calle: "with no advancing
            accept ws-cal-cte
            display "   Exterior: "with no advancing
            accept ws-no-ext-cte           
            display "   Interior: "with no advancing
            accept ws-no-int-cte
            display "   Municipio: "with no advancing
            accept ws-mun-cte           
            display "   Estado: "with no advancing
            accept ws-edo-cte
            display "   Pais: "with no advancing
            accept ws-pais-cte
            move ws-clientes to e1-clientes
            write e1-clientes.
        limpiar-pantalla.
            CALL "SYSTEM" USING "clear".
        leer-clientes.
            move 0 to fin-fichero
            close clientes-output-file
            open input clientes-output-file
            perform until fin-fichero=1
                read clientes-output-file
                    at end move 1 to fin-fichero
                    not at end perform leer-registro
                end-read
            end-perform.
        leer-registro.
            display e1-clientes.
