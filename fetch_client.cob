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

        procedure division.
          sort clientes-work-file on ascending key e1-no-cte
          using clientes-input-file giving clientes-output-file.
          display "clientes ordenados".
        stop run.
