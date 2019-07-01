        identification division.
        program-id. e1-pgmmov.
        author. noe-uriel.

        environment division.
        input-output section.
        file-control.

        select clientes-input-file assign to "clientes_ord.dat"
        organization is line sequential.

        data division.
        file section.

        fd clientes-input-file.
        01 in-clientes.
          05 in-no-cte pic 9(10).
          05 in-nom-cte.
            10 in-1nom-cte pic X(20).
            10 in-2nom-cte pic X(20).
            10 in-apat-cte pic X(20).
            10 in-amat-cte pic X(20).
          05 in-rfc-cte pic X(13).
          05 in-eda-cte pic 9(3).
          05 in-fec-nac-cte.
            10 in-dia-nac-cte pic 9(2).
            10 filler pic X value '/'.
            10 in-mes-nac-cte pic 9(2).
            10 filler pic X value '/'.
            10 in-year-nac-cte pic 9(4).
          05 in-sex-cte pic X(1).
          05 in-dom-cte.
            10 in-cal-cte pic X(30).
            10 in-no-ext-cte pic 9(8).
            10 in-no-int-cte pic 9(8).
            10 in-mun-cte pic X(30).
            10 in-edo-cte pic X(30).
            10 in-pais-cte pic X(30).

        working-storage section.
        77 fin-fichero pic 9 value 0.
        77 id-cliente pic 9(10).
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
          move 0000123456 to id-cliente
          perform fetch_cliente
          stop run.
        fetch_cliente.
          move 0 to fin-fichero
          open input clientes-input-file
          perform until fin-fichero=1
            read clientes-input-file
              at end move 1 to fin-fichero
              not at end perform leer-cliente
            end-read
          end-perform.
          leer-cliente.
            if id-cliente equals in-no-cte
              move in-clientes to ws-clientes
              display ws-clientes
            end-if.
